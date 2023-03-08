//
//  devCell.swift
//  Newvision
//
//  Created by chenruibao on 2022/10/12.
//

import UIKit

class devCell: UITableViewCell {

    
    @IBOutlet weak var devNameLa: UILabel!
    
    @IBOutlet weak var devIDLa: UILabel!
    
    @IBOutlet weak var devImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
