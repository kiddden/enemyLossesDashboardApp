//
//  WidgetView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct WidgetView: View {
    
    var equipmentName: String
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
                    .foregroundColor(Color("TextColor"))
                    .frame(width: 40, height: 40)
                    
                
            }
            .padding(.leading, 10)
            VStack(alignment: .leading) {
                Text(equipmentName.capitalized)
                    .foregroundColor(Color("TextColor"))
                    .bold()
            }
            Spacer()
            VStack {
                Text("Total")
                    .foregroundColor(Color("TextColor"))
                    .font(.subheadline)
                Text(String(losses))
                    .kerning(0.4)
                
            }
            .padding()
        }
        .background(Color("WidgetColor"))
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal)
        
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(equipmentName: "Aircraft", losses: 209)
    }
}
