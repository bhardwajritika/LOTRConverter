//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Tarun Sharma on 11/01/26.
//

import SwiftUI


struct ExchangeRate: View {
    
    let leftImage : ImageResource
    let text : String
    let rightImage : ImageResource
    
    var body: some View {
        HStack {
            // currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            // Currency rate text
            Text(text)
            // currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
