//
//  RectangleViewModifier.swift
//  RollDiceApp
//
//  Created by tezz on 12/12/20.
//

import SwiftUI

struct RectangleViewModifier: ViewModifier {
    @State var horizontalTranslation: Bool
    @State var diceValue: Int
    
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 100)
            .foregroundColor(Color.green)
    }
}
