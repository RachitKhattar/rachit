import Foundation

public extension NSObject {
    var className: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
