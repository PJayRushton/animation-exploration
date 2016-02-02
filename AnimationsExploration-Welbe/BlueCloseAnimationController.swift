//
//  BlueCloseAnimationController.swift
//  AnimationsExploration-Welbe
//
//  Created by Tim Shadel on 2/1/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import Foundation
import UIKit


class BlueCloseAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 0.2
    var context: UIViewControllerContextTransitioning?

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!

        let backgroundView = containerView?.subviews.first
        toView.alpha = 0
        UIView.animateWithDuration(duration, animations: { () -> Void in
            fromView.alpha = 0
        }) { completedFade in

            // TODO: not return
            guard let circleShapeLayer = backgroundView?.layer.sublayers?.first as? CAShapeLayer else { return }


            let fullPath = CGPathCreateMutable()
            // TODO: y value come from open controller
            let side = fromView.frame.height
            let radius = side * 1.41421356237 / 2
            CGPathAddEllipseInRect(fullPath, nil, CGRect(x: 375 - side/2 - radius, y: 570 + side/2 - radius, width: radius*2, height: radius*2))
            CGPathCloseSubpath(fullPath)
            circleShapeLayer.path = fullPath


            let oldPath = circleShapeLayer.path
            let pathAppear = CABasicAnimation(keyPath: "path")
            pathAppear.duration = 0.3
            pathAppear.fromValue = oldPath

            let circlePath = CGPathCreateMutable()
            // TODO: y value come from open controller
            CGPathAddEllipseInRect(circlePath, nil, CGRect(x: 375, y: 570, width: 0, height: 0))
            CGPathCloseSubpath(circlePath)
            pathAppear.toValue = circlePath

            self.context = transitionContext
            pathAppear.delegate = self
            circleShapeLayer.addAnimation(pathAppear, forKey: "make the path appear")
            circleShapeLayer.path = circlePath

//            UIView.animateWithDuration(self.duration, animations: { () -> Void in
//                backgroundView?.alpha = 0
//            }) { completed in
//                transitionContext.completeTransition(true)
//            }
        }
    }


    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        context?.completeTransition(true)
    }

}