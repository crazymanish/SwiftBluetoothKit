//
//  ScannedPeripheralProtocol.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation
import CoreBluetooth

public protocol ScannedPeripheralProtocol: class {
    /// `Peripheral` instance, that allows to perform further bluetooth actions.
    var peripheral: PeripheralProtocol { get }
    
    /// Advertisement data of scanned peripheral
    var advertisementData: [String: Any] { get }
    
    /// A string containing the local name of a peripheral.
    var localName: String? { get }
    
    /// Scanned peripheral's RSSI value.
    var rssi: NSNumber { get }
}
