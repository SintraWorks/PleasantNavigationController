//
//  PleasantNavigationControllerTests.swift
//  PleasantNavigationControllerTests
//
//  Created by Antonio Nunes on 15/01/2019.
//  Copyright © 2019 SintraWorks. All rights reserved.
//

import XCTest
@testable import PleasantNavigationController

class PleasantNavigationControllerTests: XCTestCase {
    var willPushViewControllerCallCount: Int = 0
    var didPushViewControllerCallCount: Int = 0
    
    var willPopViewControllerCallCount: Int = 0
    var didPopViewControllerCallCount: Int = 0

    var willPopToViewControllerCallCount: Int = 0
    var didPopToViewControllerCallCount: Int = 0

    var willPopToRootViewControllerCallCount: Int = 0
    var didPopToRootViewControllerCallCount: Int = 0

    var willSetViewControllersCallCount: Int = 0
    var didSetViewControllersCallCount: Int = 0

    var navigationController = PleasantNavigationController(rootViewController: UIViewController())
    
    func testPush() {
        navigationController.pleasantDelegate = self
        
        navigationController.pushViewController(UIViewController(), animated: false)
        
        let expectedCallCount = 1
        XCTAssert(willPushViewControllerCallCount == expectedCallCount, "Expected willPushViewControllerCallCount of \(expectedCallCount), got \(willPushViewControllerCallCount)")
        XCTAssert(didPushViewControllerCallCount == expectedCallCount, "Expected didPushViewControllerCallCount of \(expectedCallCount), got \(didPushViewControllerCallCount)")
    }

    func testPop() {
        navigationController.pleasantDelegate = self
        
        let pushedViewController = UIViewController()
        navigationController.pushViewController(pushedViewController, animated: false)
        
        let expectedCallCount = 1
        XCTAssert(willPushViewControllerCallCount == expectedCallCount, "Expected willPushViewControllerCallCount of \(expectedCallCount), got \(willPushViewControllerCallCount)")
        XCTAssert(didPushViewControllerCallCount == expectedCallCount, "Expected didPushViewControllerCallCount of \(expectedCallCount), got \(didPushViewControllerCallCount)")
        
        let poppedViewController = navigationController.popViewController(animated: false)
        XCTAssert(poppedViewController === pushedViewController, "Popped view controller is not identical to pushed view controller")
        XCTAssert(willPopViewControllerCallCount == expectedCallCount, "Expected willPopViewControllerCallCount of \(expectedCallCount), got \(willPopViewControllerCallCount)")
        XCTAssert(didPopViewControllerCallCount == expectedCallCount, "Expected didPopViewControllerCallCount of \(expectedCallCount), got \(didPopViewControllerCallCount)")
    }

    func testPopToViewController() {
        navigationController.pleasantDelegate = self
        
        let pushedViewController1 = UIViewController()
        let pushedViewController2 = UIViewController()
        let pushedViewController3 = UIViewController()
        navigationController.pushViewController(pushedViewController1, animated: false)
        navigationController.pushViewController(pushedViewController2, animated: false)
        navigationController.pushViewController(pushedViewController3, animated: false)
        
        let expectedPushCallCount = 3
        XCTAssert(willPushViewControllerCallCount == expectedPushCallCount, "Expected willPushViewControllerCallCount of \(expectedPushCallCount), got \(willPushViewControllerCallCount)")
        XCTAssert(didPushViewControllerCallCount == expectedPushCallCount, "Expected didPushViewControllerCallCount of \(expectedPushCallCount), got \(didPushViewControllerCallCount)")
        
        let expectedPopCallCount = 1
        navigationController.popToViewController(pushedViewController1, animated: false)
        XCTAssert(willPopToViewControllerCallCount == expectedPopCallCount, "Expected willPopToViewControllerCallCount of \(expectedPopCallCount), got \(willPopToViewControllerCallCount)")
        XCTAssert(didPopToViewControllerCallCount == expectedPopCallCount, "Expected didPopToViewControllerCallCount of \(expectedPopCallCount), got \(didPopToViewControllerCallCount)")
    }

    func testPopToRootViewController() {
        navigationController.pleasantDelegate = self
        
        let pushedViewController1 = UIViewController()
        let pushedViewController2 = UIViewController()
        let pushedViewController3 = UIViewController()
        navigationController.pushViewController(pushedViewController1, animated: false)
        navigationController.pushViewController(pushedViewController2, animated: false)
        navigationController.pushViewController(pushedViewController3, animated: false)
        
        let expectedPushCallCount = 3
        XCTAssert(willPushViewControllerCallCount == expectedPushCallCount, "Expected willPushViewControllerCallCount of \(expectedPushCallCount), got \(willPushViewControllerCallCount)")
        XCTAssert(didPushViewControllerCallCount == expectedPushCallCount, "Expected didPushViewControllerCallCount of \(expectedPushCallCount), got \(didPushViewControllerCallCount)")
        
        let expectedPopCallCount = 1
        navigationController.popToRootViewController(animated: false)
        XCTAssert(willPopToRootViewControllerCallCount == expectedPopCallCount, "Expected willPopRootToViewControllerCallCount of \(expectedPopCallCount), got \(willPopToRootViewControllerCallCount)")
        XCTAssert(didPopToRootViewControllerCallCount == expectedPopCallCount, "Expected didPopRootToViewControllerCallCount of \(expectedPopCallCount), got \(didPopToRootViewControllerCallCount)")
    }
    
    func testSetViewControllers() {
        navigationController.delegate = self
        
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()
        let viewController3 = UIViewController()
        navigationController.setViewControllers([viewController1, viewController2, viewController3], animated: false)
        
        let expectedSetCallCount = 1
        XCTAssert(willSetViewControllersCallCount == expectedSetCallCount, "Expected willPushViewControllerCallCount of \(expectedSetCallCount), got \(willSetViewControllersCallCount)")
        XCTAssert(didSetViewControllersCallCount == expectedSetCallCount, "Expected didPushViewControllerCallCount of \(expectedSetCallCount), got \(didSetViewControllersCallCount)")
    }

}

extension PleasantNavigationControllerTests: PleasantNavigationControllerDelegate {
    func willPushViewController(_ viewController: UIViewController, animated: Bool) {
        willPushViewControllerCallCount += 1
    }
    
    func didPushViewController(_ viewController: UIViewController, animated: Bool) {
        didPushViewControllerCallCount += 1
    }
    
    func willPopViewController(_ viewController: UIViewController?, animated: Bool) {
        willPopViewControllerCallCount += 1
    }
    
    func didPopViewController(_ viewController: UIViewController?, animated: Bool) {
        didPopViewControllerCallCount += 1
    }
    
    func willPopToViewController(_ viewController: UIViewController, animated: Bool) {
        willPopToViewControllerCallCount += 1
    }
    
    func didPopToViewController(_ viewController: UIViewController, animated: Bool) {
        didPopToViewControllerCallCount += 1
    }
    
    func willPopToRootViewController(animated: Bool) {
        willPopToRootViewControllerCallCount += 1
    }
    
    func didPopToRootViewController(animated: Bool) {
        didPopToRootViewControllerCallCount += 1
    }
    
    func willSetViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        willSetViewControllersCallCount += 1
    }
    
    func didSetViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        didSetViewControllersCallCount += 1
    }
}
