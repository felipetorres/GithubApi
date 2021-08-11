import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    private var kvo: NSKeyValueObservation!
    
    lazy var vm: ViewModel = {
        ViewModel(repository: Repository())
    }()
    
    private var repos = [Repo]() {
        didSet {
            tableView.refreshControl?.endRefreshing()
            tableView.reloadData()
        }
    }
    
    override func loadView() {
        super.loadView()
        tableView.accessibilityIdentifier = "tableView"
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .white
        constraints(for: tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        tableView.register(RepoCell.self, forCellReuseIdentifier: RepoCell.id)
        
        tableView.refreshControl!.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        
        kvo = vm.getRepos().observe { self.update(with: $0) }
    }
    
    @objc private func onRefresh() {
        tableView.refreshControl!.beginRefreshing()
        vm.resetPagination()
    }
    
    private func update(with newValue: [Repo]?) {
        guard let newValue = newValue else { return }

        if tableView.refreshControl!.isRefreshing {
            self.repos = newValue
        } else {
            self.repos += newValue
        }
    }
    
    private func constraints(for tableView: UITableView) {
        view.addSubview(tableView)
        
        let safeArea = view.layoutMarginsGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.id) as! RepoCell
        cell.repo = repos[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if repos.count - indexPath.row == 10 {
            _ = vm.getRepos()
        }
    }
}

