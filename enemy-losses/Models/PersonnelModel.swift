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
    var POW: Int
}
