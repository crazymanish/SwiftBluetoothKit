//
//  BluetoothManager+DiscoverCharacteristics.swift
//  SwiftBluetoothKit
//
//  Created by Manish Rathi on 27/11/18.
//  Copyright © 2019 Manish. All rights reserved.
//

import RxBluetoothKit
import RxSwift
import CoreBluetooth

public extension BluetoothManager {
    // MARK: - Discovering Characteristics
    public func discoverCharacteristics(_ characteristicUUIDs: [String]?, for service: ServiceProtocol) {
        guard let service = service as? Service else { return }
        var uuids: [CBUUID]? = nil
        if let characteristicUUIDs = characteristicUUIDs {
            uuids = characteristicUUIDs.map { CBUUID(string: $0) }
        }
        service.rx.discoverCharacteristics(uuids).subscribe(onSuccess: { [unowned self] characteristics in
            let spCharacteristics = characteristics.map { Characteristic($0) }
            self.discoveredCharacteristicsSubject.onNext(Result(success: spCharacteristics))
            }, onError: { error in
                self.discoveredCharacteristicsSubject.onNext(Result(failure: error))
        }).disposed(by: disposeBag)
    }
}
