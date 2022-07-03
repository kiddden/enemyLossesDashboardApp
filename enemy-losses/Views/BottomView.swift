//
//  ButtonView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import SwiftUI

struct BottomView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 40, height: 5)
                .opacity(0.1)
            Text("Some info about the equipment...........asdfsafdasdfasdfasdfsdf........")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            HStack {
                RingView()
                Spacer()
            }
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

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}
