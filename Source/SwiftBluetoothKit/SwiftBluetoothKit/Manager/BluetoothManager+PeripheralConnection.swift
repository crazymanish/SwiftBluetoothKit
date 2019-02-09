//
//  BluetoothManager+PeripheralConnection.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import RxSwift
import CoreBluetooth

public extension BluetoothManager {
    // MARK: - Peripheral Connection & Discovering Services
    
    // When you discover a service, first you need to establish a connection with a peripheral. Then you call
    // discoverServices(:_) for that peripheral object.
    public func connectAndDiscoverServices(for peripheral: PeripheralProtocol, serviceUUIDs: [String]?) {
        var uuids: [CBUUID]? = nil
        if let serviceUUIDs = serviceUUIDs {
            uuids = serviceUUIDs.map { CBUUID(string: $0) }
        }
        guard let peripheral = peripheral as? Peripheral else { return }
        let isConnected = peripheral.rx.isConnected
        
        let connectedObservableCreator = { return peripheral.rx.discoverServices(uuids).asObservable() }
        let connectObservableCreator = {
            return peripheral.rx.establishConnection()
                .do(onNext: { [weak self] _ in
                    self?.observeDisconnect(for: peripheral)
                })
                .flatMap { $0.discoverServices(uuids) }
        }
        let observable = isConnected ? connectedObservableCreator(): connectObservableCreator()
        let disposable = observable.subscribe(onNext: { [weak self] services in
            let spServices = services.map { Service($0) }
            self?.discoveredServicesSubject.onNext(Result(success: spServices))
            }, onError: { [weak self] error in
                self?.discoveredServicesSubject.onNext(Result(failure: error))
        })
        
        if isConnected {
            disposeBag.insert(disposable)
        } else {
            peripheralConnections[peripheral.nameOrDefaultName] = disposable
        }
    }
    
    // Disposal of a given connection disposable disconnects automatically from a peripheral
    // So firstly, you discconect from a perpiheral and then you remove of disconnected Peripheral
    // from the Peripheral's collection.
    public func disconnect(_ peripheral: PeripheralProtocol) {
        guard let disposable = peripheralConnections[peripheral.nameOrDefaultName] else { return }
        disposable.dispose()
        peripheralConnections[peripheral.nameOrDefaultName] = nil
    }
    
    
    
    // MARK: - Internal methods
    
    // When you observe disconnection from a peripheral, you want to be sure that you take an action on both .next and
    // .error events. For instance, when your device enters BluetoothState.poweredOff, you will receive an .error event.
    func observeDisconnect(for peripheral: PeripheralProtocol) {
        guard let peripheral = peripheral as? Peripheral else { return }
        centralManager.observeDisconnect(for: peripheral.rx).subscribe(onNext: { [unowned self] (rx, reason) in
            let peripheral = Peripheral(rx)
            self.disconnectionSubject.onNext(Result(success: (peripheral, reason)))
            self.disconnect(peripheral)
            }, onError: { [unowned self] error in
                self.disconnectionSubject.onNext(Result(failure: error))
        }).disposed(by: disposeBag)
    }
}

