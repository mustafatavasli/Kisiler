//
//  ContentView.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct Anasayfa: View {
    
    @State private var kisilerListesi = [Kisiler]()
    @State private var aramaKelimesi : String = ""
    
    // Delete Function
    func sil(at offsets: IndexSet) {
        let kisi = kisilerListesi[offsets.first!]
        kisilerListesi.remove(at: offsets.first!)
        print("Kişi Sil: \(kisi.kisiID!)")
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(kisilerListesi) { kisi in
                    NavigationLink(destination: KisiDetay(kisi: kisi)) {
                        KisilerSatir(kisi: kisi)
                    }
                }
                .onDelete(perform: sil)
            }
            .navigationTitle("Kişiler")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: KisiKayit()) {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear {
                var liste = [Kisiler]()
                let k1 = Kisiler(kisiID: 1, kisiAd: "Mustafa", kisiTel: "111")
                let k2 = Kisiler(kisiID: 2, kisiAd: "Esra", kisiTel: "222")
                let k3 = Kisiler(kisiID: 3, kisiAd: "Emin", kisiTel: "333")
                liste.append(k1)
                liste.append(k2)
                liste.append(k3)
                kisilerListesi = liste
                print("Anasayfaya Dönüş Yapıldı")
            }
        }
        .searchable(text: $aramaKelimesi, prompt: "Ara")
        .onChange(of: aramaKelimesi) { oldValue, newValue in
            print("Kişi Ara: \(newValue)")
        }
    }
}

#Preview {
    Anasayfa()
}
