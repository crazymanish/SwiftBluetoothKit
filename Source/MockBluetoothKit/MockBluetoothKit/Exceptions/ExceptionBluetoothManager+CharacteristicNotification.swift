//
//  ExceptionBluetoothManager+CharacteristicNotification.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension ExceptionBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Characteristic notifications
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    public func observeValueUpdateAndSetNotification(for characteristic: CharacteristicProtocol) {
        self.updatedValueAndNotificationSubject.onNext(Result.failure(error))
    }
    
    public func disposeNotification(for characteristic: CharacteristicProtocol) {
        // Nothing to do here.
    }
    
    public func observeNotifyValue(peripheral: PeripheralProtocol, characteristic: CharacteristicProtocol) {
        self.updatedValueAndNotificationSubject.onNext(Result.failure(error))
    }
}
