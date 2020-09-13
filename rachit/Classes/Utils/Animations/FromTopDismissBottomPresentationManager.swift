import UIKit

public class FromTopDismissBottomPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = FromTopDismissBottomPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FromTopDismissBottomPresentationAnimator(isPresentation: true)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FromTopDismissBottomPresentationAnimator(isPresentation: false)
    }
}
