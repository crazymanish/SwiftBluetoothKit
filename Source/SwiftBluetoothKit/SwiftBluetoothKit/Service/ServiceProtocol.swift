//
//  ServiceProtocol.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import Foundation
import CoreBluetooth

public protocol ServiceProtocol: class {
    /// Peripheral to which this service belongs
    var peripheral: PeripheralProtocol { get }
    
    /// True if service is primary service
    var isPrimary: Bool { get }
    
    /// Service's UUID
    var uuid: CBUUID { get }
    
    /// Service's characteristics
    var characteristics: [CharacteristicProtocol]? { get }
}
