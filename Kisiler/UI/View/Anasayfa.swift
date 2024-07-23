//
//  ContentView.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct Anasayfa: View {
    
    @State private var aramaKelimesi : String = ""
    
    // ViewModel Object
    @ObservedObject var viewModel = AnasayfaViewModel()
    
    // Delete Function
    func sil(at offsets: IndexSet) {
        let kisi = viewModel.kisilerListesi[offsets.first!]
        viewModel.kisilerListesi.remove(at: offsets.first!)
        viewModel.sil(kisi_id: kisi.kisiID!)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.kisilerListesi) { kisi in
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
                viewModel.kisileriYukle()
                print("Anasayfaya Dönüş Yapıldı")
            }
        }
        .searchable(text: $aramaKelimesi, prompt: "Ara")
        .onChange(of: aramaKelimesi) { oldValue, newValue in
            viewModel.ara(kelime: newValue)
        }
    }
}

#Preview {
    Anasayfa()
}
