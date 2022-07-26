//
//  DatePickerView.swift
//  enemy-losses
//
//  Created by Eugene Ned on 06.07.2022.
//

import SwiftUI

struct DatePickerView: View {
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var startDate: Date
    var endDate: Date
    @Binding var chosenDate: Date
    
    var body: some View {
        HStack {
            Button {
                if dateFormatter.string(from: chosenDate) != dateFormatter.string(from: startDate) {
                    chosenDate = Calendar.current.date(byAdding: .day, value: -1, to: chosenDate) ?? Date()
                }
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(dateFormatter.string(from: chosenDate) != dateFormatter.string(from: startDate) ? .white : .gray)
                    .padding(.horizontal)
            }
            Spacer()
            DatePicker(selection: $chosenDate,
                       in: startDate...endDate,
                       displayedComponents: .date) {}
                .labelsHidden()
                .colorScheme(.dark)
            Spacer()
            Button {
                if dateFormatter.string(from: chosenDate) != dateFormatter.string(from: endDate) {
                    chosenDate = Calendar.current.date(byAdding: .day, value: 1, to: chosenDate) ?? Date()
                }
            } label: {
                Image(systemName: "chevron.right")
                    .foregroundColor(dateFormatter.string(from: chosenDate) != dateFormatter.string(from: endDate) ? .white : .gray)
                    .padding(.horizontal)
            }
        }
    }
}

