//
//  CustomPopUpViewController.swift
//  CustomPopUp
//
//  Created by SeongMinK on 2021/09/26.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
    }
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubscribeBtnClicked(_ sender: Any) {
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블록 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure {
            // 메인에 알림
            subscribeBtnCompletionClosure()
        }
    }
    
}
