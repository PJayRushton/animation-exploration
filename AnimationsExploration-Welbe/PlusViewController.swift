//
//  SecondViewController.swift
//  AnimationsExploration-Welbe
//
//  Created by Parker Rushton on 1/30/16.
//  Copyright © 2016 AppsByPJ. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController {

    @IBOutlet weak var fakeCircleImageView: UIImageView!
    @IBOutlet weak var addButtonView: UIButton!

    @IBAction func dismissButtonPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fakeCircleImageView.image = UIImage(named: "add")?.imageWithRenderingMode(.AlwaysTemplate)
        fakeCircleImageView.tintColor = UIColor(hex: 0xff66a3)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Going to controller: \(segue.destinationViewController)")
    }

}

