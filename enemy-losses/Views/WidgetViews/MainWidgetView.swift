//
//  MainWidgetView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct MainWidgetView: View {
    @Binding var showProgressLine: Bool
    
    @Binding var personnel: [Personnel]
    @Binding var date: Date
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
 
    
    
    
    var body: some View {
        if let currentDateLoss = personnel.first(where: {$0.date == formattedDate}) {
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Personell")
                    Text("~\(currentDateLoss.totalHumanLosses)")
                    Divider()
                        .frame(width: 120, alignment: .leading)
                    Text("\(currentDateLoss.personnel) killed")
                    Text("~\(currentDateLoss.wounded) wounded")
                    if let pow = currentDateLoss.POW {
                        Text("\(pow) imprisoned")
                    }
                }
                .foregroundColor(Color("TextColor"))
                .padding()
                RingView(size: 80, percent: CGFloat(currentDateLoss.percent), showProgressLine: $showProgressLine)
                    .padding()
                    
                    
            }
            .background(Color("WidgetColor"))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
    }
}

//struct MainWidgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainWidgetView()
//    }
//}
