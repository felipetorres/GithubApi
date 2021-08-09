import Foundation
@testable import GithubApi

class MockRepository : RepositoryProtocol {
    
    func getRepos(onPage page: Int, completionHandler: @escaping ([Repo]) -> Void) {
        parse(try? MockResponse.withContext(self)) { completionHandler($0) }
    }
}
