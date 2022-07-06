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
    
    @StateObject var personnelViewModel = PersonnelViewModel()
    @StateObject var equipmentViewModel = EquipmentViewModel()
    @State var chosenDate = Date()
    
    var body: some View {
        ZStack {
            Rectangle()
                .offset(y: -510)
                .foregroundColor(.indigo)
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
                    EquipmentLossesListView(equipment: $equipmentViewModel.equipment, date: $chosenDate)
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
            personnelViewModel.getPersonnelLosses { (personnel) in
                self.personnelViewModel.personnel = personnel
            }
            print(personnelViewModel.endDate)
            equipmentViewModel.getEquipmentLosses { (equipment) in
                self.equipmentViewModel.equipment = equipment
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
