import XCTest
@testable import GithubApi

class RepoTests: XCTestCase {
    
    private var jsonString =
        """
        {
        "name" : "Repo's name",
        "stargazers_count" : 123456,
        "owner" :
            {
                "login" : "Owner's name",
                "avatar_url" : "xpto://avatar.url"
            }
        }
        """
    
    private var json: Data {
        jsonString.data(using: .utf8)!
    }
    
    func testShouldParseJsonContent() {
        let repo = try! JSONDecoder().decode(Repo.self, from: json)
        XCTAssertEqual(repo.name, "Repo's name")
        XCTAssertEqual(repo.stars, 123456)
        XCTAssertEqual(repo.authorName, "Owner's name")
        XCTAssertEqual(repo.avatarUrl, "xpto://avatar.url")
    }
}

