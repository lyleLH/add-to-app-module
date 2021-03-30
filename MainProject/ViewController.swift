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
    }

    @IBAction func pushToFlutterVc(_ sender: Any) {
        
        navigationController?.pushViewController(FlutterMessageHelper.shared.flutterViewController, animated: true)
        
        let dictionary = ["methodName": "onGetServiceNumber","arguments":"1111111"]
        
        if let jsonString = dictionary.jsonString() {
            FlutterMessageHelper.shared.sendMessageToFlutter(message: jsonString)
        }
        
    }
    
}

