//
//  StubBluetoothManager+PeripheralConnection.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension StubBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Peripheral Connection & Discovering Services
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    public func connectAndDiscoverServices(for peripheral: PeripheralProtocol, serviceUUIDs: [String]?) {
        self.discoveredServicesSubject.onNext(Result.success(services))
    }
    
    public func disconnect(_ peripheral: PeripheralProtocol) {
        self.disconnectionSubject.onNext(Result.success((peripheral, disconnectionReason)))
    }
}
