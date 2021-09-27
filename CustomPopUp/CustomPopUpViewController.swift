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
    @IBOutlet weak var githubBtn: UIButton!
    @IBOutlet weak var openChatBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    
    var subscribeBtnCompletionClosure: (() -> Void)?
    var myPopUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")
        contentView.layer.cornerRadius = 30
        githubBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        subscribeBtn.layer.cornerRadius = 10
    }
    
    @IBAction func onBgBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onBgBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        self.dismiss(animated: true, completion: nil)
        
        // 컴플레션 블록 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure {
            // 메인에 알림
            subscribeBtnCompletionClosure()
        }
    }
    
    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        myPopUpDelegate?.onOpenChatBtnClicked()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onGitHubBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onGitHubBtnClicked() called")
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
