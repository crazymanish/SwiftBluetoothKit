//
//  Characteristic.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import CoreBluetooth

/// Characteristic is a class implementing ReactiveX which wraps CoreBluetooth functions related to interaction with [CBCharacteristic](https://developer.apple.com/library/ios/documentation/CoreBluetooth/Reference/CBCharacteristic_Class/)
public class Characteristic: CharacteristicProtocol {
    /// Intance of RxBluetoothKit characteristic class
    let rx: RxBluetoothKit.Characteristic
    
    /// Creates new `Characteristic`
    /// - parameter characteristic: Intance of RxBluetoothKit characteristic class.
    init(_ rxCharacteristic: RxBluetoothKit.Characteristic) {
        self.rx = rxCharacteristic
    }
    
    /// Service which contains this characteristic
    public var service: ServiceProtocol {
        return Service(rx.service)
    }
    
    /// Current value of characteristic. If value is not present - it's `nil`.
    public var value: Data? {
        return rx.value
    }
    
    /// The Bluetooth UUID of the `Characteristic` instance.
    public var uuid: CBUUID {
        return rx.uuid
    }
    
    /// Flag which is set to true if characteristic is currently notifying
    public var isNotifying: Bool {
        return rx.isNotifying
    }
    
    /// Properties of characteristic. For more info about this refer to [CBCharacteristicProperties](https://developer.apple.com/library/ios/documentation/CoreBluetooth/Reference/CBCharacteristic_Class/#//apple_ref/c/tdef/CBCharacteristicProperties)
    public var properties: CBCharacteristicProperties {
        return rx.properties
    }
}


extension Characteristic: Equatable {}

/// Compare two characteristics. Characteristics are the same when their UUIDs are the same.
///
/// - parameter lhs: First characteristic to compare
/// - parameter rhs: Second characteristic to compare
/// - returns: True if both characteristics are the same.
public func == (lhs: Characteristic, rhs: Characteristic) -> Bool {
    return lhs.rx == rhs.rx
}

extension Characteristic {
    // A characteristic's properties can provide you information if it responds to a write operation. If it does, it can
    // be either responding to the operation or not. In this implementation it was decided to provide .withResponse if
    // it is the operation can be responded and ignoring .withoutResponse type.
    func determineWriteType() -> CBCharacteristicWriteType? {
        let writeType = self.rx.properties.contains(.write) ? CBCharacteristicWriteType.withResponse :
            self.rx.properties.contains(.writeWithoutResponse) ? CBCharacteristicWriteType.withoutResponse : nil
        return writeType
    }
}

extension Characteristic: Hashable {
    // DJB Hashing
    public var hashValue: Int {
        let scalarArray: [UInt32] = []
        return scalarArray.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
}
