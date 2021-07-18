//
//  Storyboards.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import Foundation
import UIKit

internal enum StoryboardScene {
    
    internal enum LoginRegister: StoryboardType {
        internal static let storyboardName = "LoginRegister"
        
        internal static let loginViewController = SceneType<LoginViewController>(storyboard: LoginRegister.self, identifier: "LoginViewController")
        internal static let registerViewController = SceneType<RegisterViewController>(storyboard: LoginRegister.self, identifier: "RegisterViewController")
        internal static let termsConditionViewController = SceneType<TermsConditionsViewController>(storyboard: LoginRegister.self, identifier: "TermsConditionsViewController")
        internal static let forgotPasswordViewController = SceneType<ForgotPasswordViewController>(storyboard: LoginRegister.self, identifier: "ForgotPasswordViewController")
        internal static let otpViewController = SceneType<OtpViewController>(storyboard: LoginRegister.self, identifier: "OtpViewController")
        internal static let registerSuccessViewController = SceneType<RegisterSuccessViewController>(storyboard: LoginRegister.self, identifier: "RegisterSuccessViewController")
    }

    internal enum Onboarding: StoryboardType {
        internal static let storyboardName = "Onboarding"
        
        internal static let OnboardingViewController = SceneType<OnboardingViewController>(storyboard: Onboarding.self, identifier: "OnboardingViewController")
    }
    
    internal enum Dashboard: StoryboardType {
        internal static let storyboardName = "Dashboard"
        
        internal static let initialScene = InitialSceneType<DashboardNavigationViewController>(storyboard: Dashboard.self)

        internal static let dashboardNavigationController = SceneType<DashboardNavigationViewController>(storyboard: Dashboard.self, identifier: "DashboardNavigationViewController")

        internal static let dashboardViewController = SceneType<DashboardViewController>(storyboard: Dashboard.self, identifier: "DashboardViewController")
    }
}

internal protocol StoryboardType {
    static var storyboardName: String { get }
}

internal extension StoryboardType {
    static var storyboard: UIStoryboard {
        let name = self.storyboardName
        return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
    }
}

internal struct SceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    internal let identifier: String
    
    internal func instantiate() -> T {
        let identifier = self.identifier
        guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
        }
        return controller
    }
}

internal struct InitialSceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    
    internal func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not of the expected class \(T.self).")
        }
        return controller
    }
}

private final class BundleToken {}
