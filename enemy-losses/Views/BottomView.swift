//
//  ButtonView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct BottomView: View {
    @Binding var showProgressLine: Bool
    @Binding var widgetTapped: Equipment.EquipmentCodingKeys
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 40, height: 5)
                .opacity(0.1)
            Text("ABOUT")
                .foregroundColor(Color("TextColor"))
                .bold()
                .kerning(5)
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            ScrollView {
                VStack {
                    Image("\(widgetTapped.rawValue)")
                        .resizable()
                        .foregroundColor(Color("TextColor"))
                        .frame(width: 200, height: 200)
                    Text("\(widgetTapped.detailedInfo)")
                        .foregroundColor(Color("TextColor"))
                }
            }
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("WidgetColor"))
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

//struct BottomView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomView(showProgressLine: true)
//    }
//}
