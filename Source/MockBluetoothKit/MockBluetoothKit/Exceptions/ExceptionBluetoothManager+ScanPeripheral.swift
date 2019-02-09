//
//  ExceptionBluetoothManager+ScanPeripheral.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension ExceptionBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Scanning for peripherals
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // Start BT Scanning for device.
    public func startScanning(withServices serviceUUIDs: [String]? = nil, options: [String : Any]? = nil) {
        self.scanningSubject.onNext(Result.failure(error))
    }
    
    // Start BT Scanning.
    public func stopScanning() {
        // Nothing to do here.
    }
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Retrieving Lists of Peripherals
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    /// Returns list of the `Peripheral`s which are currently connected to the `CentralManager`
    public func retrieveConnectedPeripherals(withServices serviceUUIDs: [String]) -> [PeripheralProtocol] {
        return []
    }
    
    public func retrievePeripherals(withIdentifiers identifiers: [UUID]) -> [PeripheralProtocol] {
        return []
    }
}
