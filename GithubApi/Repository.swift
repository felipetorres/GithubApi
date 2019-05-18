import Foundation
import Alamofire
import Gloss

class Repository : RepositoryProtocol {
    func getRepos(onPage page: Int, completionHandler: @escaping ([Repo]) -> Void) {
        Alamofire.request("https://api.github.com/search/repositories",
                          method: .get,
                          parameters: ["q" : "language:swift",
                                       "sort" : "stars",
                                       "page" : page],
                          headers: nil)
            .responseJSON { (response) in
                self.parse(response.result.value, completionHandler: completionHandler)
        }
    }
}
