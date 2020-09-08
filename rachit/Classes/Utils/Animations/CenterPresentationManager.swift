//
//  CenterPresentationManager.swift
//  etmoneyios
//
//  Created by Rachit Khattar on 13/11/18.
//  Copyright © 2018 Dew Solutions Private Limited. All rights reserved.
//

import Foundation

class CenterPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = CenterPresentationController(presentedViewController: presented,
                                                                   presenting: presenting)
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CenterPresentationAnimator(isPresentation: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CenterPresentationAnimator(isPresentation: false)
    }
    
    
}
