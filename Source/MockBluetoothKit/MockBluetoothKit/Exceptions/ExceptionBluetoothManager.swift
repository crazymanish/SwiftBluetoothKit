//
//  ExceptionBluetoothManager.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import CoreBluetooth
import SwiftBluetoothKit

public class ExceptionBluetoothManager: ExceptionCannedDataProtocol {
    
    // MARK: - Set Default Canned Data value.
    public var error: Error = StubBluetoothError.unknown("This is default error.")
    public var state: BluetoothState = .poweredOn //Default Value is `BluetoothState.PowerdOn`
    
    // Refer Currently Connected Peripheral.
    public internal (set) var connectedPeripheral: PeripheralProtocol?
    // Refer Currently Connected Characteristic.
    public var connectedCharacteristic: CharacteristicProtocol?
    public var scanTimeOutDuration: TimeInterval = 30.0
    
    
    // MARK: - Internal Subjects
    let observingStateSubject = PublishSubject<Result<SwiftBluetoothKit.BluetoothState, Error>>()
    
    let scanningSubject = PublishSubject<Result<ScannedPeripheralProtocol, Error>>()
    
    let discoveredServicesSubject = PublishSubject<Result<[ServiceProtocol], Error>>()
    
    let discoveredCharacteristicsSubject = PublishSubject<Result<[CharacteristicProtocol], Error>>()
    
    let disconnectionSubject = PublishSubject<Result<Disconnection, Error>>()
    
    let readValueSubject = PublishSubject<Result<CharacteristicProtocol, Error>>()
    
    let writeValueSubject = PublishSubject<Result<CharacteristicProtocol, Error>>()
    
    let updatedValueAndNotificationSubject = PublishSubject<Result<CharacteristicProtocol, Error>>()
    
    
    // MARK:- Init
    public init() {}
}


extension ExceptionBluetoothManager: BluetoothManagerProtocol {
    // Current Central Manager BluetoothState.
    public var currentBluetoothState: BluetoothState {
        return state
    }
    
    // Central Manager Restore Identifier-Key.
    public var centralManagerRestoreIdentifierKey: String {
        return "restoreIdentifier"
    }
    
    // MARK: - Observers Variables
    
    // Observe Bluetooth State Result.
    public var observingStateOutput: Observable<Result<SwiftBluetoothKit.BluetoothState, Error>> {
        return observingStateSubject.asObservable()
    }
    
    // Observe Bluetooth Peripheral(s) Scanning.
    public var scanningOutput: Observable<Result<ScannedPeripheralProtocol, Error>> {
        return scanningSubject.share(replay: 1, scope: .forever).asObservable()
    }
    
    // Observe Bluetooth Peripheral's Service(s) Discovery.
    public var discoveredServicesOutput: Observable<Result<[ServiceProtocol], Error>> {
        return discoveredServicesSubject.asObservable()
    }
    
    // Observe Bluetooth Peripheral's Service's Characteristic(s) Discovery.
    public var discoveredCharacteristicsOutput: Observable<Result<[CharacteristicProtocol], Error>> {
        return discoveredCharacteristicsSubject.asObservable()
    }
    
    // Observe Bluetooth Disconnection with reason.
    public var disconnectionReasonOutput: Observable<Result<Disconnection, Error>> {
        return disconnectionSubject.asObservable()
    }
    
    // Observe Bluetooth Characteristic Read-Value.
    public var readValueOutput: Observable<Result<CharacteristicProtocol, Error>> {
        return readValueSubject.asObservable()
    }
    
    // Observe Bluetooth Characteristic Write-Value.
    public var writeValueOutput: Observable<Result<CharacteristicProtocol, Error>> {
        return writeValueSubject.asObservable()
    }
    
    // Observe Bluetooth Characteristic UpdateValue Notification.
    public var updatedValueAndNotificationOutput: Observable<Result<CharacteristicProtocol, Error>> {
        return updatedValueAndNotificationSubject.asObservable()
    }
}
