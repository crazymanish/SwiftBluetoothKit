//
//  MockService.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import CoreBluetooth
import SwiftBluetoothKit

public class MockService: ServiceProtocol {
    public var peripheral: PeripheralProtocol {
        return MockPeripheral(.connected)
    }
    
    public var isPrimary: Bool {
        return true
    }
    
    public var uuid: CBUUID {
        return CBUUID(string: "BT Device MockService UUID")
    }
    
    public var characteristics: [CharacteristicProtocol]? {
        return [MockCharacteristic()]
    }
    
    // MARK:- Init
    public init() {}
}
