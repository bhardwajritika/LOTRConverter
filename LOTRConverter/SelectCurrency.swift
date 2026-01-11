//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Tarun Sharma on 11/01/26.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            // Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea(.all)
                .background(Color.brown)
            VStack {
                
                // text
                Text("Select the currency you are starting with: ")
                    .fontWeight(.bold)
                
                // Icon images
                CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
                
                // text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                
                // Icon images
                
                // Done button
                Button ("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2 ))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .padding()
            .multilineTextAlignment(.center)
            
        }
    }
}

#Preview {
    SelectCurrency()
}
