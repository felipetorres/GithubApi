import XCTest
@testable import GithubApi

class ViewModelTests: XCTestCase {
    
    private let viewModel = ViewModel(repository: MockRepository())
    
    func testShouldGetRepoElementsFromRepository() {
        let liveData = viewModel.getRepos()
        XCTAssertNotNil(liveData.value)
        
        let repos = liveData.value!
        
        XCTAssertEqual(repos.count, 1)
        
        let repo = repos[0]
        
        XCTAssertEqual(repo.name, "repository-name")
        XCTAssertEqual(repo.stars, 54321)
        XCTAssertEqual(repo.avatarUrl, "xpto://avatar.url")
        XCTAssertEqual(repo.authorName, "userlogin")
    }
}
