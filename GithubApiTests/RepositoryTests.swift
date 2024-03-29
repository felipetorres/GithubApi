import XCTest
@testable import GithubApi

class RepositoryTests: XCTestCase {
    
    private lazy var sampleResponseJson: Data? = {
        try? MockResponse.withContext(self)
    }()
    
    func testShouldReturnTheFirstPage() {
        let repository = Repository()
        repository.parse(sampleResponseJson) { response in
            XCTAssertNotNil(response)
            XCTAssertEqual(response.count, 1)
            
            let firstRepo = response[0]
            XCTAssertEqual(firstRepo.avatarUrl, "xpto://avatar.url")
            XCTAssertEqual(firstRepo.name, "repository-name")
            XCTAssertEqual(firstRepo.authorName, "userlogin")
            XCTAssertEqual(firstRepo.stars, 54321)
        }
    }
}
