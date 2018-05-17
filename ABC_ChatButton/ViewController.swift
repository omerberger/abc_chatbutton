//
//  ViewController.swift
//  ABC_ChatButton
//
//  Created by Omer Berger on 5/17/18.
//  Copyright © 2018 Omer Berger. All rights reserved.
//

import UIKit

/** ABC Chat Button & Action implementation:
 1. Add BusinessChat framework
 2. Get your account business id
 3. Create button with a target action
 */
import BusinessChat

let bid = "<ADD_YOUT_BUSINESS_ID_HERE>"

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Making sure we running @min. OS requirements:
        if #available(iOS 11.3, *) {
            createABCButton(style:.light, frame: CGRect.zero)
        }else{
            //Fallback condition here
        }
    }
    
    private func createABCButton(style: BCChatButton.Style, frame: CGRect) {
        let abcButton   =  BCChatButton(style: style)
        abcButton.addTarget(self, action: #selector(buttonTapped(chatButton:)), for: UIControlEvents.touchUpInside)
        abcButton.frame = frame
        view.addSubview(abcButton)
    }
    
    @objc func buttonTapped(chatButton: BCChatButton) {
        let parameters: [BCChatAction.Parameter : String] = [
            .intent: "<DESIRED_INTENT_HERE>",
            .group: "<DESIRED_GROUP_HERE>",
            .body: "<DESIRED_BODY_HERE>"
        ]
        
        BCChatAction.openTranscript(businessIdentifier: bid, intentParameters: parameters)
    }
    
}

