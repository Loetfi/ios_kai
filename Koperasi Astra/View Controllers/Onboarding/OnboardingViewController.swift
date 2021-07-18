//
//  OnboardingViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 07/07/21.
//

import UIKit
import FSPagerView

class OnboardingViewController: UIViewController {

    @IBOutlet weak var pagerViewImage: FSPagerView!
    @IBOutlet weak var pagerViewControl: FSPageControl!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var btnSignIn: ButtonTemplate!
    
    
    var titleString = ["Aplikasi Koperasi Astra","Simpan Pinjam","Keanggotaan"]
    var subtitleString = ["Aplikasi yang memudahkan Anda. Kapanpun, dimanapun, apapun kebutuhan Anda","Setiap apapun kebutuhan Anda, Koperasi Astra selalu siap membantu","Anggota Koperasi Astra adalah karyawan Grup Astra"]
    var imgOnboarding = ["imgOnboarding1","imgOnboarding2","imgOnboarding3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagerView()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        // Do any additional setup after loading the view.
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == .right {
            if pagerViewImage.currentIndex != 0 {
                let prevIndex = pagerViewImage.currentIndex > 0 ? pagerViewImage.currentIndex - 1 : numberOfItems(in:self.pagerViewImage) - 1
                pagerViewImage.scrollToItem(at: prevIndex, animated: true)
            }
        } else if gesture.direction == .left {
            if pagerViewImage.currentIndex != 2 {
                let nextIndex = pagerViewImage.currentIndex + 1 < numberOfItems(in:self.pagerViewImage) ? pagerViewImage.currentIndex + 1 : 0
                pagerViewImage.scrollToItem(at: nextIndex, animated: true)
            } else {
                let vc = StoryboardScene.LoginRegister.loginViewController.instantiate()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func setupPagerView() {
        self.pagerViewImage.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        pagerViewControl.numberOfPages = imgOnboarding.count
        pagerViewControl.currentPage = 0
        labelTitle.text = titleString[0]
        labelSubtitle.text = subtitleString[0]
        
        if #available(iOS 13.0, *) {
            pagerViewImage.largeContentImageInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        } else {
            // Fallback on earlier versions
        }
        
        self.pagerViewControl.contentHorizontalAlignment = .center
        self.pagerViewControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.pagerViewControl.itemSpacing = 10
        self.pagerViewControl.setFillColor(UIColor(named: "green03"), for: .selected)
        self.pagerViewControl.setFillColor(UIColor(named: "black04"), for: .normal)
        pagerViewImage.transformer = FSPagerViewTransformer(type: .crossFading)
    }
    
    @IBAction func buttonSignInAction(_ sender: Any) {
        let vc = StoryboardScene.LoginRegister.loginViewController.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension OnboardingViewController: FSPagerViewDataSource, FSPagerViewDelegate {
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
        self.pagerViewControl.currentPage = targetIndex
        self.labelTitle.text = titleString[targetIndex]
        self.labelSubtitle.text = subtitleString[targetIndex]
    }
    //
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pagerViewControl.currentPage = pagerView.currentIndex
        self.labelTitle.text = titleString[pagerView.currentIndex]
        self.labelSubtitle.text = subtitleString[pagerView.currentIndex]
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
}
