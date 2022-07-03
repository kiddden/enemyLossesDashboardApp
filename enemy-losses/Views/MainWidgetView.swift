//
//  MainWidgetView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct MainWidgetView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Personell")
                Text("~10000")
                Divider()
                    .frame(width: 120, alignment: .leading)
                Text("35000 killed")
                Text("~123091823 kounded")
                Text("498 inprisoned")
            }
            .padding()
            ZStack {
                Circle()
                    .frame(width: 120, height: 120)
                Text("50%")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

struct MainWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MainWidgetView()
    }
}
