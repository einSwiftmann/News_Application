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
        //print("----------1\(urlW)")
        //print("----------2\(urlW)")
        if urlW != nil {
            webView.load(URLRequest(url: URL(string: urlW!)!))
        }
        else {
            return
        }
       
        //labelTitle.text = article.title
        
        /*if let urlW = URL(string: self.article.url) {
          
               self.webView.load(URLRequest(url: urlW))
           
       }
         */
       
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
