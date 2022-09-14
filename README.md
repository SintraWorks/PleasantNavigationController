PleasantNavigationController
====

A UINavigationController will only tell you when it shows a new top view controller via a push, pop or setting of the view controller stack. You never know the type/direction of the move. PleasantNavigationController, a subclass of UINavigationController, communicates its navigation actions to its delegate with a more fine-grained approach, providing a richer context for your application flow.

Usage
====
Substitute PleasantNavigationController for UINavigationController wherever you need to know more about navigation events than UINavigationController tells you. PleasantNavigationController will let its delegate know whether it's about to push or pop an item (or items) respectively to or from the stack.

In the case of a push, the events you can intercept to handle the navigation are as follows:

```
+ pleasantNavigationController willPushViewController
+ pleasantNavigationController didPushViewController
pushed viewDidLoad
pushing viewWillDisappear
pushed viewWillAppear
- navigationController willShow viewController
pushing viewDidDisappear
pushed viewDidAppear
- navigationController didShow viewController
```    

The two methods listed with a '-' are the standard UInavigationControllerDelegate methods. These can be useful, but you won't be able to tell in these methods whether they are called in response to a push, a pop or another form of setting the view controllers. The PleasantNavigationController delegate methods (designated with a '+') are called right at the start of the push navigation. They allow your delegate to keep track of the type of action (in this case a push), and take any preparatory measures if needed.

Popping works similarly. The methods added by PleasantNavigationController are: 

```
+ willPopViewController
+ didPopViewController
+ willPopToViewController
+ didPopToViewController
+ willPopToRootViewController
+ didPopToRootViewController
```

Finally, when settings view controllers, these are the methods that are additionally called by PleasantNavigationController:

```
+ willSetViewControllers
+ didSetViewControllers
```

A very basic example project shows how you can intercept and interpret the navigation related calls.
