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
       
        callRocketAPI()
        searchBar.delegate = self
        myCollection.dataSource = self
        myCollection.delegate = self
        
        let data = Data()
        Items = data.listItem
        ItemTypes = data.listTypeItem
        DictionaryItem = arrToDic(Items!, ItemTypes!)
        
        sortArrInDic( &DictionaryItem!)
        CurrentDictionaryItem = DictionaryItem
        
    }
    //============================
    func callRocketAPI() {
        
        let url = "https://api.spacexdata.com/v4/rockets"
        guard let URL = URL(string: url) else {
          return
        }
        let task = URLSession.shared.dataTask(with: URL) { [self]
            ( data, response, error) in
            guard let data = data else { return }
                     var   jsonString = String(data: data, encoding: .utf8)!
            print(jsonString)
            
        }
        
        task.resume()
       
           
    }
//    func parseToObj(_ jsonString : String)  {
//
//        guard let dataFromJson = jsonString.data(using: .utf8) else{
//
//return
//}
//        do {
//            let rocket = try JSONDecoder().decode(Rocket.self, from: dataFromJson)
//            print("=====================================")
//            print( rocket)
//        } catch  {
//            print("false")
//        }
//
//
//
//    }
    
    //============================
    
    
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
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailScreen = sb.instantiateViewController(withIdentifier: "DETAIL") as! DetailViewController
        let arr = CurrentDictionaryItem![indexPath.section]
        
        detailScreen.item = arr![indexPath.item]
        self.navigationController?.pushViewController(detailScreen, animated: true)
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

        cell.updateUI( arr![indexPath.item])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = myCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HEADERCELL", for: indexPath) as! headerCell
            
            headerView.updateUI(ItemTypes![indexPath.section].typeName)
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
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
    // khoang cách từ viền tới phan noi dung section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // khoảng cách giua 2 dòng trong 1 section
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return CGFloat(1000)
    //    }
    
    //    khoang cách giua cac item
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //        return CGFloat(100)
    //    }
    //size for header
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //        return CGSize(width: 100, height: 100)
    //    }
    
}
