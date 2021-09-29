//
//  UserViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 18/07/21.
//

import UIKit
import PopupDialog

class UserViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var userMenuTableView: UITableView!
    
    var titleList = [
        "Data Personal",
        "Pengaturan Alamat",
        "Ubah Kata Sandi",
        "Tentang Koperasi Astra",
        "Tentang Aplikasi",
        "Hubungi Kami",
        "Keluar"
    ]
    
    var imageNameList = [
        "icDataPersonal",
        "icPengaturanAlamat",
        "icUbahKataSandi",
        "icTentangKoperasiAstra",
        "icTentangAplikasi",
        "icHubungiKami",
        "icKeluar"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBar.title = "User"
        navBar.isLeftButtonHidden = true
    }
    
    func setupTableView() {
        userMenuTableView.delegate = self
        userMenuTableView.dataSource = self
        
        let nib = UINib.init(nibName: "ButtonListTableViewCell", bundle: nil)
        userMenuTableView.register(nib, forCellReuseIdentifier: "ButtonList")
    }
    
    func showCustomDialog(animated: Bool = true, viewController: UIViewController) {
        let popup = PopupDialog(viewController: viewController,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        present(popup, animated: animated, completion: nil)
    }
    
    @IBAction func dataPersonalButtonTap(_ sender: Any) {
        let vc = StoryboardScene.User.PersonalDataViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pengaturanAlamatButtonTap(_ sender: Any) {
        let vc = StoryboardScene.User.AddressSetupViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func ubahPasswordButtonTap(_ sender: Any) {
        let vc = StoryboardScene.User.ChangePasswordViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func aboutUsButtonTap(_ sender: Any) {
        let vc = StoryboardScene.User.AboutUsViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func aboutAppsButtonTap(_ sender: Any) {
        let vc = StoryboardScene.User.AboutUsViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func contactUsButtonTap(_ sender: Any) {
        let vc = StoryboardScene.User.ContactUsViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func logoutButtonTap(_ sender: Any) {
        let logoutVC = PopupSelectionViewController(nibName: "PopupSelectionViewController", bundle: nil)
        let completionHandler:(PopupSelectionViewController) -> Void = { vc in
            let defaults = UserDefaults.standard
            defaults.set("", forKey: "authToken")
            defaults.set("", forKey: "isNewUser")
            defaults.set("", forKey: "idRoleMaster")
            self.goToLogin()
        }
        logoutVC.completionHandler = completionHandler
        showCustomDialog(viewController: logoutVC)
    }
}


extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonList", for: indexPath) as! ButtonListTableViewCell
        
        if (indexPath.startIndex != 0) {
            cell.topLineHidden = true
        } else if (indexPath.endIndex != 0) {
            cell.bottomLineHidden = true
            cell.titleColor = "red01"
        }
        
        cell.imageName = imageNameList[indexPath.row]
        cell.title = titleList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}
