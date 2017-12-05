//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Adhitya Surya Pratama on 8/26/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit
import WebKit

class WebViewController : UIViewController, WKUIDelegate{
    
    var webView : WKWebView!
    
    override func loadView() {
        webView = WKWebView()// initialize webView
        view = webView
        let myurl = URL(string: "https://www.google.com")
        let request = URLRequest(url: myurl!)
        webView.load(request)

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("webview")
    }
}
