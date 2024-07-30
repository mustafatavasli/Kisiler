//
//  KisiDetayViewModel.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class KisiDetayViewModel {
    
    let db : FMDatabase?
    
    init() {
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kisiler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    // Save Function
    func guncelle(kisi_id: Int,kisi_ad: String, kisi_tel: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?, kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad, kisi_tel, kisi_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
