//
//  MainWidgetView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct MainWidgetView: View {
    @Binding var showProgressLine: Bool
    
    var killed = 35400
    var wounded: Int {
        killed * 3
    }
    var pow = 498
    var totalHumanLosses: Int {
        killed + wounded + pow
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Personell")
                Text("~\(totalHumanLosses)")
                Divider()
                    .frame(width: 120, alignment: .leading)
                Text("\(killed) killed")
                Text("~\(wounded) wounded")
                Text("\(pow) imprisoned")
            }
            .padding()
            RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) , color2: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), size: 80, percent: 75, showProgressLine: $showProgressLine)
            .padding()
        }
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

//struct MainWidgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainWidgetView()
//    }
//}
