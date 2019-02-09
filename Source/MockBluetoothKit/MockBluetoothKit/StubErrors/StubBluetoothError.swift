//
//  StubBluetoothError.swift
//  MockBluetoothKit
//
//  Created by Manish Rathi on 17/09/18.
//  Copyright © 2018 Manish. All rights reserved.
//

import Foundation

/// Bluetooth error which can be emitted by MockBluetoothKit.
public enum StubBluetoothError: Error {
    // Emitted when `CentralManager.scanForPeripherals` called and there is already ongoing scan
    case scanInProgress
    
    // States
    case bluetoothUnsupported
    case bluetoothUnauthorized
    case bluetoothPoweredOff
    case bluetoothInUnknownState
    case bluetoothResetting
    
    // Peripheral
    case peripheralIsAlreadyObservingConnection
    case peripheralConnectionFailed
    case peripheralDisconnected
    
    // Services
    case servicesDiscoveryFailed
    
    // Characteristics
    case characteristicsDiscoveryFailed
    case characteristicWriteFailed
    case characteristicReadFailed
    case characteristicNotifyChangeFailed
    case characteristicSetNotifyValueFailed
    
    //UnKnown
    case unknown(String)
}


extension StubBluetoothError: CustomStringConvertible {
    /// Human readable description of bluetooth error
    public var description: String {
        switch self {
        case .scanInProgress:
            return """
            Tried to scan for peripheral when there is already ongoing scan.
            You can have only 1 ongoing scanning, please check documentation of CentralManager for more details
            """
        case .bluetoothUnsupported:
            return "Bluetooth is unsupported"
        case .bluetoothUnauthorized:
            return "Bluetooth is unauthorized"
        case .bluetoothPoweredOff:
            return "Bluetooth is powered off"
        case .bluetoothInUnknownState:
            return "Bluetooth is in unknown state"
        case .bluetoothResetting:
            return "Bluetooth is resetting"
        // Peripheral
        case .peripheralIsAlreadyObservingConnection:
            return """
            Peripheral connection is already being observed.
            You cannot try to establishConnection to peripheral when you have ongoing
            connection (previously establishConnection subscription was not disposed).
            """
        case .peripheralConnectionFailed:
            return "Connection error has occured"
        case .peripheralDisconnected:
            return "Connection error has occured"
        // Services
        case .servicesDiscoveryFailed:
            return "Services discovery error has occured"
        // Characteristics
        case .characteristicsDiscoveryFailed:
            return "Characteristics discovery error has occured"
        case .characteristicWriteFailed:
            return "Characteristic write error has occured"
        case .characteristicReadFailed:
            return "Characteristic read error has occured"
        case .characteristicNotifyChangeFailed:
            return "Characteristic notify change error has occured"
        case .characteristicSetNotifyValueFailed:
            return "Characteristic isNotyfing value change error has occured"
        case let .unknown(reason):
            return "Uknown error has occured: \(reason)"
        }
    }
}
