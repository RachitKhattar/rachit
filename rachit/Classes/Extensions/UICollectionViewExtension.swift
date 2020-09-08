import Foundation

public extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.cellReuseIdentifier())
    }
    
    func registerNib<T: UICollectionViewCell>(_: T.Type) {
        let nib = T.nib()
        self.register(nib, forCellWithReuseIdentifier: T.cellReuseIdentifier())
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.cellReuseIdentifier(), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.cellReuseIdentifier())")
        }
        
        return cell
    }
}
