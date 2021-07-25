//
//  UserViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 18/07/21.
//

import UIKit

class UserViewController: UIViewController {

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
