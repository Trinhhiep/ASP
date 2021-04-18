//
//  DetailViewController.swift
//  StoreItem
//
//  Created by Admin on 17/04/2021.
//

import UIKit

class DetailViewController: UIViewController {
    var item : LOLItem?
    var subItems :[LOLItem]?
//    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    
    @IBOutlet weak var lblContent: UITextView!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        self.myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        subItems = item?.subItem
        imgItem.image = UIImage(named: item!.icon)
        lblName.text = item!.name
        lblPrice.text = String(item!.price)
        lblContent.text = item?.content 
    }
    

   
}
extension DetailViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subItems!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "DETAILCELL") as! DetailCell
        cell.updateUI(subItems![indexPath.row])
        
        return cell
    }
    
    
}
extension DetailViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailScreen = sb.instantiateViewController(withIdentifier: "DETAIL") as! DetailViewController
      
        detailScreen.item = subItems![indexPath.row]
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
    
}
