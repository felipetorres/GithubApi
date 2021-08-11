import Foundation
import UIKit
import Kingfisher

class RepoCell: UITableViewCell {
    
    static let id = "cell"
    
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
        return img
    }()
    
    private let labelRepoName: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.accessibilityIdentifier = "repository's name"
        return lbl
    }()
    
    private let labelAuthor: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = .systemFont(ofSize: 15)
        lbl.accessibilityIdentifier = "author's name"
        return lbl
    }()
    
    private let labelStars: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.accessibilityIdentifier = "repository's stars"
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imageViewRepo)
        contentView.addSubview(labelAuthor)
        contentView.addSubview(labelRepoName)
        contentView.addSubview(labelStars)
        
        imageViewRepo.constraints {
            $0.size.equalTo(80)
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        
        labelRepoName.constraints {
            $0.leading.equalTo(imageViewRepo.snp.trailing).offset(15)
            $0.centerY.equalToSuperview().offset(-10)
        }
        
        labelAuthor.constraints {
            $0.leading.trailing.equalTo(labelRepoName)
            $0.centerY.equalToSuperview().offset(10)
        }
        
        labelStars.constraints {
            $0.leading.greaterThanOrEqualTo(labelRepoName.snp.trailing).offset(5)
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
