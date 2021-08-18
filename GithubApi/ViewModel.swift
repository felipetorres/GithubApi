class ViewModel {
    
    private let liveData = MutableLiveData<[Repo]>()
    private let repository: RepositoryProtocol
    private var pageNumber = 1
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    @discardableResult
    func getRepos() -> LiveData<[Repo]> {
        repository.getRepos(onPage: pageNumber) {
            self.pageNumber += 1
            self.liveData.value = $0
        }
        return liveData
    }
    
    func resetPagination() {
        pageNumber = 1
        getRepos()
    }
}
