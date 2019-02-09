//
//  ExceptionBluetoothManager+ObserveState.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension ExceptionBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Observe BT State
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // Start Observing BT State.
    public func startObservingState() {
        //Return Canned Bluetooth-State
        self.observingStateSubject.onNext(Result.failure(error))
    }
    
    // Stop Observing BT State.
    public func stopObservingState() {
        // Nothing to do here.
    }
}
