//
//  ExceptionCannedDataProtocol.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import SwiftBluetoothKit

public protocol ExceptionCannedDataProtocol {
    
    //  Canned Data for Bluetooth-State.
    var state: BluetoothState { get set }
    
    //  Canned Data for Bluetooth-Exception.
    var error: Error { get set }
}
