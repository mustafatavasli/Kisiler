//
//  KisilerSatir.swift
//  Kisiler
//
//  Created by Mustafa TAVASLI on 23.07.2024.
//

import SwiftUI

struct KisilerSatir: View {
    
    var kisi = Kisiler()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(kisi.kisiAd!)
                .font(.system(size: 25))
            Text(kisi.kisiTel!)
                .font(.system(size: 20))
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    KisilerSatir()
}
