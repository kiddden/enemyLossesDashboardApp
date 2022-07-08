//
//  EquipmentLossesListView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 06.07.2022.
//

import SwiftUI

struct EquipmentLossesListView: View {
    @State var bottomViewPosition = CGSize.zero
    @State var showFullBottomView = false
    
    @Binding var equipment: [Equipment]
    @Binding var date: Date
    @Binding var showBottomView: Bool
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        if let currentDateEquipmentLoss = equipment.first(where: {$0.date == formattedDate}) {
            ZStack {
                VStack {
                    ForEach(Equipment.CodingKeys.allCases, id: \.self) { equipmentType in
                        if equipmentType != .date && equipmentType != .day && equipmentType != .greatestLossesDirection {
                            let currentLossesDict = currentDateEquipmentLoss.dict
                            WidgetView(equipmentName: equipmentType.rawValue, losses: currentLossesDict?["\(equipmentType.rawValue)"] as? Int ?? 0)
                        }
                    }
                }
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
            }
        }
    }
}

