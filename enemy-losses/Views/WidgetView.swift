//
//  WidgetView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct WidgetView: View {
    
    var equipmentName: String
    var increaseDueToday: Int
    var losses: Int
    
    var body: some View {
        
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 45, height: 45)
                    Text("✈️")
                }
                .padding(.leading, 10)
                VStack(alignment: .leading) {
                    Text(equipmentName)
                        .bold()
                    Text("+\(increaseDueToday)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }
                Spacer()
                VStack {
                    Text(String(losses))
                    Text("total")
                }
                .padding()
                
            }
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 10)
            .padding(.horizontal)
            
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(equipmentName: "Airplanes", increaseDueToday: 7, losses: 209)
    }
}
