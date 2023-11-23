//
//  SeeTableViewCell.swift
//  DatabaseDemo
//
//  Created by lkh on 11/23/23.
//

import UIKit

class SeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var exp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btnAction(_ sender: Any) {
    }
    
}
