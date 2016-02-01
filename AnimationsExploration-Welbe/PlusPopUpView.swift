//
//  PlusPopUpView.swift
//  AnimationsExploration-Welbe
//
//  Created by Parker Rushton on 2/1/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

enum PopUpButtonType {
    case LeftButton
    case MiddleButton
    case RightButton
}

protocol PopUpViewDelegate {
    func buttonPressed(buttonType: PopUpButtonType)
}

@IBDesignable
class PlusPopUpView: UIView {
    
    var delegate: PopUpViewDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundTop()
    }
    
    func roundTop() {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSizeMake(bounds.width, bounds.height)).CGPath
        maskLayer.backgroundColor = UIColor.welbePink().CGColor
        layer.mask = maskLayer
    }
    
    @IBAction func leftButtonPressed(sender: UIButton) {
        delegate?.buttonPressed(.LeftButton)
    }
    
    @IBAction func middleButtonPressed(sender: UIButton) {
        delegate?.buttonPressed(.MiddleButton)
    }
    
    @IBAction func rightButtonPressed(sender: UIButton) {
        delegate?.buttonPressed(.RightButton)
    }

}
