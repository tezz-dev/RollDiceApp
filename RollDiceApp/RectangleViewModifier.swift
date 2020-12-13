//
//  RectangleViewModifier.swift
//  RollDiceApp
//
//  Created by tezz on 12/12/20.
//

import SwiftUI

struct RectangleViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .foregroundColor(Color.green)
            .border(Color.black, width: 4)
    }
}
