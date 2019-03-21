//
//  WebViewController.swift
//  contatos
//
//  Created by PUCPR on 20/03/19.
//  Copyright © 2019 PUCPR. All rights reserved.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://stackoverflow.com")!
        webView.load(URLRequest(url: url))
        
         //dismiss(animated: false, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
         dismiss(animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        dismiss(animated: false, completion: nil)
        
        // dismiss(animated: false, completion: nil)
       
        
    }

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        dismiss(animated: false, completion: nil)
    }
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
