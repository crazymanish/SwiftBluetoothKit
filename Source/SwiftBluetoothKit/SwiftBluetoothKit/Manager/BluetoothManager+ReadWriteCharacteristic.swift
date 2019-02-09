//
//  BluetoothManager+ReadWriteCharacteristic.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import RxSwift

public extension BluetoothManager {
    // MARK: - Reading from and writing to a characteristic
    public func readValueFrom(_ characteristic: CharacteristicProtocol) {
        guard let characteristic = characteristic as? Characteristic else { return }
        characteristic.rx.readValue().subscribe(onSuccess: { [unowned self] characteristic in
            self.readValueSubject.onNext(Result(success: Characteristic(characteristic)))
            }, onError: { [unowned self] error in
                self.readValueSubject.onNext(Result(failure: error))
        }).disposed(by: disposeBag)
    }
    
    public func writeValueTo(characteristic: CharacteristicProtocol, data: Data) {
        guard
            let characteristic = characteristic as? Characteristic,
            let writeType = characteristic.determineWriteType() else {
                return
        }
        
        characteristic.rx.writeValue(data, type: writeType).subscribe(onSuccess: { [unowned self] characteristic in
            self.writeValueSubject.onNext(Result(success: Characteristic(characteristic)))
            }, onError: { [unowned self] error in
                self.writeValueSubject.onNext(Result(failure: error))
        }).disposed(by: disposeBag)
    }
}
