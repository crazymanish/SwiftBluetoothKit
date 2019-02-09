//
//  CharacteristicProtocol.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation
import CoreBluetooth

public protocol CharacteristicProtocol: class {
    /// Service which contains this characteristic
    var service: ServiceProtocol { get }
    
    /// Current value of characteristic. If value is not present - it's `nil`.
    var value: Data? { get }
    
    /// The Bluetooth UUID of the `Characteristic` instance.
    var uuid: CBUUID { get }
    
    /// Flag which is set to true if characteristic is currently notifying
    var isNotifying: Bool { get }
    
    /// Properties of characteristic. For more info about this refer to [CBCharacteristicProperties](https://developer.apple.com/library/ios/documentation/CoreBluetooth/Reference/CBCharacteristic_Class/#//apple_ref/c/tdef/CBCharacteristicProperties)
    var properties: CBCharacteristicProperties { get }
}
