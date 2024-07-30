//
//  AnasayfaViewModel.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class AnasayfaViewModel : ObservableObject {
    @Published var kisilerListesi = [Kisiler]()
    
    let db : FMDatabase?
    
    init() {
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kisiler.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }
    
    func kisileriYukle() {
        db?.open()
        
        var liste = [Kisiler]()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while result.next() {
                let kisi_id = Int(result.string(forColumn: "kisi_id"))!
                let kisi_ad = result.string(forColumn: "kisi_ad")!
                let kisi_tel = result.string(forColumn: "kisi_tel")!
                
                let kisi = Kisiler(kisiID: kisi_id, kisiAd: kisi_ad, kisiTel: kisi_tel)
                liste.append(kisi)
            }
            
            kisilerListesi = liste
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func ara(kelime: String) {
        db?.open()
        
        do {
            try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad LIKE ?", values: ["%\(kelime)%"])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func sil(kisi_id: Int) {
        db?.open()
        
        do {
            try db?.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id])
            kisileriYukle()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
