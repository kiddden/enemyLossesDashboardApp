//
//  PersonnelViewModel.swift
//  enemy-losses
//
//  Created by Eugene Ned on 06.07.2022.
//

import Foundation

class PersonnelViewModel: ObservableObject {
    @Published var personnel: [Personnel] = []
    
    var startDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let tempStartDate = personnel.first?.date
        if let tempStartDate = tempStartDate {
            return dateFormatter.date(from: tempStartDate)!
        }
        return Date()
    }
    var endDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let tempEndDate = personnel.last?.date
        if let tempEndDate = tempEndDate {
            return dateFormatter.date(from: tempEndDate)!
        }
        return Date()
    }
    
    
    func getPersonnelLosses(completion:@escaping ([Personnel]) -> ()) {
            guard let url = URL(string: "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else { return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let personnel = try! JSONDecoder().decode([Personnel].self, from: data!)
                print(personnel)
                
                DispatchQueue.main.async {
                    completion(personnel)
                }
            }
            .resume()
        }
    
    init() {
         getPersonnelLosses { (personnel) in
            self.personnel = personnel
        }
    }
}
