//
//  KisiKayit.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct KisiKayit: View {
    
    // TextField States
    @State private var tfKisiAd : String = ""
    @State private var tfKisiTel : String = ""
    
    // Save Function
    func kaydet(kisi_ad: String, kisi_tel: String) {
        print("Kişi Kaydedildi: \(kisi_ad) - \(kisi_tel)")
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 100) {
                TextField("Kişi Ad", text: $tfKisiAd)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                TextField("Kişi Tel", text: $tfKisiTel)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Kaydet") {
                    kaydet(kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
                }
            }
            .navigationTitle("Kişi Kayıt")
        }
    }
}

#Preview {
    KisiKayit()
}
