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
    
    internal enum BottomSheet: StoryboardType {
        internal static let storyboardName = "BottomSheet"
        
        internal static let CollectionListViewController = SceneType<CollectionListViewController>(storyboard: BottomSheet.self, identifier: "CollectionListViewController")
        internal static let DetailItemViewController = SceneType<DetailItemViewController>(storyboard: BottomSheet.self, identifier: "DetailItemViewController")
        internal static let DetailLoanViewController = SceneType<DetailLoanViewController>(storyboard: BottomSheet.self, identifier: "DetailLoanViewController")
    }
    
    internal enum User: StoryboardType {
        internal static let storyboardName = "User"
        
        internal static let PersonalDataViewController = SceneType<PersonalDataViewController>(storyboard: User.self, identifier: "PersonalDataViewController")
        internal static let ListTransaksiViewController = SceneType<ListTransaksiViewController>(storyboard: User.self, identifier: "ListTransaksiViewController")
        internal static let ListPinjamanViewController = SceneType<ListPinjamanViewController>(storyboard: User.self, identifier: "ListPinjamanViewController")
        internal static let AboutUsViewController = SceneType<AboutUsViewController>(storyboard: User.self, identifier: "AboutUsViewController")
        internal static let ContactUsViewController = SceneType<ContactUsViewController>(storyboard: User.self, identifier: "ContactUsViewController")
        internal static let AddressSetupViewController = SceneType<AddressSetupViewController>(storyboard: User.self, identifier: "AddressSetupViewController")
        internal static let ChangePasswordViewController = SceneType<ChangePasswordViewController>(storyboard: User.self, identifier: "ChangePasswordViewController")
        internal static let AboutAppsViewController = SceneType<AboutAppsViewController>(storyboard: User.self, identifier: "AboutAppsViewController")
    }
    
    internal enum Pulsa: StoryboardType {
        internal static let storyboardName = "Pulsa"
        
        internal static let InputPhoneNumberViewController = SceneType<InputPhoneNumberViewController>(storyboard: Pulsa.self, identifier: "InputPhoneNumberViewController")
        
        internal static let InfoPulsaViewController = SceneType<InfoPulsaViewController>(storyboard: Pulsa.self, identifier: "InfoPulsaViewController")

        internal static let PaymentOptionPulsaViewController = SceneType<PaymentOptionPulsaViewController>(storyboard: Pulsa.self, identifier: "PaymentOptionPulsaViewController")

        internal static let PaymentVaViewController = SceneType<PaymentVaViewController>(storyboard: Pulsa.self, identifier: "PaymentVaViewController")

        internal static let PaymentSaldoViewController = SceneType<PaymentSaldoViewController>(storyboard: Pulsa.self, identifier: "PaymentSaldoViewController")
    }
    
    internal enum Bpjs: StoryboardType {
        internal static let storyboardName = "Bpjs"
        
        internal static let BpjsViewController = SceneType<BpjsViewController>(storyboard: Bpjs.self, identifier: "BpjsViewController")
        internal static let BpjsDetailInfoViewController = SceneType<BpjsDetailInfoViewController>(storyboard: Bpjs.self, identifier: "BpjsDetailInfoViewController")

    }
    
    internal enum Air: StoryboardType {
        internal static let storyboardName = "Air"
        
        internal static let AirViewController = SceneType<AirViewController>(storyboard: Air.self, identifier: "AirViewController")
    }
    
    internal enum Listrik: StoryboardType {
        internal static let storyboardName = "Listrik"
        
        internal static let ListrikViewController = SceneType<ListrikViewController>(storyboard: Listrik.self, identifier: "ListrikViewController")
    }
    
    internal enum Loan: StoryboardType {
        internal static let storyboardName = "Loan"
        
        internal static let ApplyLoanViewController = SceneType<ApplyLoanViewController>(storyboard: Loan.self, identifier: "ApplyLoanViewController")
        internal static let LoanDataViewController = SceneType<LoanDataViewController>(storyboard: Loan.self, identifier: "LoanDataViewController")

        internal static let LoanFinishViewController = SceneType<LoanFinishViewController>(storyboard: Loan.self, identifier: "LoanFinishViewController")

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
