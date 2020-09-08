import UIKit

class FromTopDismissBottomPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = FromTopDismissBottomPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FromTopDismissBottomPresentationAnimator(isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FromTopDismissBottomPresentationAnimator(isPresentation: false)
    }
}
