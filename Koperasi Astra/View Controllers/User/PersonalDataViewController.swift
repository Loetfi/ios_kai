//
//  PersonalDataViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 30/09/21.
//

import UIKit
import PopupDialog

class PersonalDataViewController: BaseViewController {

    @IBOutlet weak var svPersonal: UIStackView!
    @IBOutlet weak var svPegawai: UIStackView!
    @IBOutlet weak var svGaji: UIStackView!
    @IBOutlet weak var svBank: UIStackView!
    @IBOutlet weak var svPendukung: UIStackView!
    
    @IBOutlet weak var vPendukung: UIView!
    @IBOutlet weak var vBank: UIView!
    @IBOutlet weak var vGaji: UIView!
    @IBOutlet weak var vPegawai: UIView!
    @IBOutlet weak var vPersonal: UIView!
    
    @IBOutlet weak var chevronPersonal: UIImageView!
    @IBOutlet weak var chevronPegawai: UIImageView!
    @IBOutlet weak var chevronGaji: UIImageView!
    @IBOutlet weak var chevronBank: UIImageView!
    @IBOutlet weak var chevronPendukung: UIImageView!
    
    @IBOutlet weak var navBar: NavigationBar!
    @IBOutlet weak var ivProfilePicture: UIImageView!
    
    //Textfield
    @IBOutlet weak var tfNoAnggota: UITextField!
    @IBOutlet weak var tfNamaLengkap: UITextField!
    @IBOutlet weak var tfTanggalLahir: UITextField!
    @IBOutlet weak var tfTempatLahir: UITextField!
    @IBOutlet weak var tfAgama: UITextField!
    @IBOutlet weak var tfJenisKelamin: UITextField!
    @IBOutlet weak var tfNoKtp: UITextField!
    @IBOutlet weak var tfNoHandphone: UITextField!
    @IBOutlet weak var tfStatusKawin: UITextField!
    @IBOutlet weak var tfStatusTempat: UITextField!
    @IBOutlet weak var tfNoNpwp: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfNamaIbu: UITextField!
    
    @IBOutlet weak var tfNik: UITextField!
    @IBOutlet weak var tfNamaPerusahaan: UITextField!
    @IBOutlet weak var tfTanggalKaryawan: UITextField!
    @IBOutlet weak var tfDivisi: UITextField!
    @IBOutlet weak var tfJabatan: UITextField!

    @IBOutlet weak var tfNilaiGaji: UITextField!
    @IBOutlet weak var tfGolongan: UITextField!
    @IBOutlet weak var tfSlipGaji: UITextField!
    
    @IBOutlet weak var tfNamaBank: UITextField!
    @IBOutlet weak var tfNamaCabang: UITextField!
    @IBOutlet weak var tfNoRekening: UITextField!
    @IBOutlet weak var tfNamaRekening: UITextField!
    
    let vm = UserAuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivProfilePicture.layer.cornerRadius = 45
        navigationBarSetup(navBar: navBar, title: "Data Personal", hideBackButton: false)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction1))
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction2))
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction3))
        let gesture4 = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction4))

        self.vPendukung.addGestureRecognizer(gesture)
        self.vBank.addGestureRecognizer(gesture1)
        self.vGaji.addGestureRecognizer(gesture2)
        self.vPegawai.addGestureRecognizer(gesture3)
        self.vPersonal.addGestureRecognizer(gesture4)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getUserDetail()
    }
    
    func getUserDetail() {
        showLoading()
        vm.getUserDetails(
            body: ["id":userId],
            onSuccess: { response,message in
                self.hideLoading()
                let urlPhoto = response.profile?.personalPhoto ?? ""
                let name = response.profile?.name ?? ""
                let motherName = response.profile?.motherName ?? ""
                let birthdate = response.profile?.birthDate ?? ""
                let username = response.user?.username ?? ""
                let birthPlace = response.profile?.birthPlace ?? ""
                let agama = response.profile?.idReligion ?? ""
                let noKtp = response.profile?.identityId ?? ""
                let jenisKelamin = response.profile?.idGender ?? ""
                let noHandphone = response.profile?.phoneNumber ?? ""
                let statusKawin = response.profile?.idMarriageStatus ?? ""
                let statusTempat = response.profile?.idDomicileAddressStatus ?? ""
                let noNpwp = response.profile?.npwpNo ?? ""
                let email = response.profile?.email ?? ""

                self.ivProfilePicture.loadImage(url: urlPhoto, into: self.ivProfilePicture)
                self.tfNoAnggota.text = username
                self.tfNamaIbu.text = motherName
                self.tfNamaLengkap.text = name
                self.tfNamaIbu.text = motherName
                self.tfTanggalLahir.text = birthdate
                self.tfTempatLahir.text = birthPlace
                self.tfAgama.text = agama
                self.tfJenisKelamin.text = jenisKelamin
                self.tfNoKtp.text = noKtp
                self.tfNoHandphone.text = noHandphone
                self.tfStatusKawin.text = statusKawin
                self.tfStatusTempat.text = statusTempat
                self.tfNoNpwp.text = noNpwp
                self.tfEmail.text = email

//                let defaults = UserDefaults.standard
                
//                defaults.set(response.token, forKey: "authToken")
//                defaults.set(response.isNewUser, forKey: "isNewUser")
//                defaults.set(response.idRoleMaster, forKey: "idRoleMaster")
//                self.goToHome()
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            })
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        if svPendukung.isHidden {
            svPendukung.isHidden = false
            chevronPendukung.image = UIImage(systemName: "chevron.up")
        } else {
            svPendukung.isHidden = true
            chevronPendukung.image = UIImage(systemName: "chevron.down")
        }
    }
    @objc func checkAction1(sender : UITapGestureRecognizer) {
        if svBank.isHidden {
            svBank.isHidden = false
            chevronBank.image = UIImage(systemName: "chevron.up")
        } else {
            svBank.isHidden = true
            chevronBank.image = UIImage(systemName: "chevron.down")
        }
        
    }
    @objc func checkAction2(sender : UITapGestureRecognizer) {
        if svGaji.isHidden {
            svGaji.isHidden = false
            chevronGaji.image = UIImage(systemName: "chevron.up")
        } else {
            svGaji.isHidden = true
            chevronGaji.image = UIImage(systemName: "chevron.down")
        }
    }
    @objc func checkAction3(sender : UITapGestureRecognizer) {
        if svPegawai.isHidden {
            svPegawai.isHidden = false
            chevronPegawai.image = UIImage(systemName: "chevron.up")

        } else {
            svPegawai.isHidden = true
            chevronPegawai.image = UIImage(systemName: "chevron.down")

        }
    }
    @objc func checkAction4(sender : UITapGestureRecognizer) {
        if svPersonal.isHidden {
            svPersonal.isHidden = false
            chevronPersonal.image = UIImage(systemName: "chevron.up")

        } else {
            svPersonal.isHidden = true
            chevronPersonal.image = UIImage(systemName: "chevron.down")

        }
    }
    
    func callPopup(title: String, success: Bool) {
        let vc = PopupAlertViewController(nibName: "PopupAlertViewController", bundle: nil)
        if success {
            vc.stringSuccess = title
        } else {
            vc.stringError = title
            vc.alertError = true
        }
        let completionHandler:(PopupAlertViewController) -> Void = { vc in
            
        }
        vc.completionHandler = completionHandler
        showPopupDialog(viewController: vc)
    }
    @IBAction func updateBankButtonTap(_ sender: Any) {
        callPopup(title: "Data informasi bank berhasil diubah", success: true)
    }
    @IBAction func updateGajiButtonTap(_ sender: Any) {
        callPopup(title: "Data gaji pokok berhasil diubah", success: true)
    }
    @IBAction func updateDataPersonalButtonTap(_ sender: Any) {
        callPopup(title: "Data personal berhasil diubah", success: true)
    }
    @IBAction func updatePegawaiButtonTap(_ sender: Any) {
        callPopup(title: "Data pegawai berhasil diubah", success: true)
    }
    @IBAction func updateDocumentButtonTap(_ sender: Any) {
        callPopup(title: "Data pendukung pinjaman berhasil diubah", success: true)
    }
}
