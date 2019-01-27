//
//  ViewCoordinator.swift
//  Example
//
//  Created by Antonio Nunes on 22/01/2019.
//  Copyright © 2019 SintraWorks. All rights reserved.
//

import UIKit
import PleasantNavigationController

class MainViewCoordinator: NSObject {
    var navigationAction: PleasantNavigationController.NavigationAction = .none
    var currentViewController: UIViewController
    var previousViewController: UIViewController?
    
    init(baseViewController: UIViewController) {
        currentViewController = baseViewController
    }
    
    func start() -> UIWindow {
        return setupViewHierarchy()
    }
    
    private func setupViewHierarchy() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? PleasantNavigationController else {
            fatalError("This app requires a PleasantNavigationController as the root view controller.")
        }
        window.rootViewController = viewController
        viewController.delegate = self
        return window
    }
}

// MARK: - PleasantNavigationControllerDelegate

extension MainViewCoordinator: PleasantNavigationControllerDelegate {
    func willPushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationAction = .push
    }
    
    func didPushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationAction = .push
    }
    
    func willPopViewController(_ viewController: UIViewController?, animated: Bool) {
        navigationAction = .pop
        willPop(viewController)
    }
    
    func didPopViewController(_ viewController: UIViewController?, animated: Bool) {
        navigationAction = .pop
        previousViewController = viewController
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        switch navigationAction {
        case .pop:
            willShowPopped(viewController)
        default:
            break
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        navigationAction = .none
    }
}

// MARK: - Navigation Handling

extension MainViewCoordinator {
    private func willPop(_ viewController: UIViewController?) {
        if let poppedViewController = viewController as? PushedViewController2 {
            poppedViewController.showGoodbye()
        }
    }
    
    private func willShowPopped(_ viewController: UIViewController) {
        guard
            let poppedViewController = previousViewController,
            let viewControllerToShow = viewController as? BaseViewController
            else { return }
        viewControllerToShow.poppedScreenName = poppedViewController.title
    }
}
