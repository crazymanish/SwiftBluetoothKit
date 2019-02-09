//
//  Peripheral.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import CoreBluetooth

/// Peripheral is a class implementing ReactiveX API which wraps all Core Bluetooth functions
/// allowing to talk to peripheral like discovering characteristics, services and all of the read/write calls.
public class Peripheral: PeripheralProtocol {
    /// Implementation of RxBluetoothKit peripheral
    let rx: RxBluetoothKit.Peripheral
    
    /// Creates new `Peripheral`
    /// - parameter peripheral: Instance representing specific peripheral allowing to perform operations on it.
    init(_ rxPeripheral: RxBluetoothKit.Peripheral) {
        self.rx = rxPeripheral
    }
    
    /// Value indicating if peripheral is currently in connected state.
    public var isConnected: Bool {
        return rx.isConnected
    }
    
    ///  Current state of `Peripheral` instance described by [CBPeripheralState](https://developer.apple.com/documentation/corebluetooth/cbperipheralstate).
    ///  - returns: Current state of `Peripheral` as `CBPeripheralState`.
    public var state: CBPeripheralState {
        return rx.state
    }
    
    /// Current name of `Peripheral` instance. Analogous to [name](https://developer.apple.com/documentation/corebluetooth/cbperipheral/1519029-name) of `CBPeripheral`.
    public var name: String? {
        return rx.name
    }
    
    /// Unique identifier of `Peripheral` instance. Assigned once peripheral is discovered by the system.
    public var identifier: UUID {
        return rx.identifier
    }
    
    /// A list of services that have been discovered. Analogous to [services](https://developer.apple.com/documentation/corebluetooth/cbperipheral/1518978-services) of `CBPeripheral`.
    public var services: [ServiceProtocol]? {
        return rx.services?.map {
            Service($0)
        }
    }
}


extension Peripheral: Equatable {}

/// Compare two peripherals which are the same when theirs identifiers are equal.
///
/// - parameter lhs: First peripheral to compare
/// - parameter rhs: Second peripheral to compare
/// - returns: True if both peripherals are the same
public func == (lhs: Peripheral, rhs: Peripheral) -> Bool {
    return lhs.rx == rhs.rx
}

extension Peripheral: Hashable {
    // DJB Hashing
    public var hashValue: Int {
        let scalarArray: [UInt32] = []
        return scalarArray.reduce(5381) {
            ($0 << 5) &+ $0 &+ Int($1)
        }
    }
}
