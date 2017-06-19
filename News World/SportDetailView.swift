//
//  SportDetailView.swift
//  News World
//
//  Created by Mohammad Husin aly on 08/06/2017.
//  Copyright © 2017 Mohammad Husin aly. All rights reserved.
//

import UIKit

class SportDetailView: UIViewController {

    var getDecription = String()
    var getImage = String()
    var getTitle = String()
    var geturl = String()
    
    @IBOutlet weak var imageShow: UIImageView!
    
    @IBOutlet weak var urlImage : UILabel!
    @IBOutlet weak var urlLink : UILabel!
    
    @IBOutlet weak var hiddenView: UIView!
    
    @IBOutlet weak var webView: UIWebView!
    
    
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = getDecription
        titleLabel.text = getTitle
        // let urlLink = NSURL(string: geturl)!
        
        let url = NSURL(string: getImage)!
        imageShow.af_setImage(withURL: url as URL)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loadWebView(_ sender: Any) {
        
        
        hiddenView.alpha = 1
        
        webView.alpha = 1
        
        let  url = URL(string: geturl)!
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

}
