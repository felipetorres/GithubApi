import Foundation

class ViewModel {
    
    private let liveData = SimpleLiveData()
    private let repository: RepositoryProtocol
    private var pageNumber = 1
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func getRepos() -> SimpleLiveData {
        repository.getRepos(onPage: pageNumber) {
            self.pageNumber += 1
            self.liveData.value = $0
        }
        return liveData
    }
    
    func resetPagination() {
        pageNumber = 1
        _ = getRepos()
    }
}

class SimpleLiveData: NSObject {
    @objc dynamic var value: [Repo]!
}

extension SimpleLiveData {
    
    func observe(changeHandler: @escaping (SimpleLiveData, NSKeyValueObservedChange<[Repo]>) -> Void) -> NSKeyValueObservation {
        return observe(\.value, options: [.new], changeHandler: changeHandler)
    }
}

