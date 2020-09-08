import Foundation

public extension UITableViewCell {
    class func tableCellReuseIdentifier() -> String {
        return className
    }
}
