import XCTest
import Gloss
@testable import GithubApi

class RepoTests: XCTestCase {
    
    private var json: JSON!
    
    override func setUp() {
        json = ["name" : "Repo's name",
                "stargazers_count" : 123456,
                "owner" :
                    ["login" : "Owner's name",
                     "avatar_url" : "xpto://avatar.url"]
        ]
    }
    
    func testShouldParseJsonContent() {
        let repo = Repo(json: json)
        
        XCTAssertEqual(repo?.name, "Repo's name")
        XCTAssertEqual(repo?.stars, 123456)
        XCTAssertEqual(repo?.authorName, "Owner's name")
        XCTAssertEqual(repo?.avatarUrl, "xpto://avatar.url")
    }
}

