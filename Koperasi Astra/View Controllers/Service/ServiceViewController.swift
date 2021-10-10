//
//  ServiceViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 18/07/21.
//

import UIKit

class ServiceViewController: BaseViewController {

    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var serviceTableView: UITableView!
    
    var titleList = [
        "Pulsa",
        "Paket Internet",
        "Listrik",
        "Tiket Pesawat",
        "BPJS",
        "Tagihan Air",
        "Simpan Pinjam",
        "Tiket Hotel"
    ]
    
    var imageNameList = [
        "icPulsa",
        "icPaketInternet",
        "icListrik",
        "icTiket",
        "icBpjs",
        "icTagihanAir",
        "icSimpanPinjam",
        "icTiket"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navBar.title = "Service"
        navBar.isLeftButtonHidden = true
        setupTableView()
    }
    
    func setupTableView() {
        serviceTableView.delegate = self
        serviceTableView.dataSource = self
        
        let nib = UINib.init(nibName: "ButtonListTableViewCell", bundle: nil)
        serviceTableView.register(nib, forCellReuseIdentifier: "ButtonList")
    }
}


extension ServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonList", for: indexPath) as! ButtonListTableViewCell
        
        if (indexPath.startIndex != 0) {
            cell.topLineHidden = true
        } else if (indexPath.endIndex != 0) {
            cell.bottomLineHidden = true
        }
        
        cell.imageName = imageNameList[indexPath.row]
        cell.title = titleList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if titleList[indexPath.row] == "Pulsa" {
            let vc = StoryboardScene.Pulsa.InputPhoneNumberViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if titleList[indexPath.row] == "Paket Internet" {
            let vc = StoryboardScene.Pulsa.InputPhoneNumberViewController.instantiate()
            vc.isPaketData = true
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if titleList[indexPath.row] == "BPJS" {
            let vc = StoryboardScene.Bpjs.BpjsViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if titleList[indexPath.row] == "Listrik" {
            let vc = StoryboardScene.Listrik.ListrikViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if titleList[indexPath.row] == "Tagihan Air" {
            let vc = StoryboardScene.Air.AirViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
//            showToast(message: "FITUR INI BELUM TERSEDIA")
        }
        if titleList[indexPath.row] == "Simpan Pinjam" {
            let vc = StoryboardScene.Loan.ApplyLoanViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if titleList[indexPath.row] == "Hotel" {
            showToast(message: "FITUR INI BELUM TERSEDIA")
        }
        if titleList[indexPath.row] == "Flight" {
            showToast(message: "FITUR INI BELUM TERSEDIA")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}
