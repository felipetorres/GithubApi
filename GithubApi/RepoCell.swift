import Foundation
import UIKit
import Kingfisher

class RepoCell : UITableViewCell {
    
    static let id = "cell"
    
    private let marginTop: CGFloat = 5
    private let marginBottom: CGFloat = 5
    private let marginLeft: CGFloat = 15
    private let marginRight: CGFloat = 15
    
    var repo: Repo! {
        didSet {
            let url = URL(string: repo.avatarUrl!)
            imageViewRepo.kf.setImage(with: ImageResource(downloadURL: url!))
            labelRepoName.text = repo.name
            labelAuthor.text = repo.authorName
            labelStars.text = "\(repo.stars!)"
        }
    }
    
    private let imageViewRepo: UIImageView = {
        let img = UIImageView()
        img.accessibilityIdentifier = "repository's avatar"
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return img
    }()
    
    private let labelRepoName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.accessibilityIdentifier = "repository's name"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return lbl
    }()
    
    private let labelAuthor: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.accessibilityIdentifier = "author's name"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return lbl
    }()
    
    private let labelStars: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.accessibilityIdentifier = "repository's stars"
        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageViewRepo)
        contentView.addSubview(labelAuthor)
        contentView.addSubview(labelRepoName)
        contentView.addSubview(labelStars)
        
        contentView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        constraints(for: imageViewRepo,
                    top: contentView.topAnchor, topConstant: marginTop,
                    bottom: contentView.bottomAnchor, bottomConstant: marginBottom,
                    leading: contentView.leadingAnchor, leadingConstant: marginLeft)
        
        constraints(for: labelRepoName,
                    leading: imageViewRepo.trailingAnchor, leadingConstant: 15,
                    trailing: labelStars.leadingAnchor, trailingConstant: 5,
                    centerY: contentView.centerYAnchor, centerYConstant: -10)
        
        constraints(for: labelAuthor,
                    leading: labelRepoName.leadingAnchor,
                    trailing: labelRepoName.trailingAnchor,
                    centerY: contentView.centerYAnchor, centerYConstant: 10)
        
        constraints(for: labelStars,
                    trailing: contentView.trailingAnchor, trailingConstant: marginRight,
                    centerY: contentView.centerYAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints(for view: UIView,
                             top: NSLayoutYAxisAnchor? = nil, topConstant: CGFloat = 0,
                             bottom: NSLayoutYAxisAnchor? = nil, bottomConstant: CGFloat = 0,
                             leading: NSLayoutXAxisAnchor? = nil, leadingConstant: CGFloat = 0,
                             trailing: NSLayoutXAxisAnchor? = nil, trailingConstant: CGFloat = 0,
                             centerY: NSLayoutYAxisAnchor? = nil, centerYConstant: CGFloat = 0) {
        
        if let top = top { view.topAnchor.constraint(equalTo: top,
                                                     constant: topConstant).isActive = true }
        if let leading = leading { view.leadingAnchor.constraint(equalTo: leading,
                                                                 constant: leadingConstant).isActive = true }
        if let centerY = centerY { view.centerYAnchor.constraint(equalTo: centerY,
                                                                 constant: centerYConstant).isActive = true }
        bottom?.constraint(equalTo: view.bottomAnchor, constant: bottomConstant).isActive = true
        
        trailing?.constraint(equalTo: view.trailingAnchor, constant: trailingConstant).isActive = true
    }
}
