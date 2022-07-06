//
//  EquipmentLossesListView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 06.07.2022.
//

import SwiftUI

struct EquipmentLossesListView: View {
    
    @Binding var equipment: [Equipment]
    @Binding var date: Date
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        if let currentDateEquipmentLoss = equipment.first(where: {$0.date == formattedDate}) {
            ForEach(Equipment.CodingKeys.allCases, id: \.self) { equipmentType in
                if equipmentType != .date && equipmentType != .day {
                    let currentLossesDict = currentDateEquipmentLoss.dict
                    WidgetView(equipmentName: equipmentType.rawValue, losses: currentLossesDict?["\(equipmentType.rawValue)"] as? Int ?? 0)
                }
            }
        }
    }
}

