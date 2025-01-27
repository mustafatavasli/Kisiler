//
//  KisiDetay.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct KisiDetay: View {
    
    // TextField States
    @State private var tfKisiAd : String = ""
    @State private var tfKisiTel : String = ""
    
    // We need Kisi object for KisiDetay
    var kisi = Kisiler()
    
    // ViewModel Object
    var viewModel = KisiDetayViewModel()
    
    var body: some View {
            VStack(spacing: 100) {
                TextField("Kişi Ad", text: $tfKisiAd)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                TextField("Kişi Tel", text: $tfKisiTel)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Güncelle") {
                    viewModel.guncelle(kisi_id: kisi.kisiID!, kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
                }
            }
            .navigationTitle("Kişi Detay")
            .onAppear(perform: {
                tfKisiAd = kisi.kisiAd!
                tfKisiTel = kisi.kisiTel!
            })
    }
}

#Preview {
    KisiDetay()
}
