//
//  ContentView.swift
//  RollDiceApp
//
//  Created by tezz on 12/12/20.
//

import SwiftUI
import GameplayKit

struct ContentView: View {
    let d6 = GKRandomDistribution.d6()
    
    var body: some View {
        Text(String(d6.nextInt()))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
