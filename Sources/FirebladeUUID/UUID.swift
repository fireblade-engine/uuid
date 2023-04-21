//
//  FRB_UUID.swift
//  FirebladeECSPackageDescription
//
//  Created by Christian Treffs on 04.11.17.
//

#if USE_FRB_UUID
    /// A RFC4122 compliant Universally Unique IDentifier (UUID).
    ///
    /// <https://tools.ietf.org/html/rfc4122>
    public struct FRB_UUID {
        @usableFromInline let bytes: ContiguousArray<UInt8>

        public init(_ bytes: ContiguousArray<UInt8>) {
            precondition(bytes.count == FRB_UUID.count, "A UUID must have a count of exactly \(FRB_UUID.count).")
            self.bytes = bytes
        }

        public init(uuid: UUID_t) {
            let bytes = withUnsafePointer(to: uuid) { ptr -> ContiguousArray<UInt8> in
                let start = UnsafeRawPointer(ptr).assumingMemoryBound(to: UInt8.self)
                let count = MemoryLayout<UUID_t>.stride / MemoryLayout<UInt8>.stride
                let buffer = UnsafeBufferPointer<UInt8>(start: start, count: count)
                return ContiguousArray<UInt8>(buffer)
            }
            self.init(bytes)
        }

        public init() {
            self.init(FRB_UUID.generateUUID())
        }

        public init?(uuidString: String) {
            // "An UUID string must have a count of exactly 36."
            guard uuidString.count == 2 * FRB_UUID.count + 4 else {
                return nil
            }

            var uuid = ContiguousArray<UInt8>(repeating: 0, count: FRB_UUID.count)
            let contiguousString: String = uuidString.split(separator: "-").joined()
            // An UUID string must have exactly 4 separators
            guard contiguousString.count == 2 * FRB_UUID.count else {
                return nil
            }
            var endIdx: String.Index = contiguousString.startIndex
            for index in 0 ..< FRB_UUID.count {
                let startIdx: String.Index = endIdx
                endIdx = contiguousString.index(endIdx, offsetBy: 2)
                let substring: Substring = contiguousString[startIdx ..< endIdx] // take 2 characters as one byte
                guard let byte = UInt8(substring, radix: FRB_UUID.count) else {
                    return nil
                }
                uuid[index] = byte
            }
            self.init(uuid)
        }

        private static func generateUUID() -> ContiguousArray<UInt8> {
            #if swift(>=5.1)
                var uuid = ContiguousArray<UInt8>(unsafeUninitializedCapacity: FRB_UUID.count) { uuidPtr, written in
                    for offset in 0 ..< FRB_UUID.count {
                        uuidPtr[offset] = UInt8.random(in: UInt8.min ... UInt8.max)
                    }
                    written = FRB_UUID.count
                }
            #else
                var uuid = ContiguousArray<UInt8>(repeating: 0, count: FRB_UUID.count)
                for offset in 0 ..< FRB_UUID.count {
                    uuid[offset] = UInt8.random(in: UInt8.min ... UInt8.max)
                }

            #endif
            makeRFC4122compliant(uuid: &uuid)
            return uuid
        }

        private static func makeRFC4122compliant(uuid: inout ContiguousArray<UInt8>) {
            uuid[6] = (uuid[6] & 0x0F) | 0x40 // version https://tools.ietf.org/html/rfc4122#section-4.1.3
            uuid[8] = (uuid[8] & 0x3F) | 0x80 // variant https://tools.ietf.org/html/rfc4122#section-4.1.1
        }

        @inlinable public var uuidString: String {
            var out = String()
            out.reserveCapacity(FRB_UUID.count)
            let separatorLayout: [Int] = [0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0]
            let separator = "-"
            var idx = 0
            for byte in bytes {
                let char = String(byte, radix: FRB_UUID.count, uppercase: true)
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

            precondition(idx == FRB_UUID.count)
            precondition(out.count == 36)
            return out
        }

        /// One-at-a-Time hash
        /// http://eternallyconfuzzled.com/tuts/algorithms/jsw_tut_hashing.aspx
        @inlinable var oatHash: Int {
            var hash = 0

            for index: Int in 0 ..< FRB_UUID.count {
                hash = hash &+ numericCast(bytes[index])
                hash = hash &+ (hash << 10)
                hash ^= (hash >> 6)
            }

            hash = hash &+ (hash << 3)
            hash ^= (hash << 11)
            hash = hash &+ (hash << 15)
            return hash
        }

        public var uuid: UUID_t {
            UUID_t(bytes[0],
                   bytes[1],
                   bytes[2],
                   bytes[3],
                   bytes[4],
                   bytes[5],
                   bytes[6],
                   bytes[7],
                   bytes[8],
                   bytes[9],
                   bytes[10],
                   bytes[11],
                   bytes[12],
                   bytes[13],
                   bytes[14],
                   bytes[15])
        }
    }

    extension FRB_UUID: Equatable {
        public static func == (lhs: FRB_UUID, rhs: FRB_UUID) -> Bool {
            lhs.bytes == rhs.bytes
        }
    }

    extension FRB_UUID: Hashable {
        public func hash(into hasher: inout Hasher) {
            hasher.combine(oatHash)
        }
    }

    extension FRB_UUID: CustomStringConvertible {
        public var description: String { uuidString }
    }

    extension FRB_UUID: CustomDebugStringConvertible {
        public var debugDescription: String { uuidString }
    }

#endif
