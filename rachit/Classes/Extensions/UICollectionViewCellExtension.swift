import UIKit

public extension UICollectionViewCell {
    class func cellReuseIdentifier() -> String {
        return className
    }
}
