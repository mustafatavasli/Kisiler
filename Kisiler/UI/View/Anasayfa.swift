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
                veritabaniKopyala()
                viewModel.kisileriYukle()
                print("Anasayfaya Dönüş Yapıldı")
            }
        }
        .searchable(text: $aramaKelimesi, prompt: "Ara")
        .onChange(of: aramaKelimesi) { oldValue, newValue in
            viewModel.ara(kelime: newValue)
        }
    }
    
    func veritabaniKopyala() {
        // Veritabanı Dosyasına Erişim
        let bundle = Bundle.main.path(forResource: "kisiler", ofType: ".sqlite")
        // Veritabanlarının Kaydedileceği Genel Dosya Yolu
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("kisiler.sqlite")
        
        // Dosyalama İşlemleri
        let fm = FileManager.default
        if fm.fileExists(atPath: hedefYol.path) {
            print("Veritabanı Daha Önce Kopyalandı")
        } else {
            // Daha önce böyle bir veritabanı yok, o yüzden kopyalama yapacağız.
            do {
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    Anasayfa()
}
