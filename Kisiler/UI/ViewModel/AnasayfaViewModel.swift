//
//  AnasayfaViewModel.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class AnasayfaViewModel : ObservableObject {
    @Published var kisilerListesi = [Kisiler]()
    
    func kisileriYukle() {
        var liste = [Kisiler]()
        let k1 = Kisiler(kisiID: 1, kisiAd: "Mustafa", kisiTel: "111")
        let k2 = Kisiler(kisiID: 2, kisiAd: "Esra", kisiTel: "222")
        let k3 = Kisiler(kisiID: 3, kisiAd: "Emin", kisiTel: "333")
        liste.append(k1)
        liste.append(k2)
        liste.append(k3)
        kisilerListesi = liste
    }
    
    func ara(kelime: String) {
        print("Kişi Ara: \(kelime)")
    }
    
    func sil(kisi_id: Int) {
        print("Kişi Sil: \(kisi_id)")
    }
}
