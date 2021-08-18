class Items: Codable {
    
    let repos: [Repo]
    
    enum CodingKeys: String, CodingKey {
        case repos = "items"
    }
}

class Repo: Codable {
    
    let name: String?
    let stars: Int?
    private let owner: Owner?
    
    var avatarUrl: String? {
        owner?.avatarUrl
    }
    
    var authorName: String? {
        owner?.authorName
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case stars = "stargazers_count"
        case owner = "owner"
    }
}

fileprivate class Owner: Codable {
    
    fileprivate let avatarUrl: String?
    fileprivate let authorName: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case authorName = "login"
    }
}
