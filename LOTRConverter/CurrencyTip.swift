//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Tarun Sharma on 15/01/26.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    
    var title: Text = Text("Change Currency")
    var message: Text? = Text("You can tap the left or right currency to bring up the select currency screen")
    var image: Image? = Image(systemName: "hand.tap.fill")
}
