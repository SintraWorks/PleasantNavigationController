//
//  PleasantNavigationController.swift
//  NavControllerTest
//
//  Created by Antonio Nunes on 23/08/2018.
//  Copyright © 2018 SintraWorks.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
// (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL SINTRAWORKS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// Except as contained in this notice, the name of SintraWorks shall not be used in advertising or otherwise to promote the sale,
// use or other dealings in this Software without prior written authorization from SintraWorks.
//

import UIKit

/**
 A 'subprotocol' of UINavigationControllerDelegate that provides additional navigation hooks.
 */
@objc public protocol PleasantNavigationControllerDelegate: UINavigationControllerDelegate {
    /**
     Called just before the navigation controller pushes the new view controller onto its stack.
     - parameters:
         - viewController: The view controller whose view and navigation item properties are being shown.
         - animated: true if the transition is animated; otherwise, false.
     */
    @objc optional func willPushViewController(_ viewController: UIViewController, animated: Bool)

    /**
     Called just after the navigation controller pushed the new view controller onto its stack.
     - parameters:
         - viewController: The view controller being pushed.
         - animated: true if the transition is animated; otherwise, false.
     
     - Important:
     This method is called *before* the current view controller's `viewWillDisappear` method, as well as
     before the new view controller's `viewDidLoad` and `viewWillAppear` methods. You can act *after* the new view controller's
     viewWillAppear method, by implementing `UINavigationControllerDelegate`'s `navigationController(_:willShow:animated:)` function.
     */
    @objc optional func didPushViewController(_ viewController: UIViewController, animated: Bool)
    
    /**
     Called just before the navigation controller pops the view controller off its stack.
     - parameters:
         - viewController: The view controller being popped.
         - animated: true if the transition is animated; otherwise, false.
     */
    @objc optional func willPopViewController(_ viewController: UIViewController?, animated: Bool)

    /**
     Called just after the navigation controller popped the view controller off its stack.
     - parameters:
         - viewController: The view controller being popped.
         - animated: true if the transition is animated; otherwise, false.
     
     - Important:
     This method is called *before* the current view controller's `viewWillDisappear`, as well as
     before the new view controller's `viewWillAppear` methods. You can act *after* the new view controller's
     viewWillAppear method, by implementing `UINavigationControllerDelegate`'s `navigationController(_:willShow:animated:)` function.
     */
    @objc optional func didPopViewController(_ viewController: UIViewController?, animated: Bool)
    
    /**
     Called just before the navigation controller pops all view controllers above the target view controller off its stack.
     - parameters:
         - viewController: The view controller being popped to, and which will end up at the top of the navigation stack.
         - animated: true if the transition is animated; otherwise, false.
     */
    @objc optional func willPopToViewController(_ viewController: UIViewController, animated: Bool)

    /**
     Called just after the navigation controller popped all view controllers above the target view controller off its stack.
     - parameters:
         - viewController: The view controller popped to, and which is now at the top of the navigation stack.
         - animated: true if the transition is animated; otherwise, false.
     
     - Important:
     This method is called *before* the current view controller's `viewWillDisappear`, as well as
     before the new view controller's `viewWillAppear` methods. If you need to act *in between* those events,
     implement `UINavigationControllerDelegate`'s `navigationController(_:willShow:animated:)` function.
     */
    @objc optional func didPopToViewController(_ viewController: UIViewController, animated: Bool)
    
    /**
     Called just before the navigation controller pops its stack back to the the bottom view controller.
     - parameters:
         - animated: true if the transition is animated; otherwise, false.
     */
    @objc optional func willPopToRootViewController(animated: Bool)

    /**
     Called just after the navigation controller popped its stack back to the the bottom view controller.
     - parameters:
         - animated: true if the transition is animated; otherwise, false.
     
     - Important:
     This method is called *before* the current view controller's `viewWillDisappear`, as well as
     before the new view controller's `viewWillAppear` methods. If you need to act *in between* those events,
     implement `UINavigationControllerDelegate`'s `navigationController(_:willShow:animated:)` function.
     */
    @objc optional func didPopToRootViewController(animated: Bool)
    
    /**
     Called just before the navigation controller resets its stack to the supplied array of view controllers.
     - parameters:
         - viewControllers: The view controllers to place in the stack. The front-to-back order of the controllers in this array represents the new bottom-to-top order of the controllers in the navigation stack. Thus, the last item added to the array becomes the top item of the navigation stack.
         - animated: true if the transition is animated; otherwise, false.
     */
    @objc optional func willSetViewControllers(_ viewControllers: [UIViewController], animated: Bool)

    /**
     Called just after the navigation controller reset its stack to the supplied array of view controllers.
     - parameters:
         - viewControllers: The view controllers placed in the stack. The front-to-back order of the controllers in this array represents the new bottom-to-top order of the controllers in the navigation stack. Thus, the last item added to the array became the top item of the navigation stack.
         - animated: true if the transition is animated; otherwise, false.
     
     - Important:
     This method is called *before* the current view controller's `viewWillDisappear`, as well as
     before the new view controller's `viewWillAppear` methods. If you need to act *in between* those events,
     implement `UINavigationControllerDelegate`'s `navigationController(_:willShow:animated:)` function.
     */
    @objc optional func didSetViewControllers(_ viewControllers: [UIViewController], animated: Bool)
}


/**
 A subclass of UINavigationControllerDelegate that provides its delegate additional notification of navigation events.
 */
public class PleasantNavigationController: UINavigationController {
    public enum NavigationAction {
        case none
        case push
        case pop
        case popToRoot
        case set
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    public var pleasantDelegate: PleasantNavigationControllerDelegate? {
        get { return delegate as? PleasantNavigationControllerDelegate }
        set { delegate = newValue }
    }
    
    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pleasantDelegate?.willPushViewController?(viewController, animated: animated)
        super.pushViewController(viewController, animated: animated)
        pleasantDelegate?.didPushViewController?(viewController, animated: animated)
    }
    
    @discardableResult
    override public func popViewController(animated: Bool) -> UIViewController? {
        let poppedViewController = topViewController
        pleasantDelegate?.willPopViewController?(poppedViewController, animated: animated)
        defer { pleasantDelegate?.didPopViewController?(poppedViewController, animated: animated) }
        return super.popViewController(animated: animated)
    }
    
    @discardableResult
    override public func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        pleasantDelegate?.willPopToViewController?(viewController, animated: animated)
        defer { pleasantDelegate?.didPopToViewController?(viewController, animated: animated) }
        return super.popToViewController(viewController, animated: animated)
    }
    
    @discardableResult
    override public func popToRootViewController(animated: Bool) -> [UIViewController]? {
        pleasantDelegate?.willPopToRootViewController?(animated: animated)
        defer { pleasantDelegate?.didPopToRootViewController?(animated: animated) }
        return super.popToRootViewController(animated: animated)
    }
    
    override public func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        pleasantDelegate?.willSetViewControllers?(viewControllers, animated: animated)
        super.setViewControllers(viewControllers, animated: animated)
        pleasantDelegate?.didSetViewControllers?(viewControllers, animated: animated)
    }
}
