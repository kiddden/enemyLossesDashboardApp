//
//  EquipmentViewModel.swift
//  enemy-losses
//
//  Created by Eugene Ned on 06.07.2022.
//

import Foundation

class EquipmentViewModel: ObservableObject {
    @Published var equipment: [Equipment] = []
    
    func getEquipmentLosses(completion:@escaping ([Equipment]) -> ()) {
            guard let url = URL(string: "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") else { return }
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let decoder = JSONDecoder()
                decoder.allowsJSON5 = true
                let equipment = try! decoder.decode([Equipment].self, from: data!)
                print(equipment)

                DispatchQueue.main.async {
                    completion(equipment)
                }
            }
            .resume()
        }
}
