//
//  CustomTabBarController.swift
//  falkor
//
//  Created by Ben Norris on 1/18/16.
//  Copyright © 2016 OC Tanner. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, SegueHandlerType {
    
    // MARK: - Enums
    
    enum SegueIdentifier: String {
        case ShowPlusMenu = "PresentPlusButtonSegue"
        case ShowLogin = "ShowLoginSegue"
    }
    
    enum Tab: Int {
        case Goals
        case Events
        case Plus
        case Groups
        case Settings
        
        var dataObject: TabDataObject {
            switch self {
            case .Goals:
                return TabDataObject(title: "Goals", imageName: "goals")
            case .Events:
                return TabDataObject(title: "Events", imageName: "events")
            case .Plus:
                return TabDataObject(title: nil, imageName: "add")
            case .Groups:
                return TabDataObject(title: "Groups", imageName: "groups")
            case .Settings:
                return TabDataObject(title: "Settings", imageName: "settings")
            }
        }
    }
    
    
    // MARK: - Public properties
    
    @IBOutlet var popUpView: PlusPopUpView!
    @IBOutlet var customTabBar: CustomTabBar!
    let animator = TransitionAnimationHelper()
    
    var isPoppedUp: Bool = false
    
    
    // MARK: - Private properties
    
    private var customSelectedIndex: Int {
        if selectedIndex < Tab.Plus.rawValue {
            return selectedIndex
        }
        return selectedIndex + 1
    }
    
    // MARK: - Constants
    
    private let tabBarHeight: CGFloat = 48.0
    
    
    // MARK: - Lifecycle overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var count = 0
        var customTabDataObjects = [TabDataObject]()
        while let tab = Tab(rawValue: count) {
            customTabDataObjects.append(tab.dataObject)
            count += 1
        }
        customTabBar.dataObjects = customTabDataObjects
        tabBar.hidden = true
        displayCustomTabBar()
        view.backgroundColor = .lightGrayColor()
    }
    
    
    // MARK: - Public funcs
    
    func showLogIn() {
        performSegueWithIdentifier(.ShowLogin, sender: nil)
    }
    
    @IBAction func unwindToCustomTabBarController(segue: UIStoryboardSegue) { }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segueIdentifierForSegue(segue) {
        case .ShowPlusMenu:
            if let plusViewController = segue.destinationViewController as? PlusViewController {
                plusViewController.transitioningDelegate = self
            }
        case .ShowLogin:
            break
        }
    }
    
}


// MARK: Transition Delegate
extension CustomTabBarController: UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let plusButton = customTabBar.buttons[2]
        animator.originFrame = self.view.superview!.convertRect(plusButton.frame, toView: nil)
        animator.presenting = true
        
        return animator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator.presenting = false
        return animator
    }
    
}


// MARK: - Custom tab bar delegate

extension CustomTabBarController: CustomTabBarDelegate {
    
    func tabBar(tabBar: CustomTabBar, didSelectTab tab: Int) {
        if let selectedNav = selectedViewController as? UINavigationController where tab == customSelectedIndex {
            selectedNav.popToRootViewControllerAnimated(true)
        } else {
            guard let theTab = Tab(rawValue: tab) else { fatalError("No tab") }
            switch theTab {
            case .Goals:
                selectedIndex = 0
            case .Events:
                selectedIndex = 1
            case .Plus:
                selectedIndex = customSelectedIndex
                //                performSegueWithIdentifier(SegueIdentifier.ShowPlusMenu, sender: self)
                animatePopUpView(up: !isPoppedUp)
            case .Groups:
                selectedIndex = 2
            case .Settings:
                selectedIndex = 3
            }
        }
    }
    
}

extension CustomTabBarController: PopUpViewDelegate {
    func buttonPressed(buttonType: PopUpButtonType) {
        switch buttonType {
        case .LeftButton, .MiddleButton, .RightButton:
            print("Button pressed with Type: \(buttonType)")
        }
    }
}


// MARK: - Private functions

private extension CustomTabBarController {
    
    func displayCustomTabBar() {
        view.addSubview(customTabBar)
        customTabBar.delegate = self
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.heightAnchor.constraintEqualToConstant(tabBarHeight).active = true
        customTabBar.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor).active = true
        customTabBar.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
        customTabBar.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
    }
    
    func animatePopUpView(up up: Bool) {
        if up {
            view.addSubview(popUpView)
            popUpView.delegate = self
//            popUpView.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraint(popUpView.heightAnchor.constraintEqualToConstant(100))
            view.addConstraint(popUpView.widthAnchor.constraintEqualToAnchor(tabBar.widthAnchor))
            view.addConstraint(popUpView.leadingAnchor.constraintEqualToAnchor(tabBar.leadingAnchor))
            view.addConstraint(popUpView.trailingAnchor.constraintEqualToAnchor(tabBar.trailingAnchor))
            view.addConstraint(popUpView.topAnchor.constraintEqualToAnchor(tabBar.bottomAnchor))
        } else {
            popUpView.removeFromSuperview()
        }
    }

}
