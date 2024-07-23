//
//  Kisi.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import Foundation

class Kisiler : Identifiable {
    var kisiID : Int?
    var kisiAd : String?
    var kisiTel : String?
    
    init(kisiID: Int, kisiAd: String, kisiTel: String) {
        self.kisiID = kisiID
        self.kisiAd = kisiAd
        self.kisiTel = kisiTel
    }
    
    init() {}
}
