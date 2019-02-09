//
//  MockCharacteristic.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import CoreBluetooth
import SwiftBluetoothKit

public class MockCharacteristic: CharacteristicProtocol {
    /// Intance of MockCharacteristic current value
    let currentValue: Data
    
    /// Creates new `MockCharacteristic`
    /// - parameter currentValue: Current Value of MockCharacteristic.
    init(_ currentValue: Data) {
        self.currentValue = currentValue
    }
    
    public convenience init() {
        self.init("Stub".data(using: .utf8)!)
    }
    
    public var service: ServiceProtocol {
        return MockService()
    }
    
    public var value: Data? {
        return currentValue
    }
    
    public var uuid: CBUUID {
        return CBUUID(string: "BT Device MockCharacteristic UUID")
    }
    
    public var isNotifying: Bool {
        return true
    }
    
    public var properties: CBCharacteristicProperties {
        return CBCharacteristicProperties.writeWithoutResponse
    }
}
