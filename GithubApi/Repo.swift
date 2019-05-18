import Foundation
import Gloss

class Repo : NSObject, Gloss.JSONDecodable {
    
    let name: String?
    let stars: Int?
    let avatarUrl: String?
    let authorName: String?
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.stars = "stargazers_count" <~~ json
        self.avatarUrl = "owner.avatar_url" <~~ json
        self.authorName = "owner.login" <~~ json
    }
}
