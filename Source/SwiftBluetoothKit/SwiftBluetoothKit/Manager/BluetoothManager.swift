//
//  BluetoothManager.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxSwift
import CoreBluetooth
import RxBluetoothKit

// Central Manager Restore Identifier-Key.
fileprivate let restoreIdentifier = "com.manish.bluetoothkit.RestoreIdentifier"


// BluetoothManager is a class encapsulating logic for most operations you might want to perform on a CentralManager object.
final public class BluetoothManager {
    // MARK: - Public Variables
    
    // Singleton Instance
    public static let shared = BluetoothManager()
    
    // Scanning TimeOut duration.
    public var scanTimeOutDuration: TimeInterval = 30.0
    
    // MARK: - Private Initialization as This is singleton
    private init() {}
    
    
    // MARK: - Internal Subjects
    let observingStateSubject = PublishSubject<Result<BluetoothState, Error>>()
    
    let scanningSubject = PublishSubject<Result<ScannedPeripheralProtocol, Error>>()
    
    let discoveredServicesSubject = PublishSubject<Result<[ServiceProtocol], Error>>()
    
    let discoveredCharacteristicsSubject = PublishSubject<Result<[CharacteristicProtocol], Error>>()
    
    let disconnectionSubject = PublishSubject<Result<Disconnection, Error>>()
    
    let readValueSubject = PublishSubject<Result<CharacteristicProtocol, Error>>()
    
    let writeValueSubject = PublishSubject<Result<CharacteristicProtocol, Error>>()
    
    let updatedValueAndNotificationSubject = PublishSubject<Result<CharacteristicProtocol, Error>>()
    
    
    
    // MARK: - Internal Objects
    let centralManager = CentralManager(queue: .main,
                                        options: [CBCentralManagerOptionShowPowerAlertKey: true as AnyObject,
                                                  CBCentralManagerOptionRestoreIdentifierKey: restoreIdentifier as AnyObject])
    
    let disposeBag = DisposeBag()
    
    var peripheralConnections: [String: Disposable] = [:]
    
    var observingStateDisposable: Disposable?
    
    var scanningDisposable: Disposable?
    
    var notificationDisposables: [String: Disposable] = [:]
}


extension BluetoothManager: BluetoothManagerProtocol {
    // Current Central Manager BluetoothState.
    public var currentBluetoothState: BluetoothState {
        return BluetoothState(rawValue: centralManager.state.rawValue) ?? .unsupported
    }
    
    // Central Manager Restore Identifier-Key.
    public var centralManagerRestoreIdentifierKey: String {
        return restoreIdentifier
    }
    
    // Observe Bluetooth State Result.
    public var observingStateOutput: Observable<Result<BluetoothState, Error>> {
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
