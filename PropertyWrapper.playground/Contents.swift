import UIKit

@propertyWrapper
struct Trimmed {
    private(set) var value: String = ""

    var wrappedValue: String {
        get { value }
        set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}

struct Trim {
    @Trimmed var value: String
}

let trim = Trim(value: " hffgj ")
trim.value

@propertyWrapper
struct Defaults<T> {
    let key: String
    private let storage: UserDefaults = .standard

    var wrappedValue: T? {
        get { storage.value(forKey: key) as? T }
        set { storage.set(newValue, forKey: key) }
    }
}

struct DataStorage {
    @Defaults<String>(key: "stringValue") static var stringValue
}

DataStorage.stringValue = "text"

UserDefaults.standard.value(forKey: "stringValue")
