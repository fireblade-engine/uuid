//
//  Shims.swift
//
//
//  Created by Christian Treffs on 13.01.21.
//

#if USE_FRB_UUID
public typealias UUID = FRB_UUID
public typealias UUID_t = (UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8)
#else
import struct Foundation.UUID
import typealias Foundation.uuid_t
public typealias UUID = Foundation.UUID
public typealias UUID_t = uuid_t
#endif
