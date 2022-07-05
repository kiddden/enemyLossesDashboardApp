//
//  ContentView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 03.07.2022.
//

import SwiftUI

struct MainView: View {
    @State private var showBottomView = false
    @State var bottomViewPosition = CGSize.zero
    @State var mainViewPosition = CGSize.zero
    @State var showFullBottomView = false
    
    @State var showProgressLineOnStart = true
    
    @State var personnel: [Personnel] = []
    @State var equipment: [Equipment] = []
    
    
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .offset(y: -510)
                .foregroundColor(.indigo)
            VStack {
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    .datePickerStyle(CompactDatePickerStyle())
                    
                Text("🔥ENEMY LOSSES🔥")
                    .bold()
                Divider()
                Spacer()
                ScrollView {
                    MainWidgetView(showProgressLine: $showProgressLineOnStart)
                        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                    WidgetView(equipmentName: "Tanks", increaseDueToday: 7, losses: 209)
                    WidgetView(equipmentName: "MLR", increaseDueToday: 7, losses: 209)
                    WidgetView(equipmentName: "Warships", increaseDueToday: 1, losses: 15)
                    WidgetView(equipmentName: "Airplanes", increaseDueToday: 7, losses: 209)
                }
                .onTapGesture {
                    showBottomView.toggle()
                }
                
            }
            .blur(radius: showBottomView ? 20 : 0)
            .animation(.default)
            BottomView(showProgressLine: $showBottomView)
                .offset(x: 0, y: showBottomView ? 200 : 900)
                .offset(y: bottomViewPosition.height)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(
                    DragGesture().onChanged { value in
                        self.bottomViewPosition = value.translation
                        if self.showFullBottomView {
                            self.bottomViewPosition.height += -210
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
                            self.bottomViewPosition.height = -210
                            self.showFullBottomView = true
                        } else {
                            self.bottomViewPosition = .zero
                            self.showFullBottomView = false
                        }
                        
                    }
                )
//            Text("\(bottomViewPosition.height)")
        }
        .onAppear{
            LossesFetcher().getPersonnelLosses { (personnel) in
                self.personnel = personnel
            }
            LossesFetcher().getEquipmentLosses { (equipment) in
                self.equipment = equipment!
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
