import UIKit

public extension UIStoryboard {
    fileprivate static let main = UIStoryboard(name: "Main", bundle: nil)
    
    func getViewController<T: UIViewController>() -> T {
        return instantiateViewController(withIdentifier: T.storyboardID) as! T
    }
}



