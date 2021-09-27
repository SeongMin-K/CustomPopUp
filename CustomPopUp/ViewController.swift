//
//  ViewController.swift
//  CustomPopUp
//
//  Created by SeongMinK on 2021/09/26.
//

import UIKit
import WebKit

let notificationName = "notificationBtnClicked"

class ViewController: UIViewController, PopUpDelegate {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    deinit {
        // 노티피케이션 수신기 해제
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 노티피케이션 수신기 장착
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }

    @objc fileprivate func loadWebView() {
        print("ViewController - loadWebView() called")
        let myGitHubrl = URL(string: "https://github.com/seongmin-k")
        self.myWebView.load(URLRequest(url: myGitHubrl!))
    }
    
    @IBAction func onCreatePopUpBtnClicked(_ sender: Any) {
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        
        // 스토리보드를 통해 뷰 컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "CustomPopUpVC") as! CustomPopUpViewController
        
        // 뷰 컨트롤러가 나타나는 스타일
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        
        // 뷰 컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve
        
        customPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블록이 호출됨")
            let myChannelUrl = URL(string: "https://www.youtube.com/channel/UCg_pGaOuYAHvncmq2piUWAQ")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        customPopUpVC.myPopUpDelegate = self
        self.present(customPopUpVC, animated: true, completion: nil)
    }
    
    // Mark - PopUpDelegate methods
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenchatBtnClicked() called")
        let myOpenChatUrl = URL(string: "https://open.kakao.com/o/sqP7S3Bd")
        self.myWebView.load(URLRequest(url: myOpenChatUrl!))
    }
}

