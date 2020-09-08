import Foundation

public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.tableCellReuseIdentifier())
    }
    
    func registerNib<T: UITableViewCell>(_: T.Type) {
        let nib = T.nib()
        self.register(nib, forCellReuseIdentifier: T.tableCellReuseIdentifier())
    }
    
    func register(_ cellIdentifier: String) {
        self.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.tableCellReuseIdentifier(), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.tableCellReuseIdentifier())")
        }
        
        return cell
    }
    
    func reloadDataWithAutoSizingCellWorkAround() {
        self.reloadData()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.reloadData()
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    
    func scrollToTableBottom(){

        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }

    func scrollToTableTop() {

        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
}
