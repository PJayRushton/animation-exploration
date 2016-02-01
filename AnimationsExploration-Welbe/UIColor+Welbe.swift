//
//  UIColor+Welbe.swift
//  welbe
//
//  Created by Ben Norris on 1/5/16.
//  Copyright © 2016 O.C. Tanner Corporation. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func welbePink() -> UIColor {
        return UIColor(hex: 0xff0066)
    }
    
    class func welbeDarkGray() -> UIColor {
        return blackTwo()
    }
    
    class func welbeGrayOne() -> UIColor {
        return grayOne()
    }
    
    class func welbeGrayTwo() -> UIColor {
        return grayTwo()
    }
    
    class func welbeErrorRed() -> UIColor {
        return redOne()
    }
    
    class func tableViewBackgroundColor() -> UIColor {
        return grayOne()
    }
    
    class func separatorColor() -> UIColor {
        return grayFour()
    }

}


// MARK: - Private colors

private extension UIColor {
    
    // MARK: - Grays
    
    class func grayOne() -> UIColor {
        return UIColor(hex: 0xf2f2f2)
    }
    
    class func grayTwo() -> UIColor {
        return UIColor(hex: 0xe3e3e3)
    }
    
    class func grayThree() -> UIColor {
        return UIColor(hex: 0xd4d4d4)
    }
    
    class func grayFour() -> UIColor {
        return UIColor(hex: 0xc1c1c1)
    }
    
    
    // MARK: - Blacks
    
    class func blackOne() -> UIColor {
        return UIColor(hex: 0x000000)
    }
    
    class func blackTwo() -> UIColor {
        return UIColor(hex: 0x333333)
    }
    
    
    // MARK: - Reds
    
    class func redOne() -> UIColor {
        return UIColor(hex: 0xc00)
    }
    
}


// MARK: - HEX init

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex >> 16) & 0xFF)/255.0
        let green = CGFloat((hex >> 8) & 0xFF)/255.0
        let blue = CGFloat((hex) & 0xFF)/255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
