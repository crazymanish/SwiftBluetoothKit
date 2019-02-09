//
//  StubBluetoothManager+ReadWriteCharacteristic.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension StubBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Reading from and writing to a characteristic
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    public func readValueFrom(_ characteristic: CharacteristicProtocol) {
        self.readValueSubject.onNext(Result.success(characteristic))
    }
    
    public func writeValueTo(characteristic: CharacteristicProtocol, data: Data) {
        self.writeValueSubject.onNext(Result.success(MockCharacteristic(data)))
    }
}
