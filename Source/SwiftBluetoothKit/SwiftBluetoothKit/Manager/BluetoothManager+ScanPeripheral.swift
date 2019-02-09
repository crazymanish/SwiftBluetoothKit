//
//  BluetoothManager+ScanPeripheral.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import RxSwift
import CoreBluetooth

public extension BluetoothManager {
    // MARK: - Scanning for peripherals
    
    // You start from observing state of your CentralManager object. Within RxBluetoothKit v.5.0, it is crucial
    // that you use .startWith(:_) operator, and pass the initial state of your CentralManager with
    // centralManager.state.
    public func startScanning(withServices serviceUUIDs: [String]? = nil, options: [String: Any]? = nil) {
        var uuids: [CBUUID]? = nil
        if let serviceUUIDs = serviceUUIDs {
            uuids = serviceUUIDs.map { CBUUID(string: $0) }
        }
        scanningDisposable = centralManager.observeState()
            .startWith(centralManager.state)
            .filter {
                $0 == .poweredOn
            }
            .subscribeOn(MainScheduler.instance)
            .timeout(scanTimeOutDuration, scheduler: MainScheduler.instance)
            .flatMap { [weak self] _ -> Observable<RxBluetoothKit.ScannedPeripheral> in
                guard let weakSelf = self else {
                    return Observable.empty()
                }
                return weakSelf.centralManager.scanForPeripherals(withServices: uuids, options: options)
            }.subscribe(onNext: { [weak self] newPeripheral in
                self?.scanningSubject.onNext(Result(success: ScannedPeripheral(newPeripheral)))
                }, onError: { [weak self] error in
                    self?.scanningSubject.onNext(Result(failure: error))
            })
    }
    
    // If you wish to stop scanning for peripherals, you need to dispose the Disposable object, created when
    // you either subscribe for events from an observable returned by centralManager.scanForPeripherals(:_), or you bind
    // an observer to it. Check starScanning() above for details.
    public func stopScanning() {
        scanningDisposable?.dispose()
    }
    
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Retrieving Lists of Peripherals
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    /// Returns list of the `Peripheral`s which are currently connected to the `CentralManager`
    public func retrieveConnectedPeripherals(withServices serviceUUIDs: [String]) -> [PeripheralProtocol] {
        let uuids = serviceUUIDs.map { CBUUID(string: $0) }
        let connectedPeripherals = centralManager.retrieveConnectedPeripherals(withServices: uuids)
        return connectedPeripherals.map { Peripheral($0) }
    }
    
    /// Returns list of `Peripheral`s by their identifiers which are known to `CentralManager`.
    ///
    /// - parameter identifiers: List of `Peripheral`'s identifiers which should be retrieved.
    /// - returns: Retrieved `Peripheral`s.
    public func retrievePeripherals(withIdentifiers identifiers: [UUID]) -> [PeripheralProtocol] {
        let connectedPeripherals = centralManager.retrievePeripherals(withIdentifiers: identifiers)
        return connectedPeripherals.map { Peripheral($0) }
    }
}
