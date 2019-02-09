//
//  StubBluetoothManager+CharacteristicNotification.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension StubBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Characteristic notifications
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    public func observeValueUpdateAndSetNotification(for characteristic: CharacteristicProtocol) {
        self.updatedValueAndNotificationSubject.onNext(Result.success(characteristic))
    }
    
    public func disposeNotification(for characteristic: CharacteristicProtocol) {
        // Nothing to do here.
    }
    
    public func observeNotifyValue(peripheral: PeripheralProtocol, characteristic: CharacteristicProtocol) {
        self.updatedValueAndNotificationSubject.onNext(Result.success(characteristic))
    }
}
