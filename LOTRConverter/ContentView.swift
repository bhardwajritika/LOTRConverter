//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Tarun Sharma on 10/01/26.
//

import SwiftUI

struct ContentView: View {
    // @State - is a property wrapper. It is a stored property.
    @State var showExchangeInfo: Bool = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    // body - computed property
    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // horse image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // text - "Currency exchnge"
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                
                // Conversion section
                HStack {
                    
                    // left conversion block
                    VStack {
                        HStack {
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            // text - currency
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                        }
                        .padding(-5)
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // equal to
                    Image(systemName: "equal")
                        .foregroundColor(.white)
                        .font(.title)
                        .symbolEffect(.pulse)
                    
                    // right conversion block
                    VStack {
                        HStack {
                           
                            // text - currency
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundColor(.white)
                                
                            // coin image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(-5)
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .clipShape(Capsule())
                
                Spacer()
                // info button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()

                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width: 33, height: 33)
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
