//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Tarun Sharma on 14/01/26.
//

import SwiftUI

struct IconGrid: View {
    @State var selectedCurrency : Currency
    var body: some View {
        
        LazyVGrid (columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if selectedCurrency == currency {
                    CurrencyIcon(currencyImage: currency.Image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(lineWidth: 3)
                            .opacity(0.5))
                    
                }
                else {
                    CurrencyIcon(currencyImage: currency.Image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(selectedCurrency: .silverPenny)
}
