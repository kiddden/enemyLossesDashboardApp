//
//  WidgetView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct WidgetView: View {
    
    var equipmentName: String
    var increaseDueToday: Int = 7
    var losses: Int
    
    var body: some View {
        
            HStack {
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.indigo)
                            .frame(width: 50, height: 50)
                            .opacity(0.7)
                        Image("\(equipmentName)")
                            .resizable()
                            .frame(width: 40, height: 40)
//                            .scaledToFit()
                            .foregroundColor(.black)
                            
                    }
                    .padding(.leading, 10)
                    VStack(alignment: .leading) {
                        Text(equipmentName.capitalized)
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
                            .font(.subheadline)
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
        WidgetView(equipmentName: "Aircraft", increaseDueToday: 7, losses: 209)
    }
}
