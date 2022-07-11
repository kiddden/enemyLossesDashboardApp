//
//  EquipmentLossesListView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 06.07.2022.
//

import SwiftUI

struct EquipmentLossesListView: View {
    
    
    @StateObject var viewModel = EquipmentViewModel()
    @Binding var widgetTapped: Equipment.CodingKeys
    @Binding var date: Date
    @Binding var showBottomView: Bool
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        if let currentDateEquipmentLoss = viewModel.equipment.first(where: {$0.date == formattedDate}) {
            VStack {
                ForEach(Equipment.CodingKeys.allCases, id: \.self) { equipmentType in
                    if equipmentType != .date && equipmentType != .day && equipmentType != .greatestLossesDirection {
                        if let currentLossesDict = viewModel.getRidOfNans(currentEquipment: currentDateEquipmentLoss, equipmentType: equipmentType) {
                            WidgetView(equipmentName: equipmentType.rawValue, losses: currentLossesDict)
                                .onTapGesture {
                                    showBottomView.toggle()
                                    widgetTapped = equipmentType
                                }
                        }
                    }
                }
            }
        }
    }
}

