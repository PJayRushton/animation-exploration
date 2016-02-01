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
    
    @IBOutlet weak var fakeCircleImageView: UIImageView!
    @IBOutlet weak var plusButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusButton.clipsToBounds = true
    }

    @IBAction func dismissButtonPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Going to controller: \(segue.destinationViewController)")
    }

}

