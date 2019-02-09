//
//  BluetoothManager+ObserveState.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import RxSwift

public extension BluetoothManager {
    // MARK: - Observe BT State
    
    // Start observing state of your CentralManager object.
    public func startObservingState() {
        observingStateDisposable = centralManager.observeState().subscribe(onNext: { [weak self] (btState) in
            let state = BluetoothState(rawValue: btState.rawValue) ?? .unknown
            self?.observingStateSubject.onNext(Result(success: state))
            }, onError: { [weak self] (error) in
                self?.observingStateSubject.onNext(Result(failure: error))
        })
    }
    
    // Stop observing state of your CentralManager object.
    public func stopObservingState() {
        observingStateDisposable?.dispose()
    }
}
