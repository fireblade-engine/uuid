//
//  Shims.swift
//
//
//  Created by Christian Treffs on 13.01.21.
//

#if USE_FUNDATION_UUID
import struct Foundation.UUID
public typealias UUID = Foundation.UUID
#else
public typealias UUID = FRB_UUID
#endif
