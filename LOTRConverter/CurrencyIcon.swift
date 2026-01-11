//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Tarun Sharma on 11/01/26.
//

import SwiftUI

struct CurrencyIcon: View {
    
    let currencyImage: ImageResource
    let currencyName: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
            
            // currency name
            Text(currencyName)
                .font(.caption)
                .padding(3)
                .frame(width: .infinity)
                .background(Color.brown.opacity(0.75))
        }
        .frame(width: 100, height: 100)
        .background(Color.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
}
