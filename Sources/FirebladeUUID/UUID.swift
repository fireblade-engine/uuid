//
//  UUID.swift
//  FirebladeECSPackageDescription
//
//  Created by Christian Treffs on 04.11.17.
//

/// A RFC4122 compliant Universally Unique IDentifier (UUID).
///
/// <https://tools.ietf.org/html/rfc4122>
public struct UUID {
    public static let count: Int = 16 // https://tools.ietf.org/html/rfc4122#section-4.1

    @usableFromInline let bytes: ContiguousArray<UInt8>

    public init(_ bytes: ContiguousArray<UInt8>) {
        precondition(bytes.count == UUID.count, "An UUID must have a count of exactly \(UUID.count).")
        self.bytes = bytes
    }

    public init() {
        self.init(UUID.generateUUID())
    }

    public init?(uuidString: String) {
        guard uuidString.count == 2 * UUID.count + 4 else {
            // "An UUID string must have a count of exactly 36."
            return nil
        }

        var uuid: ContiguousArray<UInt8> = ContiguousArray<UInt8>(repeating: 0, count: UUID.count)
        let contiguousString: String = uuidString.split(separator: "-").joined()
        guard contiguousString.count == 2 * UUID.count else {
            // An UUID string must have exactly 4 separators
            return nil
        }
        var endIdx: String.Index = contiguousString.startIndex
        for index in 0..<UUID.count {
            let startIdx: String.Index = endIdx
            endIdx = contiguousString.index(endIdx, offsetBy: 2)
            let substring: Substring = contiguousString[startIdx..<endIdx]  // take 2 characters as one byte
            guard let byte = UInt8(substring, radix: UUID.count) else {
                return nil
            }
            uuid[index] = byte
        }
        self.init(uuid)
    }

    private static func generateUUID() -> ContiguousArray<UInt8> {
        var uuid: ContiguousArray<UInt8> = ContiguousArray<UInt8>(unsafeUninitializedCapacity: UUID.count) { uuidPtr, written in
            for i in 0..<UUID.count {
                uuidPtr[i] = UInt8.random(in: UInt8.min...UInt8.max)
            }
            written = UUID.count
        }
        makeRFC4122compliant(uuid: &uuid)
        return uuid
    }

    private static func makeRFC4122compliant(uuid: inout ContiguousArray<UInt8>) {
        uuid[6] = (uuid[6] & 0x0F) | 0x40 // version https://tools.ietf.org/html/rfc4122#section-4.1.3
        uuid[8] = (uuid[8] & 0x3f) | 0x80 // variant https://tools.ietf.org/html/rfc4122#section-4.1.1
    }

    @inlinable public var uuidString: String {
        var out = String()
        out.reserveCapacity(UUID.count)
        let separatorLayout: [Int] = [0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0]
        let separator: String = "-"
        var idx: Int = 0
        for byte in bytes {
            let char = String(byte, radix: UUID.count, uppercase: true)
            switch char.count {
            case 2:
                out.append(char)

            default:
                out.append("0" + char)
            }
            if separatorLayout[idx] == 1 {
                out.append(separator)
            }
            idx += 1
        }

        precondition(idx == UUID.count)
        precondition(out.count == 36)
        return out
    }

    /// One-at-a-Time hash
    /// http://eternallyconfuzzled.com/tuts/algorithms/jsw_tut_hashing.aspx
    @inlinable var oatHash: Int {
        var hash: Int = 0

        for index: Int in 0..<UUID.count {
            hash = hash &+ numericCast(bytes[index])
            hash = hash &+ (hash << 10)
            hash ^= (hash >> 6)
        }

        hash = hash &+ (hash << 3)
        hash ^= (hash << 11)
        hash = hash &+ (hash << 15)
        return hash
    }
}

extension UUID: Equatable {
    public static func == (lhs: UUID, rhs: UUID) -> Bool {
        return lhs.bytes == rhs.bytes
    }
}

extension UUID: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(oatHash)
    }
}

extension UUID: CustomStringConvertible {
    public var description: String { return uuidString }
}

extension UUID: CustomDebugStringConvertible {
    public var debugDescription: String { return uuidString }
}
