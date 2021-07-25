//
//  OtpViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit

class OtpViewController: BaseViewController {
    @IBOutlet weak var navigationBar: NavigationBar!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var otpTimer: UILabel!
    @IBOutlet weak var tfOTP1: UITextField!
    @IBOutlet weak var tfOTP2: UITextField!
    @IBOutlet weak var tfOTP3: UITextField!
    @IBOutlet weak var tfOTP4: UITextField!
    
    @IBOutlet weak var btnResendOtp: UIButton!
    
    var timeCountdown = 5
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetup(navBar: navigationBar, title: "OTP", hideBackButton: false)
        constraint = bottomConstraint
        fixKeyboardScroll()
        textFieldSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnResendOtp.isHidden = true
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        self.otpTimer.text = self.timeFormatted(self.timeCountdown)
        if timeCountdown != 0 {
            timeCountdown -= 1
        } else {
            timer.invalidate()
            btnResendOtp.isHidden = false
        }
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func textFieldSetup() {
        tfOTP1.delegate = self
        tfOTP2.delegate = self
        tfOTP3.delegate = self
        tfOTP4.delegate = self
        
        tfOTP1.addTarget(self, action: #selector(self.textFieldDidChangeSelection(_:)), for: UIControl.Event.editingChanged)
        tfOTP2.addTarget(self, action: #selector(self.textFieldDidChangeSelection(_:)), for: UIControl.Event.editingChanged)
        tfOTP3.addTarget(self, action: #selector(self.textFieldDidChangeSelection(_:)), for: UIControl.Event.editingChanged)
        tfOTP4.addTarget(self, action: #selector(self.textFieldDidChangeSelection(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text
        
        if text?.utf16.count == 1{
            switch textField {
            case tfOTP1:
                tfOTP2.becomeFirstResponder()
            case tfOTP2:
                tfOTP3.becomeFirstResponder()
            case tfOTP3:
                tfOTP4.becomeFirstResponder()
            case tfOTP4:
                tfOTP4.becomeFirstResponder()
            default:
                break
            }
        }
        if text?.isEmpty == true {
            switch textField{
            case tfOTP1:
                tfOTP1.becomeFirstResponder()
            case tfOTP2:
                tfOTP2.becomeFirstResponder()
            case tfOTP3:
                tfOTP3.becomeFirstResponder()
            case tfOTP4:
                tfOTP4.becomeFirstResponder()
            default:
                break
            }
        }
    }
    
    @IBAction func sendOtpButtonAction(_ sender: Any) {
        let vc = StoryboardScene.LoginRegister.registerSuccessViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func requestOtpButtonAction(_ sender: Any) {
        timeCountdown = 300
        btnResendOtp.isHidden = true
        otpTimer.isHidden = false
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
}


extension OtpViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}

