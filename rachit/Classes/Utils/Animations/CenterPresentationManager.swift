//
//  CenterPresentationManager.swift
//  etmoneyios
//
//  Created by Rachit Khattar on 13/11/18.
//  Copyright © 2018 Dew Solutions Private Limited. All rights reserved.
//

import Foundation

public class CenterPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = CenterPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CenterPresentationAnimator(isPresentation: true)
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CenterPresentationAnimator(isPresentation: false)
    }
    
    
}
