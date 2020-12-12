//
//  NumberThreeView.swift
//  RollDiceApp
//
//  Created by tezz on 12/12/20.
//

import SwiftUI

struct NumberThreeView: View {
    var body: some View {
        VStack {
            HStack {
                Circle().frame(width: 20, height: 20, alignment: .center)
            }
            .frame(width: 76, alignment: .leading)
            HStack {
                Circle().frame(width: 20, height: 20, alignment: .center)
            }
            .frame(width: 76, alignment: .center)
            HStack {
                Spacer()
                Circle().frame(width: 20, height: 20, alignment: .center)
            }
            .frame(width: 76, alignment: .trailing)
        }    }
}

struct NumberThreeView_Previews: PreviewProvider {
    static var previews: some View {
        NumberThreeView()
    }
}
