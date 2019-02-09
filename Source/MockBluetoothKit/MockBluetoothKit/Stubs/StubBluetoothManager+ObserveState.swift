//
//  StubBluetoothManager+ObserveState.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 15/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension StubBluetoothManager {

    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Observe BT State
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    // Start Observing BT State.
    public func startObservingState() {
        //Return Canned Bluetooth-State
        self.observingStateSubject.onNext(Result.success(state))
    }
    
    // Stop Observing BT State.
    public func stopObservingState() {
        // Nothing to do here.
    }
}
