//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Artem Samolyga on 2/5/23.
//

import UIKit
import WebKit
import SafariServices

class OneNewsViewController: UIViewController {

    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescriotion: UILabel!
    
    @IBAction func pushOpenAction(_ sender: Any) {
            let urlW0 = article.url
            let moveToWebView = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
            moveToWebView.urlW = urlW0
            moveToWebView.testData = article.title
            self.navigationController?.pushViewController(moveToWebView, animated: true)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = article.title
        labelDescriotion.text = article.description
        
        DispatchQueue.main.async {
            
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
            }
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
