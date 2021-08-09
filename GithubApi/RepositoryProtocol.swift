import Foundation

protocol RepositoryProtocol {
    func getRepos(onPage page: Int, completionHandler: @escaping ([Repo]) -> Void)
}

extension RepositoryProtocol {
    func parse(_ value: Data?, completionHandler: ([Repo]) -> Void) {
        guard let json = value, let items = try? JSONDecoder().decode(Items.self, from: json) else { return }
        
        completionHandler(items.repos)
    }
}
