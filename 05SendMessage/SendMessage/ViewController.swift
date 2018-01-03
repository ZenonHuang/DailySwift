//
//  ViewController.swift
//  SendMessage
//
//  Created by mewe on 2018/1/3.
//  Copyright © 2018年 zenon. All rights reserved.
//

import UIKit
import UIKit
import MessageUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func tapSendButton(_ sender: Any) {
        
        if MFMessageComposeViewController.canSendText() {
            let  msgVC = MFMessageComposeViewController.init()
            msgVC.recipients = ["15772389728"]
            msgVC.navigationBar.tintColor = UIColor.red
            msgVC.body       = "Hi~ Pig!"
            msgVC.messageComposeDelegate = self
            present(msgVC, animated: true, completion: nil)
        } else {
            
            let alert = UIAlertController.init(title: "提示", message: "该设备不支持该功能", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "确定", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : MFMessageComposeViewControllerDelegate {
    //protocol func
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
        
        switch result {
        case .sent:
            print("sent")
        case .failed:
            print("failed")
        case .cancelled:
            print("cancel")
            
        }
    }
    
}




