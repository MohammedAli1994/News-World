//
//  SportArticalMapper.swift
//  News World
//
//  Created by Mohammad Husin aly on 08/06/2017.
//  Copyright © 2017 Mohammad Husin aly. All rights reserved.
//

import UIKit
import ObjectMapper

class SportArtical: Mappable {

    dynamic var title : String = ""
    dynamic var urlImage : String = ""
    dynamic var description : String = ""
    dynamic var url : String = ""
    
    
    
    required convenience init?(map: Map) {
        
        
        self.init()
        
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        urlImage <- map["urlToImage"]
        description <- map["description"]
        url <- map["url"]
        
        
    }

}
