//
//  DetailCell.swift
//  StoreItem
//
//  Created by Admin on 17/04/2021.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var imgSubItem: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    func updateUI(_ item : LOLItem)  {
        imgSubItem.image = UIImage(named: item.icon)
        lblPrice.text = String(item.price)
    }

}
