//
//  SegueHandlerType.swift
//  falkor
//
//  Created by Ben Norris on 1/18/16.
//  Copyright © 2016 OC Tanner. All rights reserved.
//

import UIKit

import UIKit

protocol SegueHandlerType {
    typealias SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)
    }
    
    func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, segueIdentifier = SegueIdentifier(rawValue: identifier)
            else { fatalError("Invalid segue identifier \(segue.identifier).") }
        return segueIdentifier
    }
}
