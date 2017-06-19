//
//  SportNewsCell.swift
//  News World
//
//  Created by Mohammad Husin aly on 08/06/2017.
//  Copyright © 2017 Mohammad Husin aly. All rights reserved.
//

import UIKit

class SportNewsCell: UITableViewCell {

    
    @IBOutlet weak dynamic var titleLabel: UILabel!
    
    @IBOutlet weak var pictureImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
