//
//  WorldnewsVC.swift
//  News World
//
//  Created by Mohammad Husin aly on 08/06/2017.
//  Copyright © 2017 Mohammad Husin aly. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireImage
import ImageSlideshow

class WorldnewsVC: UITableViewController {

    @IBOutlet weak var ImageSlider: ImageSlideshow!
    
    var Articles : Array<SportArtical> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = UIColor.red
        
        
        SlideShow ()
        
        let logo = UIBarButtonItem(image: UIImage (named: "Group 6"), style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
        self.navigationItem.leftBarButtonItem = logo
        
        
        let params : Parameters = [
            "source": "independent",
            "apiKey": "ed33cd88805d44a98664943476772c1f",
            "sortBy": "top"
            
        ]
        
        Alamofire.request("https://newsapi.org/v1/articles?", parameters: params, encoding: URLEncoding.default)
            .responseJSON { response in
                
                if let jsonRoot = response.result.value as? [String:Any]!{
                    
                    if let articleArray = jsonRoot["articles"] as? [[String: Any]]!{
                        
                        for articleData in articleArray{
                            
                            guard  let article = Mapper<SportArtical>().map(JSON: articleData) else {
                                continue
                            }
                            
                            print(self.Articles.append(article))
                        }
                        
                    }
                    
                    
                    
                }
                self.tableView.reloadData()
                
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return Articles.count
        
        
    }
    
    
    func SlideShow () {
        
        
        ImageSlider.backgroundColor = UIColor.white
        ImageSlider.slideshowInterval = 5.0
        ImageSlider.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SportNewsCell
        let articles = Articles[indexPath.row]
        
        
        
        
        
        cell.titleLabel.text = articles.title
        
        
        let url = NSURL(string: self.Articles[indexPath.row].urlImage)
        
        cell.pictureImage.af_setImage(withURL: url! as URL, placeholderImage: nil, filter:nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: true, completion: nil)
        
        
        
        
        let alamofireSource = [AlamofireSource(urlString: Articles[indexPath.row].urlImage )!,AlamofireSource(urlString: Articles[indexPath.section.distance(to: 1)].urlImage)!,AlamofireSource(urlString: Articles[indexPath.section.distance(to: 3)].urlImage)!,AlamofireSource(urlString: Articles[indexPath.section.distance(to: 4)].urlImage)!,AlamofireSource(urlString: Articles[indexPath.section.distance(to: 5)].urlImage)!,AlamofireSource(urlString: Articles[indexPath.section.distance(to: 6)].urlImage)!]
        
        
        ImageSlider.setImageInputs(alamofireSource)
        
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selected")
        
        let articles = Articles[indexPath.row]
        
        
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let passData = MainStoryboard.instantiateViewController(withIdentifier: "WorldDetailView") as! WorldDetailView
        
        passData.getDecription = articles.description
        passData.getImage = articles.urlImage
        passData.getTitle = articles.title
        passData.geturl = articles.url
        
        
        self.navigationController?.pushViewController(passData, animated: true)
        
    }

}
