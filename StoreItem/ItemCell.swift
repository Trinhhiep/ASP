//
//  ItemCell.swift
//  StoreItem
//
//  Created by Admin on 16/04/2021.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    
    func updateUI(_ item : LOLItem)  {
        imgItem.image = UIImage(named: item.icon)
        lblPrice.text = String(item.price)
    }
    
    
    
}
