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

    let duration = 0.3

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

        let initialAlpha: CGFloat = presenting ? 0 : 1
        plusVC.firstButton.alpha = initialAlpha
        plusVC.secondButton.alpha = initialAlpha
        plusVC.thirdButton.alpha = initialAlpha

        if let snapshotView = snapshotView where presenting {
            containerView?.insertSubview(snapshotView, aboveSubview: fromView)
            containerView?.insertSubview(toView, aboveSubview: snapshotView)
        } else {
            containerView?.insertSubview(toView, belowSubview: fromView)
        }
        
        UIView.animateWithDuration(duration, animations: {
            let finalAlpha: CGFloat = self.presenting ? 1 : 0
            plusVC.firstButton.alpha = finalAlpha
            plusVC.secondButton.alpha = finalAlpha
            plusVC.thirdButton.alpha = finalAlpha
            let rotation = self.presenting ? CGAffineTransformMakeRotation(CGFloat(M_PI_4)) : CGAffineTransformIdentity
            plusVC.plusButton.transform = rotation
            if self.presenting {
                plusVC.enlargeCircleShape()
            } else {
                plusVC.reduceCircleShape()
            }
        }) { completed in
            transitionContext.completeTransition(true)
        }
    }

}