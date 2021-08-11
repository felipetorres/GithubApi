import Foundation

class SimpleLiveData<T>: NSObject {
    @objc dynamic fileprivate var _value: Any!
    
    var value: T {
        get {
            _value as! T
        }
        set {
            _value = newValue
        }
    }
    
    func observe(changeHandler: @escaping (T) -> Void) -> NSKeyValueObservation {
        return observe(\._value, options: [.new]) { _, change in
            changeHandler(change.newValue as! T)
        }
    }
}
