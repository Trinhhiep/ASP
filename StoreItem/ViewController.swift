//
//  ViewController.swift
//  StoreItem
//
//  Created by Admin on 16/04/2021.
//

import UIKit

class ViewController: UIViewController {
    var Items : [LOLItem]?
    var ItemTypes: [ItemType]?
    var DictionaryItem : [Int:[LOLItem]]?
    var CurrentDictionaryItem : [Int:[LOLItem]]?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        myCollection.dataSource = self
        let data = Data()
        Items = data.listItem
        ItemTypes = data.listTypeItem
        DictionaryItem = arrToDic(Items!, ItemTypes!)
        
        sortArrInDic( &DictionaryItem!)
        CurrentDictionaryItem = DictionaryItem
    }
    
    func arrToDic(_ items:[LOLItem],_ types:[ItemType])->   [Int: [LOLItem]]{
        var dic : [Int: [LOLItem]] = [:]
        for i in 0..<types.count{
            var arr:[LOLItem]=[]
            for item in items{
                for type in item.type{
                    if type.typeId == i{
                        arr.append(item)
                    }
                }
            }
            dic[i] = arr
        }
        return dic
    }
    
    func sortArrInDic(_ dic: inout [Int:[LOLItem]])  {
        
        for (k,v) in dic{
          dic[k] =  v.sorted(by: {$0.price < $1.price})
        }
        
    }
    
    
}

extension ViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ItemTypes!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let arr = CurrentDictionaryItem![section]
        return arr!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollection.dequeueReusableCell(withReuseIdentifier: "ITEMCELL", for: indexPath) as! ItemCell
        let arr = CurrentDictionaryItem![indexPath.section]
        cell.imgItem.image = UIImage(named: arr![indexPath.item].icon)
        cell.lblPrice.text = String(arr![indexPath.item].price)
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = myCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HEADERCELL", for: indexPath) as! headerCell
            
            headerView.lblHeader.text =  ItemTypes![indexPath.section].typeName 
            
            
            return headerView
            
            
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
  
}

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard  !searchText.isEmpty else {
            
           CurrentDictionaryItem = DictionaryItem
            myCollection.reloadData()
            return
        }
        let text = searchText.folding(options: .diacriticInsensitive, locale: .current).lowercased()
        
        let arr = Items?.filter({$0.name.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(text)})
       
        CurrentDictionaryItem = arrToDic(arr!, ItemTypes!)
        sortArrInDic( &CurrentDictionaryItem!)
        
        myCollection.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
   
    
}
//
//extension String {
//    var forSorting: String {
//        let simple = folding(options: [.diacriticInsensitive, .widthInsensitive, .caseInsensitive], locale: nil)
//        let nonAlphaNumeric = CharacterSet.alphanumerics.inverted
//        return simple.components(separatedBy: nonAlphaNumeric).joined(separator: "")
//    }
//}
//extension ViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        print("Size for item at ")
//        return CGSize(width: 100, height: 100)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 50
//    }
//
//}
