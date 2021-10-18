//
//  HomeViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit
import FSPagerView

class HomeViewController: BaseViewController {

    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var vPager: FSPagerView!
    @IBOutlet weak var vPageControl: FSPageControl!
    @IBOutlet weak var cvList: UICollectionView!
    
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    
    let inset: CGFloat = 10
    let minimumLineSpacing: CGFloat = 10
    let minimumInteritemSpacing: CGFloat = 10
    let cellsPerRow = 4
    let vmAuth = UserAuthViewModel()
    let vmLoan = LoanViewModel()

    var buttonList = ["Pulsa",
                      "Paket Internet",
                      "Listrik",
                      "Tiket Pesawat",
                      "BPJS",
                      "Tagihan Air",
                      "Simpan Pinjam",
                      "Tiket Hotel"]
    var imgList = ["icPulsa",
                   "icPaketInternet",
                   "icListrik",
                   "icTiket",
                   "icBpjs",
                   "icTagihanAir",
                   "icSimpanPinjam",
                   "icTiket"]
    
    var imgOnboarding = ["imgBanner","imgBanner","imgBanner"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSearch.layer.cornerRadius = 5
        setupPagerView()
        self.setupCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.postCheckAuth()
        self.getUserDetail()
        self.getMicroloanBalance()
    }
    
    func setupCell(){
        cvList.delegate = self
        cvList.dataSource = self
        let nibCollection = UINib(nibName: "ListBoxCollectionViewCell", bundle: nil)
        cvList.register(nibCollection, forCellWithReuseIdentifier: "ButtonImageCell")
        cvList.allowsSelection = true
        cvList.contentInsetAdjustmentBehavior = .always
    }
    
    func postCheckAuth() {
        showLoading()
        vmAuth.getAuthCheck(
            body: ["":""],
            onSuccess: { response, message  in
                self.hideLoading()
                let defaults = UserDefaults.standard
                defaults.set(response.idUser, forKey: "userID")
                defaults.set(response.username, forKey: "username")
                defaults.set(response.isNewUser, forKey: "isNewUser")
                defaults.set(response.idRoleMaster, forKey: "idRoleMaster")
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            }
        )
    }
    
    func setupPagerView() {
        self.vPager.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        vPageControl.numberOfPages = imgOnboarding.count
        vPageControl.currentPage = 0
        
        if #available(iOS 13.0, *) {
            vPager.largeContentImageInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        } else {
            // Fallback on earlier versions
        }
        
        self.vPageControl.contentHorizontalAlignment = .leading
        self.vPageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.vPageControl.itemSpacing = 10
        self.vPager.transformer = FSPagerViewTransformer(type: .overlap)
        self.vPager.isInfinite = true
        self.vPageControl.setFillColor(UIColor(named: "green03"), for: .selected)
        self.vPageControl.setFillColor(UIColor(named: "black04"), for: .normal)
    }
    
    func getUserDetail() {
        showLoading()
        vmAuth.getUserDetails(
            body: ["id":userId],
            onSuccess: { response,message in
                self.hideLoading()
//                let urlPhoto = response.profile?.personalPhoto ?? ""
                let name = response.profile?.name ?? ""
                let email = response.profile?.email ?? ""
                let username = response.user?.username ?? ""
                let idKoperasi = response.profile?.idKoperasi ?? ""
                let joinDate = response.profile?.dateBecomeMember ?? ""
//                let motherName = response.profile?.motherName ?? ""
//                let birthdate = response.profile?.birthDate ?? ""
//                let birthPlace = response.profile?.birthPlace ?? ""
//                let agama = response.profile?.idReligion ?? ""
//                let noKtp = response.profile?.identityId ?? ""
//                let jenisKelamin = response.profile?.idGender ?? ""
//                let noHandphone = response.profile?.phoneNumber ?? ""
//                let statusKawin = response.profile?.idMarriageStatus ?? ""
//                let statusTempat = response.profile?.idDomicileAddressStatus ?? ""
//                let noNpwp = response.profile?.npwpNo ?? ""

                let defaults = UserDefaults.standard
                
                defaults.set(username, forKey: "username")
                defaults.set(name, forKey: "name")
                defaults.set(email, forKey: "email")
                defaults.set(joinDate, forKey: "joinDate")
                defaults.set(idKoperasi, forKey: "idKoperasi")

                self.lblUsername.text = name
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            })
    }
    
    func getMicroloanBalance() {
        showLoading()
        vmLoan.getMicroloanBalance(
            onSuccess: { response,message in
                self.hideLoading()
                let plafond = response.plafond ?? 0
                let unpaid = response.unpaid ?? 0
                let balance = response.balance ?? 0

                let defaults = UserDefaults.standard
                
                defaults.set(plafond, forKey: "plafond")
                defaults.set(unpaid, forKey: "unpaid")
                defaults.set(balance, forKey: "balance")

                self.lblBalance.text = "Rp \(balance)"
            }, onError: { error in
                self.hideLoading()
                self.showToast(message: error)
            }, onFailed: { failed in
                self.hideLoading()
                self.showToast(message: failed)
            })
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
    }
    
}

extension HomeViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imgOnboarding.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named:imgOnboarding[index])
        cell.imageView?.backgroundColor = UIColor.white
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.vPageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.vPageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonImageCell", for: indexPath) as! ListBoxCollectionViewCell
        cell.lblTitle.text = buttonList[indexPath.row]
        cell.ivTitle.image = UIImage(named: imgList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        cvList?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if buttonList[indexPath.row] == "Pulsa" {
            let vc = StoryboardScene.Pulsa.InputPhoneNumberViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if buttonList[indexPath.row] == "Paket Internet" {
            let vc = StoryboardScene.Pulsa.InputPhoneNumberViewController.instantiate()
            vc.isPaketData = true
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if buttonList[indexPath.row] == "BPJS" {
            let vc = StoryboardScene.Bpjs.BpjsViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if buttonList[indexPath.row] == "Listrik" {
            let vc = StoryboardScene.Listrik.ListrikViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
            showToast(message: "FITUR INI BELUM TERSEDIA")

        }
        if buttonList[indexPath.row] == "Tagihan Air" {
            let vc = StoryboardScene.Air.AirViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
//            showToast(message: "FITUR INI BELUM TERSEDIA")
        }
        if buttonList[indexPath.row] == "Simpan Pinjam" {
            let vc = StoryboardScene.Loan.ApplyLoanViewController.instantiate()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if buttonList[indexPath.row] == "Hotel" {
            showToast(message: "FITUR INI BELUM TERSEDIA")
        }
        if buttonList[indexPath.row] == "Flight" {
            showToast(message: "FITUR INI BELUM TERSEDIA")
        }
    }
}
