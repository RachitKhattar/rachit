//
//  SlideUpPresentationAnimator.swift
//  etmoneyios
//
//  Created by Rachit Khattar on 17/07/18.
//  Copyright © 2018 Dew Solutions Private Limited. All rights reserved.
//

import UIKit

class SlideUpPresentationAnimatorForNavigation: NSObject, UIViewControllerAnimatedTransitioning {
    let isPresentation: Bool
    init(isPresentation: Bool) {
        self.isPresentation = isPresentation
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.33
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key = isPresentation ? UITransitionContextViewControllerKey.to
            : UITransitionContextViewControllerKey.from
        let controller = transitionContext.viewController(forKey: key)!
        
        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
        } else {
            let belowController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
            transitionContext.containerView.insertSubview(belowController.view, belowSubview: controller.view)
        }
        
        let presentedFrame = isPresentation ? transitionContext.finalFrame(for: controller) : transitionContext.initialFrame(for: controller)
        var dismissedFrame = presentedFrame
        dismissedFrame.origin.y = transitionContext.containerView.frame.size.height
        
        let initialFrame = isPresentation ? dismissedFrame : presentedFrame
        let finalFrame = isPresentation ? presentedFrame : dismissedFrame
        
        let animationDuration = transitionDuration(using: transitionContext)
        controller.view.frame = initialFrame
        
        UIView.animate(withDuration: animationDuration, animations: {
            controller.view.frame = finalFrame
        }) { finished in
            transitionContext.completeTransition(finished)
        }
    }
}
