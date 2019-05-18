import Foundation
import Gloss

protocol RepositoryProtocol {
    func getRepos(onPage page: Int, completionHandler: @escaping ([Repo]) -> Void)
}

extension RepositoryProtocol {
    func parse(_ value: Any?, completionHandler: ([Repo]) -> Void) {
        guard let json = value as? JSON,
            let items = json["items"] as? [JSON],
            let repos = [Repo].from(jsonArray: items) else { return }
        
        completionHandler(repos)
    }
}
