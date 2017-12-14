//
//  RidesTableViewCell.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 12/14/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit

class RidesTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var pLabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
