//
//  WebViewController.swift
//  NewsApp
//
//  Created by Artem Samolyga on 2/5/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var article: Article!
    var urlW: String?
    var testData: String?
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if urlW != nil {
            webView.load(URLRequest(url: URL(string: urlW!)!))
        }
        else {
            return
        }
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
