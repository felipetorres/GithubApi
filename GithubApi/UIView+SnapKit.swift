import UIKit
import SnapKit

extension UIView {
    
    func constraints(closure: (ConstraintMaker) -> Void) {
        snp.makeConstraints(closure)
    }
}
