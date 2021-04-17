//
//  InitData.swift
//  LoLStore
//
//  Created by Admin on 13/04/2021.
//

import Foundation
class Data {
    var listTypeItem : [ItemType]=[]
    var listItem : [LOLItem]=[]

    init() {
        let str:[String] = ["Trang bị khởi đầu","Sát thương vật lý","Sát thương phép thuật","Trang bị chống chịu","Chí mạng","Tốc độ đánh"]
        for i in  0..<str.count {
            
            let type = ItemType(typeId: i , typeName: str[i])
            self.listTypeItem.append(type)
        }
        
        // ao choang lua
        var hongNgoc = LOLItem(id: 0,name: "Hồng ngọc",icon: "hong-ngoc",subItem: [],price: 400,content: "Chức năng ...",type: [self.listTypeItem[3]])
        
        var tanTichBami = LOLItem(id: 1,name: "Tàn tích của bami",icon: "tan-tich-cua-bami",subItem: [hongNgoc],price: 900,content: "",type: [self.listTypeItem[3]])
        var giapLua = LOLItem(id: 2,name: "Giáp lụa", icon: "giap-lua",subItem: [],price: 300,content: "",type: [self.listTypeItem[3]])
        var giapLuoi = LOLItem(id: 3,name: "Giáp lưới",icon: "giap-luoi",subItem: [giapLua],price: 800,content: "",type: [self.listTypeItem[3]])
        var aoChoangLua = LOLItem(id: 4,name: "Áo Choàng Lửa",icon: "ao-choang-lua",subItem: [tanTichBami,giapLuoi,hongNgoc],price: 2900,content: "",type: [self.listTypeItem[3]])
        
        // mu phu thuy
        
        var gayQuaKho = LOLItem(id: 5 , name: "Gậy quá khổ",icon: "gay-qua-kho",subItem: [],price: 1250,content: "",type: [self.listTypeItem[2]])
        var muPhuThuy = LOLItem(id: 6,name: "Mũ phù thuỷ",icon: "mu-phu-thuy-rabadon",subItem: [gayQuaKho,gayQuaKho],price: 3600,content: "",type: [self.listTypeItem[2]])
        var gayBungNo = LOLItem(id: 7,name: "Gậy bùng nổ",icon: "gay-bung-no",subItem: [],price: 850,content: "",type: [self.listTypeItem[2]])
        var sachCu = LOLItem(id: 8,name: "Sách cũ",icon: "sach-cu",subItem: [],price: 435,content: "",type: [self.listTypeItem[2]])
        var truongHuVo = LOLItem(id: 9,name: "Trượng hư vô",icon: "truong-hu-vo",subItem: [gayBungNo,sachCu],price: 2650,content: "",type: [self.listTypeItem[2]])
        
      
        
        //vo cuc kiem
        var aoChoangTim = LOLItem(id: 10,name: "Áo choàng tím",icon: "ao-choang-tim",subItem: [],price: 800,content: "",type: [self.listTypeItem[1]])
        var cuocChim = LOLItem(id: 11,name: "Cuốc chim",icon: "cuoc-chim",subItem: [],price: 875,content: "",type: [self.listTypeItem[1]])
        var kiemBF = LOLItem(id: 16,name: "Kiếm BF",icon: "kiem-bf",subItem: [],price: 1300,content: "",type: [self.listTypeItem[1]])
        var voCucKiem = LOLItem(id: 12,name: "Vô cực kiếm",icon: "vo-cuc-kiem",subItem: [cuocChim,aoChoangTim,kiemBF],price: 3400,content: "",type: [self.listTypeItem[1],self.listTypeItem[4]])
        
        // dai bác lien thanh
        
        var daoGam = LOLItem(id: 13,name: "Dao găm",icon: "dao-gam",subItem: [],price: 300,content: "",type: [self.listTypeItem[5]])
        var songKiem = LOLItem(id: 14,name: "Song Kiếm",icon: "song-kiem",subItem: [daoGam,aoChoangTim],price: 1200,content: "",type: [self.listTypeItem[4],self.listTypeItem[5]])
        
        var daiBacLienThanh = LOLItem(id: 15,name: "Đại bác liên thanh",icon: "dai-bac-lien-thanh",subItem: [songKiem,daoGam],price: 2600,content: "",type: [self.listTypeItem[4],self.listTypeItem[5]])
        
        // Trang bị khởi đầu
        
        var kiemDoran = LOLItem(id: 100,name: "Kiếm Doran", icon: "kiem-doran",subItem: [],price: 450,content: "",type: [self.listTypeItem[0]])
        
        
        var khienDoran = LOLItem(id: 101,name: "Khiên Doran", icon: "khien-doran",subItem: [],price: 450,content: "",type: [self.listTypeItem[0]])
        
        var nhanDoran = LOLItem(id: 102,name: "Nhẫn Doran", icon: "nhan-doran",subItem: [],price: 400,content: "",type: [self.listTypeItem[0],self.listTypeItem[2]])
        
        self.listItem.append(kiemDoran)
        self.listItem.append(khienDoran)
        self.listItem.append(nhanDoran)
        
        self.listItem.append(hongNgoc)
        self.listItem.append(tanTichBami)
        self.listItem.append(giapLua)
        self.listItem.append(giapLuoi)
        self.listItem.append(aoChoangLua)
        
        self.listItem.append(gayQuaKho)
        self.listItem.append(muPhuThuy)
        self.listItem.append(gayBungNo)
        self.listItem.append(sachCu)
        self.listItem.append(truongHuVo)
        
        self.listItem.append(daoGam)
        self.listItem.append(aoChoangTim)
        self.listItem.append(kiemBF)
        self.listItem.append(songKiem)
        self.listItem.append(daiBacLienThanh)
        self.listItem.append(cuocChim)
        self.listItem.append(voCucKiem)
       
        for i in  0..<listItem.count{
            listItem[i].content = String("Chức năng của \(listItem[i].name) :...")
        }
        
    }

}
