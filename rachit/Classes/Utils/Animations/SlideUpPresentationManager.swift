//
//  SlideInPresentationManager.swift
//  etmoneyios
//
//  Created by Rachit Khattar on 17/07/18.
//  Copyright © 2018 Dew Solutions Private Limited. All rights reserved.
//

import UIKit

class SlideUpPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        debugPrint("present1")
        let presentationController = SlideUpPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        debugPrint("present")
        return SlideUpPresentationAnimator(isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideUpPresentationAnimator(isPresentation: false)
    }
}
