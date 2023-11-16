//
//  AttractionTableViewCell.swift
//  TableViewDemo
//
//  Created by lkh on 11/16/23.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {
    @IBOutlet var attractionLabel: UILabel!
    @IBOutlet var attractionImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
