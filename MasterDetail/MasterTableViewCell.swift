//
//  MasterTableViewCell.swift
//  MasterDetail
//
//  Created by Anhdzai on 1/10/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
 
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImg: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
