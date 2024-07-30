//
//  KisiKayitViewModel.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class KisiKayitViewModel {
    
    let db : FMDatabase?
    
    init() {
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kisiler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    // Save Function
    func kaydet(kisi_ad: String, kisi_tel: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad, kisi_tel) VALUES (?, ?) ", values: [kisi_ad, kisi_tel])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
