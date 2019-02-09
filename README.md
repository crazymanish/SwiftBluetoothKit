# SwiftBluetoothKit
SwiftBluetoothKit is a Protocol oriented iOS Bluetooth framework.
-------------------

SwiftBluetoothKit is a Bluetooth framework that makes interaction with BLE devices much more pleasant. It's backed by RxSwift and CoreBluetooth and currently it provides nice API, for Central mode. All to work with and make your code more readable, reliable and easier to maintain.

## Usage
- **SwiftBluetoothKit** framework have **BluetoothManager** as core class, which implements **BluetoothManagerProtocol** and responsible for BLE operations.
- **MockBluetoothKit** framework have **StubBluetoothManager** class, which implements **BluetoothManagerProtocol** and responsible for `testing the Happy-Flow of BLE operations` in unit-test phase.
- **MockBluetoothKit** framework also have **ExceptionBluetoothManager** class, which implements **BluetoothManagerProtocol** and responsible for `testing the Exception-Scenarios of BLE operations` in unit-test phase.

### TODO
- Example app with SwiftBluetoothKit & MockBluetoothKit.
-------------------

## Central mode features
* [Observing manager states]
* [Scanning for peripherals]
* [Connecting to peripheral]
* [Discovering peripheral's services and characteristics]
* [Reading & Writing to characteristic's value]
* [Monitoring characteristic value change]

## Protocols
SwiftBluetoothKit is a Protocol oriented framework which help developers to create custom stubs response for Bluetooth operations.

- **BluetoothManager** is the core class, which handle the all Central mode BLE operations. BluetoothManager implements **BluetoothManagerProtocol** as:
```swift
public protocol BluetoothManagerProtocol {
    // Diconnection TypeAlias.
    typealias Disconnection = (PeripheralProtocol, Error?)

    // Observe Bluetooth State Result.
    var observingStateOutput: Observable<Result<BluetoothState, Error>> { get }

    // Observe Bluetooth Peripheral(s) Scanning.
    var scanningOutput: Observable<Result<ScannedPeripheralProtocol, Error>> { get }

    // Observe Bluetooth Peripheral's Service(s) Discovery.
    var discoveredServicesOutput: Observable<Result<[ServiceProtocol], Error>> { get }

    // Observe Bluetooth Peripheral's Service's Characteristic(s) Discovery.
    var discoveredCharacteristicsOutput: Observable<Result<[CharacteristicProtocol], Error>> { get }

    // Observe Bluetooth Disconnection with reason.
    var disconnectionReasonOutput: Observable<Result<Disconnection, Error>> { get }

    // Observe Bluetooth Characteristic Read-Value.
    var readValueOutput: Observable<Result<CharacteristicProtocol, Error>> { get }

    // Observe Bluetooth Characteristic Write-Value.
    var writeValueOutput: Observable<Result<CharacteristicProtocol, Error>> { get }

    // Observe Bluetooth Characteristic UpdateValue Notification.
    var updatedValueAndNotificationOutput: Observable<Result<CharacteristicProtocol, Error>> { get }

    // Central Manager Restore Identifier-Key.
    var centralManagerRestoreIdentifierKey: String { get }

    // Current Central Manager BluetoothState.
    var currentBluetoothState: BluetoothState { get }

    // Scanning TimeOut duration. Default is 30 seconds.
    var scanTimeOutDuration: TimeInterval { get set }


    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Observe BT State
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

    // Start observing state of CentralManager object.
    func startObservingState()

    // If you wish to stop observing state of CentralManager object.
    func stopObservingState()



    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Scanning for peripherals
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

    // Start scanning for peripherals.
    func startScanning(withServices serviceUUIDs: [String]?, options: [String: Any]?)

    // If you wish to stop scanning for peripherals.
    func stopScanning()



    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Peripheral Connection & Discovering Services
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

    // When you discover a service, first you need to establish a connection with a peripheral.
    func connectAndDiscoverServices(for peripheral: PeripheralProtocol, serviceUUIDs: [String]?)

    // Disconnect a perpiheral.
    func disconnect(_ peripheral: PeripheralProtocol)



    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Discovering Characteristics
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

    // DiscoverCharacteristics of a service
    func discoverCharacteristics(_ characteristicUUIDs: [String]?, for service: ServiceProtocol)



    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Reading from and writing to a characteristic
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

    // Read value from a characteristic
    func readValueFrom(_ characteristic: CharacteristicProtocol)

    // Write value to a characteristic
    func writeValueTo(characteristic: CharacteristicProtocol, data: Data)



    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Characteristic notifications
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

    // observeValueUpdateAndSetNotification(:_) returns a disposable from subscription, which triggers notifying start
    // on a selected characteristic.
    func observeValueUpdateAndSetNotification(for characteristic: CharacteristicProtocol)
    func disposeNotification(for characteristic: CharacteristicProtocol)

    // observeNotifyValue tells us when exactly a characteristic has changed it's state (e.g isNotifying).
    // We need to use this method, because hardware needs an amount of time to switch characteristic's state.
    func observeNotifyValue(peripheral: PeripheralProtocol, characteristic: CharacteristicProtocol)



    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠
    // MARK: - Retrieving Lists of Peripherals
    // ≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠

    /// Returns list of the `Peripheral`s which are currently connected to the `CentralManager`
    func retrieveConnectedPeripherals(withServices serviceUUIDs: [String]) -> [PeripheralProtocol]

    /// Returns list of `Peripheral`s by their identifiers which are known to `CentralManager`.
    func retrievePeripherals(withIdentifiers identifiers: [UUID]) -> [PeripheralProtocol]
}
```

- **Peripheral** class, which always have the BLE device details. Peripheral implements **PeripheralProtocol** as:
```swift
public protocol PeripheralProtocol: class {
    /// Value indicating if peripheral is currently in connected state.
    var isConnected: Bool { get }

    ///  Current state of `Peripheral` instance described by [CBPeripheralState](https://developer.apple.com/documentation/corebluetooth/cbperipheralstate).
    ///  - returns: Current state of `Peripheral` as `CBPeripheralState`.
    var state: CBPeripheralState { get }

    /// Current name of `Peripheral` instance. Analogous to [name](https://developer.apple.com/documentation/corebluetooth/cbperipheral/1519029-name) of `CBPeripheral`.
    var name: String? { get }

    /// Unique identifier of `Peripheral` instance. Assigned once peripheral is discovered by the system.
    var identifier: UUID { get }

    /// A list of services that have been discovered. Analogous to [services](https://developer.apple.com/documentation/corebluetooth/cbperipheral/1518978-services) of `CBPeripheral`.
    var services: [ServiceProtocol]? { get }
}
```

- **Service** class, which always holds the BLE characteristics details for specific service. Service implements **ServiceProtocol** as:
```swift
public protocol ServiceProtocol: class {
    /// Peripheral to which this service belongs
    var peripheral: PeripheralProtocol { get }

    /// True if service is primary service
    var isPrimary: Bool { get }

    /// Service's UUID
    var uuid: CBUUID { get }

    /// Service's characteristics
    var characteristics: [CharacteristicProtocol]? { get }
}
```

- **Characteristic** class, which always holds the BLE characteristic value. Characteristic implements **CharacteristicProtocol** as:
```swift
public protocol CharacteristicProtocol: class {
    /// Service which contains this characteristic
    var service: ServiceProtocol { get }

    /// Current value of characteristic. If value is not present - it's `nil`.
    var value: Data? { get }

    /// The Bluetooth UUID of the `Characteristic` instance.
    var uuid: CBUUID { get }

    /// Flag which is set to true if characteristic is currently notifying
    var isNotifying: Bool { get }

    /// Properties of characteristic. For more info about this refer to [CBCharacteristicProperties](https://developer.apple.com/library/ios/documentation/CoreBluetooth/Reference/CBCharacteristic_Class/#//apple_ref/c/tdef/CBCharacteristicProperties)
    var properties: CBCharacteristicProperties { get }
}
```

# MockBluetoothKit
MockBluetoothKit is a mock version of SwiftBluetoothKit framework.


# Installation

## CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for CocoaProjects.
To integrate RxBluetoothKit into your Xcode project using CocoaPods specify it in your `Podfile`:
```ruby
source 'https://github.com/crazymanish/CocoaPodsSpecs.git'  #Add this source line, this library still under development.

pod 'SwiftBluetoothKit'  #Add CocoaPods dependency for SwiftBluetoothKit
pod 'MockBluetoothKit'  #Add CocoaPods dependency for Mock version of SwiftBluetoothKit
```


# Requirements
- iOS 10.0+
- Xcode 10.0+

# Swift versions
* Current version supports Swift 4.2

# Motivation & Thanks
* [RxBluetoothKit](https://github.com/Polidea/RxBluetoothKit)

# LICENSE
* MIT
