//
//  CenterPresentationAnimator.swift
//  etmoneyios
//
//  Created by Rachit Khattar on 13/11/18.
//  Copyright © 2018 Dew Solutions Private Limited. All rights reserved.
//

import Foundation

public class CenterPresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let isPresentation: Bool
    init(isPresentation: Bool) {
        self.isPresentation = isPresentation
        super.init()
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.33
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let key = isPresentation ? UITransitionContextViewControllerKey.to
            : UITransitionContextViewControllerKey.from
        let controller = transitionContext.viewController(forKey: key)!
        
        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
        }
        
        let presentedFrame = isPresentation ? transitionContext.finalFrame(for: controller) : transitionContext.initialFrame(for: controller)
        
        let centreFrame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 0, height: 0)
        
        let initialFrame = isPresentation ? centreFrame : presentedFrame
        let finalFrame = isPresentation ? presentedFrame : centreFrame
        
        let initialTransformScale = isPresentation ? CGAffineTransform(scaleX: 0, y: 0) : CGAffineTransform(scaleX: 1, y: 1)
        let finalTransformScale = isPresentation ? CGAffineTransform(scaleX: 1, y: 1) : CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        let animationDuration = transitionDuration(using: transitionContext)
        controller.view.frame = initialFrame
        controller.view.transform = initialTransformScale
        
        UIView.animate(withDuration: animationDuration, animations: {
            if self.isPresentation {
                controller.view.frame = finalFrame
                controller.view.transform = finalTransformScale
            } else {
                controller.view.transform = finalTransformScale
            }
        }) { finished in
            transitionContext.completeTransition(finished)
        }
    }
}
