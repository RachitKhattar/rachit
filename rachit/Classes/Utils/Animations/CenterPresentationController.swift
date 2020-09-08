//
//  CenterPresentationController.swift
//  etmoneyios
//
//  Created by Rachit Khattar on 13/11/18.
//  Copyright © 2018 Dew Solutions Private Limited. All rights reserved.
//

import Foundation

class CenterPresentationController: UIPresentationController {
    fileprivate var dimmingView: UIView!
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController,
                   presenting: presentingViewController)
        setupDimmingView()
    }
    
    
    
    func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
    }
    
    override func presentationTransitionWillBegin() {
        containerView?.insertSubview(dimmingView, at: 0)
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|",
                                           options: [], metrics: nil, views: ["dimmingView": dimmingView!]))
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|",
                                           options: [], metrics: nil, views: ["dimmingView": dimmingView!]))
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width, height: parentSize.height)
    }
}
