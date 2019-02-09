//
//  MockPeripheral.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import CoreBluetooth
import SwiftBluetoothKit

public class MockPeripheral: PeripheralProtocol {
    /// Intance of MockCharacteristic current value
    let currentState: CBPeripheralState
    
    /// Creates new `MockPeripheral`
    /// - parameter currentState: Current State of MockPeripheral.
    init(_ currentState: CBPeripheralState) {
        self.currentState = currentState
    }
    
    public convenience init() {
        self.init(.disconnected)
    }
    
    public var isConnected: Bool {
        return state == .connected
    }
    
    public var state: CBPeripheralState {
        return currentState
    }
    
    public var name: String? {
        return "BT Device Name"
    }
    
    public var identifier: UUID {
        return UUID(uuidString: "E621E1F8-C36C-495A-93FC-0C247A3E6E5F")!
    }
    
    public var services: [ServiceProtocol]? {
        return [MockService()]
    }
}
