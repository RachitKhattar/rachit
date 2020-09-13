import UIKit

public class SlideFromLeftPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        debugPrint("present1")
        let presentationController = SlideFromLeftPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        debugPrint("present")
        return SlideFromLeftPresentationAnimator(isPresentation: true)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideFromLeftPresentationAnimator(isPresentation: false)
    }
}
