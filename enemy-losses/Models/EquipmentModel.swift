//
//  LostEquipmentModel.swift
//  enemy-losses
//
//  Created by Eugene Ned on 04.07.2022.
//

import Foundation


struct Equipment: Encodable, Decodable {
    var date: String
    var day: Int
    var aircraft: Int
    var helicopter: Int
    var tank: Int
    var apc: Int
    var fieldArtillery: Int
    var mrl: Int
    var militaryAuto: Int?
    var fuelTank: Int?
    var drone: Int
    var navalShip: Int
    var antiAircraftWarfare: Int
    var specialEquipment: Int?
    var mobileSRBMSystem: Int?
    var vehiclesAndFuelTanks: Int?
    var cruiseMissiles: Int?
    var greatestLossesDirection: String?
    var detailedInfo = [
        "aircraft": "",
        "helicopter": "",
        "tank": "",
        "APC": "",
        "field artillery": "",
        "MRL": "",
        "military auto": "",
        "fuel tank": "",
        "drone": "",
        "naval ship": "",
        "anti-aircraft warfare": "",
        "special equipment": "",
        "mobile SRBM system": "",
        "vehicles and fuel tanks": "",
        "cruise missiles": ""
    ]
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case greatestLossesDirection = "greatest losses direction"
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            date = try container.decode(String.self, forKey: .date)
            day = try container.decode(Int.self, forKey: .day)
            aircraft = try container.decode(Int.self, forKey: .aircraft)
            helicopter = try container.decode(Int.self, forKey: .helicopter)
            tank = try container.decode(Int.self, forKey: .tank)
            apc = try container.decode(Int.self, forKey: .apc)
            fieldArtillery = try container.decode(Int.self, forKey: .fieldArtillery)
            mrl = try container.decode(Int.self, forKey: .mrl)
            
            drone = try container.decode(Int.self, forKey: .drone)
            navalShip = try container.decode(Int.self, forKey: .navalShip)
            antiAircraftWarfare = try container.decode(Int.self, forKey: .antiAircraftWarfare)
            militaryAuto = try? container.decode(Int.self, forKey: .militaryAuto)
            fuelTank = try? container.decode(Int.self, forKey: .fuelTank)
            specialEquipment = try? container.decode(Int.self, forKey: .specialEquipment)
            mobileSRBMSystem = try? container.decode(Int.self, forKey: .mobileSRBMSystem)
            vehiclesAndFuelTanks = try? container.decode(Int.self, forKey: .vehiclesAndFuelTanks)
            cruiseMissiles = try? container.decode(Int.self, forKey: .cruiseMissiles)
            greatestLossesDirection = try? container.decode(String.self, forKey: .greatestLossesDirection)
            
        } catch DecodingError.typeMismatch {
            let string = try container.decode(String.self, forKey: .day)
            if let int = Int(string) {
                print("here")
                date = try container.decode(String.self, forKey: .date)
                day = int
                aircraft = try container.decode(Int.self, forKey: .aircraft)
                helicopter = try container.decode(Int.self, forKey: .helicopter)
                tank = try container.decode(Int.self, forKey: .tank)
                apc = try container.decode(Int.self, forKey: .apc)
                fieldArtillery = try container.decode(Int.self, forKey: .fieldArtillery)
                mrl = try container.decode(Int.self, forKey: .mrl)
                
                drone = try container.decode(Int.self, forKey: .drone)
                navalShip = try container.decode(Int.self, forKey: .navalShip)
                antiAircraftWarfare = try container.decode(Int.self, forKey: .antiAircraftWarfare)
                militaryAuto = try? container.decode(Int.self, forKey: .militaryAuto)
                fuelTank = try? container.decode(Int.self, forKey: .fuelTank)
                specialEquipment = try? container.decode(Int.self, forKey: .specialEquipment)
                mobileSRBMSystem = try? container.decode(Int.self, forKey: .mobileSRBMSystem)
                vehiclesAndFuelTanks = try? container.decode(Int.self, forKey: .vehiclesAndFuelTanks)
                cruiseMissiles = try? container.decode(Int.self, forKey: .cruiseMissiles)
                greatestLossesDirection = try? container.decode(String.self, forKey: .greatestLossesDirection)
            } else {
                throw DecodingError.dataCorruptedError(forKey: .day, in: container, debugDescription: "ERROR DAY DECODING")
            }
        }
    }
}

extension Encodable {
    var dict: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}

//enum Day: Codable {
//    case integer(Int)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(Day.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Day"))
//    }
//}
