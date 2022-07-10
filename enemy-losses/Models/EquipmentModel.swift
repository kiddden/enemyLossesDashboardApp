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
    
    enum EquipmentCodingKeys: String, CodingKey, CaseIterable {
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
        
        var detailedInfo: String {
            switch self {
            case .aircraft:
                return """
                        A military aircraft is any fixed-wing or rotary-wing aircraft that is operated by a legal or insurrectionary armed service of any type. Military aircraft can be either combat or non-combat:
                        Combat aircraft are designed to destroy enemy equipment using their own aircraft ordnance. Combat aircraft are typically developed and procured only by military forces.
                        Non-combat aircraft are not designed for combat as their primary function, but may carry weapons for self-defense. These mainly operate in support roles, and may be developed by either military forces or civilian organizations.
                        """
            case .helicopter:
                return """
                        A military helicopter is a helicopter that is either specifically built or converted for use by military forces. A military helicopter's mission is a function of its design or conversion. The most common use of military helicopters is transport of troops, but transport helicopters can be modified or converted to perform other missions such as combat search and rescue (CSAR), medical evacuation (MEDEVAC), airborne command post, or even armed with weapons for attacking ground targets. Specialized military helicopters are intended to conduct specific missions. Examples of specialized military helicopters are attack helicopters, observation helicopters and anti-submarine warfare helicopters.
                        """
            case .tank:
                return """
                        A tank is an armoured fighting vehicle intended as a primary offensive weapon in front-line ground combat. Tank designs are a balance of heavy firepower, strong armour, and good battlefield mobility provided by tracks and a powerful engine; usually their main armament is mounted in a turret. They are a mainstay of modern 20th and 21st century ground forces and a key part of combined arms combat.
                        """
            case .apc:
                return """
                        An armoured personnel carrier (APC) is a broad type of armoured military vehicle designed to transport personnel and equipment in combat zones. Since World War I, APCs have become a very common piece of military equipment around the world.
                        
                        According to the definition in the Treaty on Conventional Armed Forces in Europe, an APC is "an armoured combat vehicle which is designed and equipped to transport a combat infantry squad and which, as a rule, is armed with an integral or organic weapon of less than 20 millimetres calibre." Compared to infantry fighting vehicles (IFVs), which are also used to carry infantry into battle, APCs have less armament and are not designed to provide direct fire support in battle. Infantry units which travel in APCs are known as mechanized infantry. Some militaries also make a distinction between infantry units which use APCs and infantry units which use IFVs, with the latter being known as armoured infantry in such militaries.
                        """
            case .fieldArtillery:
                return """
                        Field artillery is a category of mobile artillery used to support armies in the field. These weapons are specialized for mobility, tactical proficiency, short range, long range, and extremely long range target engagement.
                        
                        Until the early 20th century, field artillery were also known as foot artillery, for while the guns were pulled by beasts of burden (often horses), the gun crews would usually march on foot, thus providing fire support mainly to the infantry. This was in contrast to horse artillery, whose emphasis on speed while supporting cavalry units necessitated lighter guns and crews riding on horseback.
                        """
            case .mrl:
                return """
                        A multiple rocket launcher (MRL) is a type of rocket artillery system that contains multiple launchers which are fixed to a single platform, and shoots its rocket ordnance in a fashion similar to a volley gun. Rockets are self-propelled in flight and have different capabilities than conventional artillery shells, such as longer effective range, lower recoil, typically considerably higher payload than a similarly sized gun artillery platform, or even carrying multiple warheads.
                        
                        Unguided rocket artillery is notoriously inaccurate and slow to reload compared to gun artillery. A multiple rocket launcher helps compensate for this with its ability to launch multiple rockets in rapid succession, which, coupled with the large kill zone of each warhead, can easily deliver saturation fire over a target area. However, modern rockets can use GPS or inertial guidance to combine the advantages of rockets with the higher accuracy of precision-guided munitions.
                        """
            case .militaryAuto:
                return """
                        A military auto is any vehicle for land-based military transport and activity, including combat vehicles; both specifically designed for, or significantly used by military and armed forces.[1] Most military vehicles require off-road capabilities and/or vehicle armour (plate), making them heavy, therefore some have vehicle tracks instead of being wheeled vehicles; and half-tracks have both. Furthermore, some military vehicles are amphibious, constructed for use on land and water, and sometimes also intermediate surfaces.
                        
                        Military vehicles are almost always camouflaged, or at least painted in inconspicuous colour(s). In contrast, under the Geneva Conventions, all non-combatant military vehicles, such as field ambulances and mobile first aid stations, must be properly and clearly marked as such. Under the conventions, when respected, such vehicles are legally immune from deliberate attack by all combatants.
                        """
            case .fuelTank:
                return """
                        A fuel tank (also called a petrol tank or gas tank) is a safe container for flammable fluids. Though any storage tank for fuel may be so called, the term is typically applied to part of an engine system in which the fuel is stored and propelled (fuel pump) or released (pressurized gas) into an engine. Fuel tanks range in size and complexity from the small plastic tank of a butane lighter to the multi-chambered cryogenic Space Shuttle external tank.
                        """
            case .drone:
                return """
                        An unmanned combat aerial vehicle (UCAV), also known as a combat drone, colloquially shortened as drone or battlefield UAV, is an unmanned aerial vehicle (UAV) that is used for intelligence, surveillance, target acquisition, and reconnaissance and carries aircraft ordnance such as missiles, ATGMs, and/or bombs in hardpoints for drone strikes. These drones are usually under real-time human control, with varying levels of autonomy. Unlike unmanned surveillance and reconnaissance aerial vehicles, UCAVs are used for both drone strikes and battlefield intelligence.
                        
                        Aircraft of this type have no onboard human pilot. As the operator runs the vehicle from a remote terminal, equipment necessary for a human pilot is not needed, resulting in a lower weight and a smaller size than a manned aircraft. Many countries have operational domestic UCAVs, and many more have imported armed drones or are in the process of developing them.
                        """
            case .navalShip:
                return """
                        A naval ship is a military ship (or sometimes boat, depending on classification) used by a navy. Naval ships are differentiated from civilian ships by construction and purpose. Generally, naval ships are damage resilient and armed with weapon systems, though armament on troop transports is light or non-existent.
                        
                        Naval ships designed primarily for naval warfare are termed warships, as opposed to support (auxiliary ships) or shipyard operations.
                        """
            case .antiAircraftWarfare:
                return """
                        Anti-aircraft warfare, counter-air or air defence is the battlespace response to aerial warfare, defined by NATO as "all measures designed to nullify or reduce the effectiveness of hostile air action". It includes surface based, subsurface (submarine launched), and air-based weapon systems, associated sensor systems, command and control arrangements, and passive measures (e.g. barrage balloons). It may be used to protect naval, ground, and air forces in any location. However, for most countries the main effort has tended to be homeland defence. NATO refers to airborne air defence as counter-air and naval air defence as anti-aircraft warfare. Missile defence is an extension of air defence, as are initiatives to adapt air defence to the task of intercepting any projectile in flight.
                        """
            case .specialEquipment:
                return """
                        A military engineering vehicle or special military equipment is a vehicle built for construction work or for the transportation of combat engineers on the battlefield. These vehicles may be modified civilian equipment (such as the armoured bulldozers that many nations field) or purpose-built military vehicles (such as the AVRE). The first appearance of such vehicles coincided with the appearance of the first tanks, these vehicles were modified Mark V tanks for bridging and mine clearance. Modern military engineering vehicles are expected to fulfill numerous roles, as such they undertake numerous forms, examples of roles include; bulldozers, cranes, graders, excavators, dump trucks, breaching vehicles, bridging vehicles, military ferries, amphibious crossing vehicles, and combat engineer section carriers.
                        """
            case .mobileSRBMSystem:
                return """
                        A short-range ballistic missile (SRBM) is a ballistic missile with a range of about 1,000 kilometres (620 mi) or less.
                        The mobile SRBM system is a military vehicle the main responsibility of which is launching such missiles.
                        """
            case .vehiclesAndFuelTanks:
                return """
                        A tank truck, gas truck, fuel truck, or tanker truck (United States usage) or tanker (United Kingdom usage), is a motor vehicle designed to carry liquids or gases on roads. The largest such vehicles are similar to railroad tank cars which are also designed to carry liquid loads. Many variants exist due to the wide variety of liquids that can be transported. Tank trucks tend to be large; they may be insulated or non-insulated; pressurized or non-pressurized; and designed for single or multiple loads (often by means of internal divisions in their tank). Some are semi-trailer trucks. They are difficult to drive and highly susceptible to rollover due to their high center of gravity, and potentially the free surface effect of liquids sloshing in a partially filled tank.
                        """
            case .cruiseMissiles:
                return """
                        A cruise missile is a guided missile used against terrestrial or naval targets that remains in the atmosphere and flies the major portion of its flight path at approximately constant speed. Cruise missiles are designed to deliver a large warhead over long distances with high precision. Modern cruise missiles are capable of travelling at high subsonic, supersonic, or hypersonic speeds, are self-navigating, and are able to fly on a non-ballistic, extremely low-altitude trajectory.
                        """
            default:
                return " "
            }
        }
    }
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: EquipmentCodingKeys.self)
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
