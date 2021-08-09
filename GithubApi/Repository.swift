import Foundation
import Alamofire

class Repository: RepositoryProtocol {
    func getRepos(onPage page: Int, completionHandler: @escaping ([Repo]) -> Void) {
        Alamofire
            .request("https://api.github.com/search/repositories",
                     parameters: ["q" : "language:swift",
                                  "sort" : "stars",
                                  "page" : page])
            .responseData {
                self.parse($0.data, completionHandler: completionHandler)
        }
    }
}
