public extension UIViewController {
    
    static var storyboardID: String {
        return className
    }
    
    static func loadFromNib<T: UIViewController>(_: T.Type) -> T {
        return T.init(nibName: String(describing: T.self), bundle: nil)
    }
}
