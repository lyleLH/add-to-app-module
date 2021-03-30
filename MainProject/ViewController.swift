//
//  ViewController.swift
//  MainProject
//
//  Created by Tom.Liu on 2021/3/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerFlutter()
    }

    // 注册与flutter通信的代理
    private func registerFlutter() {
        FlutterMessageHelper.shared.delegate = self

        
    }
    
    private func handleReceivedMessage(medhod: String, arguments: Any) {
        // flutter传过来的方法
        print("flutter传过来的方法method:\(String(describing: method)), 参数arguments:\(arguments)")
        FlutterMessageHelper.shared.flutterViewController.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pushToFlutterVc(_ sender: Any) {
        
        navigationController?.pushViewController(FlutterMessageHelper.shared.flutterViewController, animated: true)
        
        let dictionary = ["methodName": "onGetServiceNumber","arguments":"1111111"]
        
        if let jsonString = dictionary.jsonString() {
            FlutterMessageHelper.shared.sendMessageToFlutter(message: jsonString)
        }
        
    }
    
}

// MARK: - SwiftFlutterBridgeDelegate
extension ViewController : SwiftFlutterBridgeDelegate {
    func methodChannelCall(method: String, arguments: Any, result: (Any?) -> Void) {
        
        self.handleReceivedMessage(medhod: method, arguments: arguments)
        
        switch method {
        /// 打开相册
        case FlutterBridgeConst.OPEN_GALLERY:

            break
            
        /// 拍照
        case FlutterBridgeConst.TAKE_PHOTO:

            break
            
        /// 导航
        case FlutterBridgeConst.TO_NAVIGATION:

            break
            
        case FlutterBridgeConst.REMOVE_DATA:
            
            break
            
        default:
            break
        }
    }
}
