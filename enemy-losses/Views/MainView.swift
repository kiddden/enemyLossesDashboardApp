//
//  ContentView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 03.07.2022.
//

import SwiftUI

struct MainView: View {
    @State private var showBottomView = false
    @State var widgetTapped: Equipment.EquipmentCodingKeys = .aircraft
    @State var bottomViewPosition = CGSize.zero
    @State var showFullBottomView = false
    
    @State var mainViewPosition = CGSize.zero
    
    @State var showProgressLineOnStart = true
    
    @StateObject var personnelViewModel = PersonnelViewModel()
    @State var chosenDate = Date()
    
    var body: some View {
        ZStack {
            ZStack {
//                Rectangle()
//                    .offset(y: -510)
//                    .foregroundColor(.indigo)
                Image("background")
                    .frame(width: 300, height: 300)
                    .opacity(0.1)
                VStack {
                    Text("🔥ENEMY LOSSES🔥")
                        .bold()
                    DatePickerView(startDate: personnelViewModel.startDate,
                                   endDate: personnelViewModel.endDate,
                                   chosenDate: $chosenDate)
                    Divider()
                    Spacer()
                    ScrollView {
                        MainWidgetView(showProgressLine: $showProgressLineOnStart,
                                       personnel: $personnelViewModel.personnel,
                                       date: $chosenDate)
                        
                        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                        EquipmentLossesListView(widgetTapped: $widgetTapped, date: $chosenDate, showBottomView: $showBottomView)
                    }
                    
                }
            }
            .blur(radius: showBottomView ? 20 : 0)
            .animation(.default)
            BottomView(showProgressLine: $showBottomView, widgetTapped: $widgetTapped)
                .frame(height: showFullBottomView ? 850 : 700)
                .offset(x: 0, y: showBottomView ? 200 : 900)
                .offset(y: bottomViewPosition.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomViewPosition = value.translation
                        if self.showFullBottomView {
                            self.bottomViewPosition.height += -150
                        }
                        if self.bottomViewPosition.height < -210 {
                            self.bottomViewPosition.height = -210
                        }
                    }
                        .onEnded { value in
                            if bottomViewPosition.height > 50 {
                                self.showBottomView = false
                            }
                            if (bottomViewPosition.height < -50 && !self.showFullBottomView) {
                                self.bottomViewPosition.height = -150
                                self.showFullBottomView = true
                            } else {
                                self.bottomViewPosition = .zero
                                self.showFullBottomView = false
                            }
                            
                        }
                )
            
            //            Text("\(bottomViewPosition.height)")
        }
        .onReceive(personnelViewModel.$personnel, perform: { _ in
            self.chosenDate = personnelViewModel.endDate
        })
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(widgetTapped: <#Equipment.CodingKeys#>)
//    }
//}
