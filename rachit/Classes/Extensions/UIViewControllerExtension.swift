public extension UIViewController {
    
    static var storyboardID: String {
        return className
    }
    
    static func loadFromNib<T: UIViewController>(_: T.Type) -> T {
        return T.init(nibName: String(describing: T.self), bundle: nil)
    }
    
    func displayAlert(withMessage alertMessage: String, withoutTitle: Bool = false) {
        var title = ""
        if !withoutTitle { title = Constants.ConstantStrings.AlertMessages.Title }
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ConstantStrings.AlertMessages.OptionOK, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
