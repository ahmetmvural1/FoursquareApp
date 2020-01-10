//
//  VenuesCell.swift
//  FoursquareApp
//
//  Created by Ahmet Muhammet Vural on 28.12.2019.
//  Copyright © 2019 Ahmet Muhammet Vural. All rights reserved.
//

import UIKit

class VenuesCell: UITableViewCell {

    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var AddressLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
