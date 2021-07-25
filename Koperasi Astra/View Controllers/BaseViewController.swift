//
//  BaseViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 14/07/21.
//

import UIKit
import Hero
import JGProgressHUD

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    var swipeBackEnabled: Bool = true
    var reachability: Reachability?
    var constraint:NSLayoutConstraint?
    let hud = JGProgressHUD()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        onViewLoaded()
    }
    
    func onViewLoaded() {}
    
    override func viewDidAppear(_ animated: Bool) {
        if self.checkInternetConnection() == false {
            self.openNoInternet()
        }
        if swipeBackEnabled {
            // add swipe back gesture to presented view controller
            if self.isBeingPresented {
                let leftSwipeDismiss = UIPanGestureRecognizer(
                    target: self,
                    action: #selector(leftSwipeDismiss(gestureRecognizer:))
                )
                view.addGestureRecognizer(leftSwipeDismiss)
            } else {
                navigationController?.view.addGestureRecognizer((navigationController?.interactivePopGestureRecognizer)!)
            }
        } else {
            navigationController?.view.removeGestureRecognizer((navigationController?.interactivePopGestureRecognizer)!)
        }
    }
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "userFirstInstall") {
            return true
        } else {
            defaults.set(true, forKey: "userFirstInstall")
            return false
        }
    }
    
    func checkInternetConnection() -> Bool {
        self.reachability = try! Reachability.init()
        switch self.reachability!.connection {
        case .none:
            return false
        case .unavailable:
            return false
        case .wifi:
            return true
        case .cellular:
            return true
        }
    }
    
    func swipeBackConfig() {
        if swipeBackEnabled {
            // add swipe back gesture to presented view controller
            if self.isBeingPresented {
                let leftSwipeDismiss = UIPanGestureRecognizer(
                    target: self,
                    action: #selector(leftSwipeDismiss(gestureRecognizer:))
                )
                view.addGestureRecognizer(leftSwipeDismiss)
            } else {
                navigationController?.view.addGestureRecognizer((navigationController?.interactivePopGestureRecognizer)!)
            }
        } else {
            navigationController?.view.removeGestureRecognizer((navigationController?.interactivePopGestureRecognizer)!)
        }
    }
    
    @objc func leftSwipeDismiss(gestureRecognizer:UIPanGestureRecognizer) {
        
        switch gestureRecognizer.state {
        case .began:
            hero.dismissViewController()
        case .changed:
            
            let translation = gestureRecognizer.translation(in: nil)
            let progress = translation.x / 2.0 / view.bounds.width
            Hero.shared.update(progress)
            Hero.shared.apply(modifiers: [.translate(x: translation.x)], to: self.view)
            break
        default:
            let translation = gestureRecognizer.translation(in: nil)
            let progress = translation.x / 2.0 / view.bounds.width
            if progress + gestureRecognizer.velocity(in: nil).x / view.bounds.width > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
    
    func showLoading() {
        hud.textLabel.text = "Loading"
        hud.style = .dark
        hud.show(in: self.view)
    }
    
    func hideLoading() {
        hud.dismiss()
    }
    
    func openNoInternet() {
        showToast(message: "No Internet Connection")
    }
    
    func showToast(message : String) {
        let window = UIApplication.shared.windows[0]
        let toastLabel = UILabel(frame: CGRect(x: 20, y: window.safeAreaInsets.top + 70, width: self.view.frame.size.width - 40, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont(name: "Poppins-Regular", size: 11)!
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.5, delay: 0.3, options: .curveEaseIn, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
    func navigationBarSetup(navBar: NavigationBar, title: String, hideBackButton: Bool) {
        navBar.title = title
        navBar.isLeftButtonHidden = hideBackButton
        let completionHandler:(NavigationBar) -> Void = { vc in
            self.navigationController?.popViewController(animated: true)
        }
        navBar.completionHandler = completionHandler
    }
    
    func fixKeyboardScroll() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardNotification(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let endFrameY = endFrame?.origin.y ?? 0
            let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
            if endFrameY >= UIScreen.main.bounds.size.height {
                constraint?.constant = 0.0
            } else {
                constraint?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func goToHome() {
        let vc = StoryboardScene.Dashboard.dashboardViewController.instantiate()
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    func goToLogin() {
        let vc = StoryboardScene.LoginRegister.loginViewController.instantiate()
        self.navigationController?.setViewControllers([vc], animated: false)
    }
}
