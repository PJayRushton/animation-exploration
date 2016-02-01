//
//  SecondViewController.swift
//  AnimationsExploration-Welbe
//
//  Created by Parker Rushton on 1/30/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController {

    @IBAction func dismissButtonPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .welbePink()

    }


}

