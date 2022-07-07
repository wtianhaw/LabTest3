//
//  CommonWebViewController.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import UIKit
import WebKit

class CommonWebViewController: BaseViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let url = "https://www.weatherapi.com/docs/"
        if let url = URL(string: url) {
            self.webView.load(URLRequest(url: url))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
