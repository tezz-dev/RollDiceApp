//
//  NumberFiveView.swift
//  RollDiceApp
//
//  Created by tezz on 12/12/20.
//

import SwiftUI

struct NumberFiveView: View {
    var body: some View {
        VStack {
            HStack {
                Circle().frame(width: 20, height: 20, alignment: .center)
                Spacer()
                Circle().frame(width: 20, height: 20, alignment: .center)
            }
            .frame(width: 76, alignment: .leading)
            HStack {
                Circle().frame(width: 20, height: 20, alignment: .center)
            }
            .frame(width: 76, alignment: .center)
            HStack {
                Circle().frame(width: 20, height: 20, alignment: .center)
                Spacer()
                Circle().frame(width: 20, height: 20, alignment: .center)
            }
            .frame(width: 76, alignment: .trailing)
        }
    }
}

struct NumberFiveView_Previews: PreviewProvider {
    static var previews: some View {
        NumberFiveView()
    }
}
