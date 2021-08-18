import Foundation

fileprivate final class InternalLiveData: NSObject {
    @objc dynamic fileprivate var value: Any!
}

class LiveData<T> {
    
    fileprivate let liveData = InternalLiveData()
    
    var value: T {
        get {
            liveData.value as! T
        }
    }
    
    func observe(changeHandler: @escaping (T) -> Void) -> NSKeyValueObservation {
        return liveData.observe(\.value, options: [.new]) { _, change in
            changeHandler(change.newValue as! T)
        }
    }
}

class MutableLiveData<T>: LiveData<T> {
    
    override var value: T {
        get {
            liveData.value as! T
        }
        set {
            liveData.value = newValue
        }
    }
}
