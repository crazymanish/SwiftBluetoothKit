//
//  BluetoothState.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation

/// Type describing bluetooth state, equivalent to
/// [CBManagerState](https://developer.apple.com/documentation/corebluetooth/cbmanagerstate).
public enum BluetoothState: Int {
    case unknown
    case resetting
    case unsupported
    case unauthorized
    case poweredOff
    case poweredOn
}
