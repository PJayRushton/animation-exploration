//
//  PinkAnimationController.swift
//  AnimationsExploration-Welbe
//
//  Created by Tim Shadel on 2/1/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import Foundation
import UIKit


class PinkAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 2.0

    var presenting = true
    var originFrame = CGRect.zero
    var snapshotView: UIView?

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!

        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let presentedVC = presenting ? toVC : fromVC
        // TODO: Return is probably bad here
        guard let plusVC = presentedVC as? PlusViewController else { return }

        if let snapshotView = snapshotView where presenting {
            plusVC.fakeCircleImageView.alpha = 0
            containerView?.insertSubview(snapshotView, aboveSubview: fromView)
            containerView?.insertSubview(toView, aboveSubview: snapshotView)
        } else {
            plusVC.fakeCircleImageView.alpha = 1
            containerView?.insertSubview(toView, belowSubview: fromView)
        }
        UIView.animateWithDuration(duration, animations: {
            if self.presenting {
                plusVC.fakeCircleImageView.alpha = 1
            } else {
                plusVC.fakeCircleImageView.alpha = 0
            }
        }) { completed in
            transitionContext.completeTransition(true)
        }
    }

}