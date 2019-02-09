//
//  Service.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import CoreBluetooth

/// Service is a class implementing ReactiveX which wraps CoreBluetooth functions related to interaction with [CBService](https://developer.apple.com/library/ios/documentation/CoreBluetooth/Reference/CBService_Class/)
public class Service: ServiceProtocol {
    /// Intance of RxBluetoothKit service class
    let rx: RxBluetoothKit.Service
    
    /// Creates new `SPService`
    /// - parameter service: Intance of RxBluetoothKit service class.
    init(_ rxService: RxBluetoothKit.Service) {
        self.rx = rxService
    }
    
    /// Peripheral to which this service belongs
    public var peripheral: PeripheralProtocol {
        return Peripheral(rx.peripheral)
    }
    
    /// True if service is primary service
    public var isPrimary: Bool {
        return rx.isPrimary
    }
    
    /// Service's UUID
    public var uuid: CBUUID {
        return rx.uuid
    }
    
    /// Service's characteristics
    public var characteristics: [CharacteristicProtocol]? {
        return rx.characteristics?.map {
            Characteristic($0)
        }
    }
}


extension Service: Equatable {}

/// Compare if services are equal. They are if theirs uuids are the same.
/// - parameter lhs: First service
/// - parameter rhs: Second service
/// - returns: True if services are the same.
public func == (lhs: Service, rhs: Service) -> Bool {
    return lhs.rx == rhs.rx
}
