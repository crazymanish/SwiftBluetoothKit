//
//  ScannedPeripheral.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import CoreBluetooth

/// Represents instance of scanned peripheral - containing it's advertisment data, rssi and peripheral itself.
/// To perform further actions `peripheral` instance variable can be used ia. to maintain connection.
public class ScannedPeripheral: ScannedPeripheralProtocol {
    /// Implementation of RxBluetoothKit ScannedPeripheral
    let rx: RxBluetoothKit.ScannedPeripheral
    
    /// Creates new `SPScannedPeripheral`
    /// - parameter ScannedPeripheral: containing it's advertisment data, rssi and peripheral itself.
    init(_ rxScannedPeripheral: RxBluetoothKit.ScannedPeripheral) {
        self.rx = rxScannedPeripheral
    }
    
    /// `Peripheral` instance, that allows to perform further bluetooth actions.
    public var peripheral: PeripheralProtocol {
        return Peripheral(rx.peripheral)
    }
    
    /// Advertisement data of scanned peripheral
    public var advertisementData: [String: Any] {
        return rx.advertisementData.advertisementData
    }
    
    /// A string containing the local name of a peripheral.
    public var localName: String? {
        return advertisementData[CBAdvertisementDataLocalNameKey] as? String
    }
    
    /// Scanned peripheral's RSSI value.
    public var rssi: NSNumber {
        return rx.rssi
    }
}
