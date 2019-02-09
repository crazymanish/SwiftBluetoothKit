//
//  ExceptionBluetoothManager+PeripheralConnection.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension ExceptionBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Peripheral Connection & Discovering Services
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    public func connectAndDiscoverServices(for peripheral: PeripheralProtocol, serviceUUIDs: [String]?) {
        self.discoveredServicesSubject.onNext(Result.failure(error))
    }
    
    public func disconnect(_ peripheral: PeripheralProtocol) {
        self.disconnectionSubject.onNext(Result.failure(error))
    }
}
