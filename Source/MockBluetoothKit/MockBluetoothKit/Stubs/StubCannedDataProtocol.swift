//
//  StubCannedDataProtocol.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import SwiftBluetoothKit

public protocol StubCannedDataProtocol {

    //  Canned Data for Bluetooth-State.
    var state: BluetoothState { get set }
    
    //  Canned Data for Bluetooth-Scanned Peripheral.
    var scannedPeripheral: ScannedPeripheralProtocol { get set }
    
    //  Canned Data for Bluetooth Peripheral.
    var peripheral: PeripheralProtocol { get set }
    
    //  Canned Data for Bluetooth Peripheral Disconnection Reason.
    var disconnectionReason: Error { get set }
    
    //  Canned Data for Bluetooth Peripheral services.
    var services: [ServiceProtocol] { get set }
    
    //  Canned Data for Bluetooth Peripheral characteristics.
    var characteristics: [CharacteristicProtocol] { get set }
}
