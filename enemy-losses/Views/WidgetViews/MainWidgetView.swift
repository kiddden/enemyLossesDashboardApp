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
                    Text("\(currentDateLoss.POW) imprisoned")
                }
                .foregroundColor(Color("TextColor"))
                .padding()
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) , color2: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), size: 80, percent: CGFloat(currentDateLoss.percent), showProgressLine: $showProgressLine)
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
