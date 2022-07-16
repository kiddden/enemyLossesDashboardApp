//
//  PersonnelModel.swift
//  enemy-losses
//
//  Created by Eugene Ned on 05.07.2022.
//

import Foundation

struct Personnel: Decodable {
    var date: String
    var day: Int
    var personnel: Int
    var POW: Int?
    var wounded: Int {
        personnel * 3
    }
    var totalHumanLosses: Int {
        personnel + wounded + (POW ?? 0)
    }
    var percent: Int {
        (totalHumanLosses*100)/900_000
    }
    var detailedInfo: String {
        "Russia now has more than 400,000 professional \"contract\" soldiers in its 900,000-strong active armed forces."
    }
}
