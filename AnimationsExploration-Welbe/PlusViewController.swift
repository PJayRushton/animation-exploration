//
//  SecondViewController.swift
//  AnimationsExploration-Welbe
//
//  Created by Parker Rushton on 1/30/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!

    @IBOutlet weak var shapeView: UIView!
    var circleShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusButton.clipsToBounds = true

        circleShapeLayer.fillColor = UIColor.welbePink().CGColor
        let circlePath = CGPathCreateMutable()
        CGPathAddEllipseInRect(circlePath, nil, circleRectForPlusButton())
        CGPathCloseSubpath(circlePath)
        circleShapeLayer.path = circlePath
        shapeView.layer.addSublayer(circleShapeLayer)
    }

    func enlargeCircleShape() {
        let circlePath = CGPathCreateMutable()
        CGPathAddEllipseInRect(circlePath, nil, CGRect(x: 375/2 - 1173/2, y: 0, width: 1173, height: 476))
        CGPathCloseSubpath(circlePath)
        updateCircleShape(circlePath)
    }

    func reduceCircleShape() {
        let circlePath = CGPathCreateMutable()
        CGPathAddEllipseInRect(circlePath, nil, circleRectForPlusButton())
        CGPathCloseSubpath(circlePath)
        updateCircleShape(circlePath)
    }

    func circleRectForPlusButton() -> CGRect {
        return plusButton.convertRect(plusButton.bounds, toView: shapeView)
    }

    func updateCircleShape(path: CGPath) {
        let oldPath = circleShapeLayer.path
        let pathAppear = CABasicAnimation(keyPath: "path")
        pathAppear.duration = CATransaction.animationDuration()
        pathAppear.fromValue = oldPath
        pathAppear.toValue = path

        circleShapeLayer.addAnimation(pathAppear, forKey: "make the path appear")
        circleShapeLayer.path = path
    }

    @IBAction func dismissButtonPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Going to controller: \(segue.destinationViewController)")
    }

}

