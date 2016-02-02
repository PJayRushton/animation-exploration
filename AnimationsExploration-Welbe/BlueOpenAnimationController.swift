//
//  BlueAnimationController.swift
//  AnimationsExploration-Welbe
//
//  Created by Tim Shadel on 2/1/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import Foundation
import UIKit


class BlueOpenAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    let duration = 0.3

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!

        let backgroundView = UIView(frame: fromView.frame)
        let circleShapeLayer = CAShapeLayer()
        circleShapeLayer.fillColor = UIColor(hex: 0x82C3F6).CGColor

        let circlePath = CGPathCreateMutable()
        // TODO: Actual phone width & height, not 375
        CGPathAddEllipseInRect(circlePath, nil, CGRect(x: 375/2 - 1173/2, y: 667-141, width: 1173, height: 1173))
        CGPathCloseSubpath(circlePath)
        circleShapeLayer.path = circlePath
        backgroundView.backgroundColor = .clearColor()
        backgroundView.layer.addSublayer(circleShapeLayer)

        backgroundView.alpha = 0
        containerView?.insertSubview(backgroundView, aboveSubview: fromView)
        UIView.animateWithDuration(0.08, animations: {
            backgroundView.alpha = 1
        }) { completedFade in

            UIView.animateWithDuration(self.duration, animations: {
                let originalPosition = circleShapeLayer.position
                // TODO: Actual height
                circleShapeLayer.position = CGPoint(x: originalPosition.x, y: originalPosition.y - 570)
            }) { completedMove in

                toView.alpha = 0
                containerView?.insertSubview(toView, aboveSubview: backgroundView)
                UIView.animateWithDuration(self.duration, animations: {
                    toView.alpha = 1
                    // Hide middle view so it's not seen on dismiss
//                    fromView.alpha = 0
                }) { completedMove in
                    transitionContext.completeTransition(true)
                }

            }

        }
    }

}