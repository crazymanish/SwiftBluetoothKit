//
//  StubBluetoothManager+DiscoverCharacteristics.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 16/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import RxSwift
import SwiftBluetoothKit

public extension StubBluetoothManager {
    
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Discovering Characteristics
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    
    public func discoverCharacteristics(_ characteristicUUIDs: [String]?, for service: ServiceProtocol) {
        self.discoveredCharacteristicsSubject.onNext(Result.success(characteristics))
    }
}
