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
    @State var showSelectCurrency: Bool = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
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
                            Image(leftCurrency.Image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            // text - currency
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                        }
                        .padding(-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .onChange(of: leftCurrency) {
                            leftAmount = rightCurrency.Convert(rightAmount, to: leftCurrency)
                        }
                        
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = leftCurrency.Convert( leftAmount, to: rightCurrency)
                                }
                                
                            }
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
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundColor(.white)
                                
                            // coin image
                            Image(rightCurrency.Image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .onChange(of: rightCurrency) {
                            rightAmount = leftCurrency.Convert(leftAmount, to: rightCurrency)
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .onChange(of: rightAmount) {
                                if rightTyping {
                                    leftAmount = rightCurrency.Convert( rightAmount, to: leftCurrency)
                                }

                            
                        }
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
                            .sheet(isPresented: $showExchangeInfo) {
                                ExchangeInfo()
                            }
                    }
                }
            }
            .sheet(isPresented: $showSelectCurrency) {
                SelectCurrency(selectedTopCurrency: $leftCurrency, selectedBottomCurrency: $rightCurrency)
            }
        }
    }
}

#Preview {
    ContentView()
}
