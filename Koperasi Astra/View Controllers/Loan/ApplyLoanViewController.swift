//
//  ApplyLoanViewController.swift
//  Koperasi Astra
//
//  Created by Kevin Correzian on 04/10/21.
//

import UIKit
import FittedSheets

class ApplyLoanViewController: BaseViewController {

    @IBOutlet weak var v1: CardView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl1Sub: UILabel!
    
    @IBOutlet weak var v12: UIView!
    
    @IBOutlet weak var v2: CardView!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl2Sub: UILabel!
    
    @IBOutlet weak var v23: UIView!

    @IBOutlet weak var v3: CardView!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl3Sub: UILabel!
    
    @IBOutlet weak var v34: UIView!

    @IBOutlet weak var v4: CardView!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl4Sub: UILabel!
    
    @IBOutlet weak var navBar: NavigationBar!
    
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTutorial(count: count)
        navigationBarSetup(navBar: navBar, title: "Ajukan Pinjaman", hideBackButton: false)
    }
    
    func setupTutorial(count: Int) {
        if count == 1 {
            self.v12.backgroundColor = UIColor(named: "black05")
            self.v23.backgroundColor = UIColor(named: "black05")
            self.v34.backgroundColor = UIColor(named: "black05")

            self.v1.borderColor = UIColor(named: "orange02")
            self.v1.backgroundColor = UIColor(named: "orange01")
            self.lbl1.textColor = UIColor(named: "orange02")
            self.lbl1Sub.textColor = UIColor(named: "orange02")
            self.v2.borderColor = UIColor(named: "black05")
            self.v2.backgroundColor = UIColor.white
            self.lbl2.textColor = UIColor(named: "black05")
            self.lbl2Sub.textColor = UIColor(named: "black05")
            self.v3.borderColor = UIColor(named: "black05")
            self.v3.backgroundColor = UIColor.white
            self.lbl3.textColor = UIColor(named: "black05")
            self.lbl3Sub.textColor = UIColor(named: "black05")
            self.v4.borderColor = UIColor(named: "black05")
            self.v4.backgroundColor = UIColor.white
            self.lbl4.textColor = UIColor(named: "black05")
            self.lbl4Sub.textColor = UIColor(named: "black05")
        } else if count == 2 {
            self.v12.backgroundColor = UIColor(named: "orange02")
            self.v23.backgroundColor = UIColor(named: "black05")
            self.v34.backgroundColor = UIColor(named: "black05")
            
            self.v1.borderColor = UIColor(named: "orange02")
            self.v1.backgroundColor = UIColor(named: "orange01")
            self.lbl1.textColor = UIColor(named: "orange02")
            self.lbl1Sub.textColor = UIColor(named: "orange02")
            self.v2.borderColor = UIColor(named: "orange02")
            self.v2.backgroundColor = UIColor(named: "orange01")
            self.lbl2.textColor = UIColor(named: "orange02")
            self.lbl2Sub.textColor = UIColor(named: "orange02")
            self.v3.borderColor = UIColor(named: "black05")
            self.v3.backgroundColor = UIColor.white
            self.lbl3.textColor = UIColor(named: "black05")
            self.lbl3Sub.textColor = UIColor(named: "black05")
            self.v4.borderColor = UIColor(named: "black05")
            self.v4.backgroundColor = UIColor.white
            self.lbl4.textColor = UIColor(named: "black05")
            self.lbl4Sub.textColor = UIColor(named: "black05")
        } else if count == 3 {
            self.v23.backgroundColor = UIColor(named: "orange02")
            self.v34.backgroundColor = UIColor(named: "black05")
            
            self.v1.borderColor = UIColor(named: "orange02")
            self.v1.backgroundColor = UIColor(named: "orange01")
            self.lbl1.textColor = UIColor(named: "orange02")
            self.lbl1Sub.textColor = UIColor(named: "orange02")
            self.v2.borderColor = UIColor(named: "orange02")
            self.v2.backgroundColor = UIColor(named: "orange01")
            self.lbl2.textColor = UIColor(named: "orange02")
            self.lbl2Sub.textColor = UIColor(named: "orange02")
            self.v3.borderColor = UIColor(named: "orange02")
            self.v3.backgroundColor = UIColor(named: "orange01")
            self.lbl3.textColor = UIColor(named: "orange02")
            self.lbl3Sub.textColor = UIColor(named: "orange02")
            self.v4.borderColor = UIColor(named: "black05")
            self.v4.backgroundColor = UIColor.white
            self.lbl4.textColor = UIColor(named: "black05")
            self.lbl4Sub.textColor = UIColor(named: "black05")
        } else {
            self.v34.backgroundColor = UIColor(named: "orange02")
            self.v1.borderColor = UIColor(named: "orange02")
            self.v1.backgroundColor = UIColor(named: "orange01")
            self.lbl1.textColor = UIColor(named: "orange02")
            self.lbl1Sub.textColor = UIColor(named: "orange02")
            self.v2.borderColor = UIColor(named: "orange02")
            self.v2.backgroundColor = UIColor(named: "orange01")
            self.lbl2.textColor = UIColor(named: "orange02")
            self.lbl2Sub.textColor = UIColor(named: "orange02")
            self.v3.borderColor = UIColor(named: "orange02")
            self.v3.backgroundColor = UIColor(named: "orange01")
            self.lbl3.textColor = UIColor(named: "orange02")
            self.lbl3Sub.textColor = UIColor(named: "orange02")
            self.v4.borderColor = UIColor(named: "orange02")
            self.v4.backgroundColor = UIColor(named: "orange01")
            self.lbl4.textColor = UIColor(named: "orange02")
            self.lbl4Sub.textColor = UIColor(named: "orange02")
        }
    }
    
    let options = SheetOptions(
        pullBarHeight: 24,
        presentingViewCornerRadius: 15,
        shouldExtendBackground: true,
        setIntrinsicHeightOnNavigationControllers: true,
        useFullScreenMode: true,
        shrinkPresentingViewController: true,
        useInlineMode: false,
        horizontalPadding: 0,
        maxWidth: nil
    )
    
    @IBAction func nextButtonTap(_ sender: Any) {
        let vc = StoryboardScene.BottomSheet.DetailLoanViewController.instantiate()
        
        let completionHandler:(DetailLoanViewController) -> Void = { vc in
            let vc1 = StoryboardScene.Loan.LoanDataViewController.instantiate()
            self.navigationController?.pushViewController(vc1, animated: true)
        }
        vc.completionHandler = completionHandler
        let sheetHeight = 660
        var sheetSizes: [SheetSize]
        if sheetHeight < Int((UIScreen.main.bounds.height) / 2) {
            sheetSizes = [SheetSize.fixed(CGFloat(sheetHeight))]
        } else {
            sheetSizes = [SheetSize.fixed(CGFloat(sheetHeight)), SheetSize.fullscreen]
        }
        let sheetController = SheetViewController(controller: vc, sizes: sheetSizes)
        sheetController.cornerRadius = 15
        sheetController.contentBackgroundColor = UIColor.clear
        sheetController.gripColor = UIColor.white
        self.present(sheetController, animated: false, completion: nil)
    }
}
