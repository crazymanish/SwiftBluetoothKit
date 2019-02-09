//
//  BluetoothManager+CharacteristicNotification.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import RxSwift

public extension BluetoothManager {
    // MARK: - Characteristic notifications
    
    // observeValueUpdateAndSetNotification(:_) returns a disposable from subscription, which triggers notifying start
    // on a selected characteristic.
    public func observeValueUpdateAndSetNotification(for characteristic: CharacteristicProtocol) {
        guard let characteristic = characteristic as? Characteristic else { return }
        let disposable = characteristic.rx.observeValueUpdateAndSetNotification()
            .subscribe(onNext: { [weak self] (characteristic) in
                self?.updatedValueAndNotificationSubject.onNext(Result(success: Characteristic(characteristic)))
                }, onError: { [weak self] (error) in
                    self?.updatedValueAndNotificationSubject.onNext(Result(failure: error))
            })
        
        notificationDisposables[characteristic.uuid.uuidString] = disposable
    }
    
    public func disposeNotification(for characteristic: CharacteristicProtocol) {
        if let disposable = notificationDisposables[characteristic.uuid.uuidString] {
            disposable.dispose()
            notificationDisposables[characteristic.uuid.uuidString] = nil
        }
    }
    
    // observeNotifyValue tells us when exactly a characteristic has changed it's state (e.g isNotifying).
    // We need to use this method, because hardware needs an amount of time to switch characteristic's state.
    public func observeNotifyValue(peripheral: PeripheralProtocol, characteristic: CharacteristicProtocol) {
        guard
            let peripheral = peripheral as? Peripheral,
            let characteristic = characteristic as? Characteristic else { return }
        peripheral.rx.observeNotifyValue(for: characteristic.rx)
            .subscribe(onNext: { [unowned self] (characteristic) in
                self.updatedValueAndNotificationSubject.onNext(Result(success: Characteristic(characteristic)))
                }, onError: { [unowned self] (error) in
                    self.updatedValueAndNotificationSubject.onNext(Result(failure: error))
            }).disposed(by: disposeBag)
    }
}
