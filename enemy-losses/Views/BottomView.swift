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
                .bold()
                .kerning(5)
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            ScrollView {
                VStack {
                    Image("\(widgetTapped.rawValue)")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("\(widgetTapped.detailedInfo)")
                }
                
            }
            
            
            
//            RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) , color2: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), size: 80, percent: 75, showProgressLine: $showProgressLine)
//                .animation(.easeInOut.delay(0.3))
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}

//struct BottomView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomView(showProgressLine: true)
//    }
//}
