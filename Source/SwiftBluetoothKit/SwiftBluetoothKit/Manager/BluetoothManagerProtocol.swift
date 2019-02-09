//
//  BluetoothManagerProtocol.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxSwift

public protocol BluetoothManagerProtocol {
    // Diconnection TypeAlias.
    typealias Disconnection = (PeripheralProtocol, Error?)
    
    // Observe Bluetooth State Result.
    var observingStateOutput: Observable<Result<BluetoothState, Error>> { get }
    
    // Observe Bluetooth Peripheral(s) Scanning.
    var scanningOutput: Observable<Result<ScannedPeripheralProtocol, Error>> { get }
    
    // Observe Bluetooth Peripheral's Service(s) Discovery.
    var discoveredServicesOutput: Observable<Result<[ServiceProtocol], Error>> { get }
    
    // Observe Bluetooth Peripheral's Service's Characteristic(s) Discovery.
    var discoveredCharacteristicsOutput: Observable<Result<[CharacteristicProtocol], Error>> { get }
    
    // Observe Bluetooth Disconnection with reason.
    var disconnectionReasonOutput: Observable<Result<Disconnection, Error>> { get }
    
    // Observe Bluetooth Characteristic Read-Value.
    var readValueOutput: Observable<Result<CharacteristicProtocol, Error>> { get }
    
    // Observe Bluetooth Characteristic Write-Value.
    var writeValueOutput: Observable<Result<CharacteristicProtocol, Error>> { get }
    
    // Observe Bluetooth Characteristic UpdateValue Notification.
    var updatedValueAndNotificationOutput: Observable<Result<CharacteristicProtocol, Error>> { get }
    
    // Central Manager Restore Identifier-Key.
    var centralManagerRestoreIdentifierKey: String { get }
    
    // Current Central Manager BluetoothState.
    var currentBluetoothState: BluetoothState { get }
    
    // Scanning TimeOut duration. Default is 30 seconds.
    var scanTimeOutDuration: TimeInterval { get set }
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Observe BT State
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // Start observing state of CentralManager object.
    func startObservingState()
    
    // If you wish to stop observing state of CentralManager object.
    func stopObservingState()
    
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Scanning for peripherals
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // Start scanning for peripherals.
    func startScanning(withServices serviceUUIDs: [String]?, options: [String: Any]?)
    
    // If you wish to stop scanning for peripherals.
    func stopScanning()
    
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Peripheral Connection & Discovering Services
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // When you discover a service, first you need to establish a connection with a peripheral.
    func connectAndDiscoverServices(for peripheral: PeripheralProtocol, serviceUUIDs: [String]?)
    
    // Disconnect a perpiheral.
    func disconnect(_ peripheral: PeripheralProtocol)
    
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Discovering Characteristics
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // DiscoverCharacteristics of a service
    func discoverCharacteristics(_ characteristicUUIDs: [String]?, for service: ServiceProtocol)
    
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Reading from and writing to a characteristic
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // Read value from a characteristic
    func readValueFrom(_ characteristic: CharacteristicProtocol)
    
    // Write value to a characteristic
    func writeValueTo(characteristic: CharacteristicProtocol, data: Data)
    
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Characteristic notifications
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // observeValueUpdateAndSetNotification(:_) returns a disposable from subscription, which triggers notifying start
    // on a selected characteristic.
    func observeValueUpdateAndSetNotification(for characteristic: CharacteristicProtocol)
    func disposeNotification(for characteristic: CharacteristicProtocol)
    
    // observeNotifyValue tells us when exactly a characteristic has changed it's state (e.g isNotifying).
    // We need to use this method, because hardware needs an amount of time to switch characteristic's state.
    func observeNotifyValue(peripheral: PeripheralProtocol, characteristic: CharacteristicProtocol)
    
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Retrieving Lists of Peripherals
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    /// Returns list of the `Peripheral`s which are currently connected to the `CentralManager`
    func retrieveConnectedPeripherals(withServices serviceUUIDs: [String]) -> [PeripheralProtocol]
    
    /// Returns list of `Peripheral`s by their identifiers which are known to `CentralManager`.
    func retrievePeripherals(withIdentifiers identifiers: [UUID]) -> [PeripheralProtocol]
}
