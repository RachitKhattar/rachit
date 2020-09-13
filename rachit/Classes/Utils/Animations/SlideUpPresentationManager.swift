//
//  SlideInPresentationManager.swift
//  etmoneyios
//
//  Created by Rachit Khattar on 17/07/18.
//  Copyright © 2018 Dew Solutions Private Limited. All rights reserved.
//

import UIKit

public class SlideUpPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        debugPrint("present1")
        let presentationController = SlideUpPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        debugPrint("present")
        return SlideUpPresentationAnimator(isPresentation: true)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideUpPresentationAnimator(isPresentation: false)
    }
}
