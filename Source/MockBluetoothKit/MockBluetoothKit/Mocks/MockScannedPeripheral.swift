//
//  MockScannedPeripheral.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 15/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import CoreBluetooth
import SwiftBluetoothKit

public class MockScannedPeripheral: ScannedPeripheralProtocol {
    public var peripheral: PeripheralProtocol {
        return MockPeripheral()
    }
    
    public var advertisementData: [String : Any] {
        return ["localName" : "BT Device Name" as Any]
    }
    
    public var localName: String? {
        return advertisementData["localName"] as? String
    }
    
    public var rssi: NSNumber {
        return -50
    }
    
    
    // MARK:- Init
    public init() {}
}
