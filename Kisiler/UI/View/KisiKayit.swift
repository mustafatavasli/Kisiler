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
    
    // ViewModel Object
    var viewModel = KisiKayitViewModel()
    
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
                    viewModel.kaydet(kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
                }
            }
            .navigationTitle("Kişi Kayıt")
        }
    }
}

#Preview {
    KisiKayit()
}
