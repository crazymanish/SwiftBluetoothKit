//
//  PeripheralProtocol.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation
import CoreBluetooth

public protocol PeripheralProtocol: class {
    /// Value indicating if peripheral is currently in connected state.
    var isConnected: Bool { get }
    
    ///  Current state of `Peripheral` instance described by [CBPeripheralState](https://developer.apple.com/documentation/corebluetooth/cbperipheralstate).
    ///  - returns: Current state of `Peripheral` as `CBPeripheralState`.
    var state: CBPeripheralState { get }
    
    /// Current name of `Peripheral` instance. Analogous to [name](https://developer.apple.com/documentation/corebluetooth/cbperipheral/1519029-name) of `CBPeripheral`.
    var name: String? { get }
    
    /// Unique identifier of `Peripheral` instance. Assigned once peripheral is discovered by the system.
    var identifier: UUID { get }
    
    /// A list of services that have been discovered. Analogous to [services](https://developer.apple.com/documentation/corebluetooth/cbperipheral/1518978-services) of `CBPeripheral`.
    var services: [ServiceProtocol]? { get }
}

extension PeripheralProtocol {
    var nameOrDefaultName: String {
        return self.name ?? "name"
    }
}
