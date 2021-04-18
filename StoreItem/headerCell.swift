//
//  headerCell.swift
//  StoreItem
//
//  Created by Admin on 16/04/2021.
//

import UIKit

class headerCell: UICollectionReusableView {
        
    @IBOutlet weak var lblHeader: UILabel!
    
    func updateUI(_ title: String)  {
        lblHeader.text = title
    }
}
