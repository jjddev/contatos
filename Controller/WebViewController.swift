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
    var site: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if site != nil {
            let url = URL(string: site!)!
            webView.load(URLRequest(url: url))
            
            let alert = UIAlertController(title: nil, message: "Carregando...", preferredStyle: .alert)
        
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.gray
            loadingIndicator.startAnimating();
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
        } else {
            title = "Sem site"
        }
    }


    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = "Site"
        dismiss(animated: true, completion: nil)
    }


    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
    
    if error.code == -1001 { // TIMED OUT:
    
    // CODE to handle TIMEOUT
    
    } else if error.code == -1003 { // SERVER CANNOT BE FOUND
    
    // CODE to handle SERVER not found
    
    } else if error.code == -1100 { // URL NOT FOUND ON SERVER
    
    // CODE to handle URL not found
    
    }
        print("erro")
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
