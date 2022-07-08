//
//  ContentView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 03.07.2022.
//

import SwiftUI

struct MainView: View {
    @State private var showBottomView = false
    
    @State var mainViewPosition = CGSize.zero
    
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
                    EquipmentLossesListView(equipment: $equipmentViewModel.equipment, date: $chosenDate, showBottomView: $showBottomView)
                }
                .onTapGesture {
                    showBottomView.toggle()
                }
            }
            .blur(radius: showBottomView ? 20 : 0)
            .animation(.default)
            
            //            Text("\(bottomViewPosition.height)")
        }
        .onAppear{
            print(personnelViewModel.endDate)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
