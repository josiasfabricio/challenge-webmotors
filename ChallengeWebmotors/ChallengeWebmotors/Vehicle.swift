//
//  Vehicle.swift
//  ChallengeWebmotors
//
//  Created by Josias Fabrício on 09/12/21.
//

import Foundation
import ObjectMapper

class Vehicle: Mappable{
    var id: Int?
    var make: String?
    var model: String?
    var version: String?
    var image: String?
    var km: Int?
    var price: String?
    var yearModel: Int?
    var yearFab: Int?
    var color: String?
    
    init(){}
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id = map.JSON["ID"] as! Int?
        make = map.JSON["Make"] as! String?
        model = map.JSON["Model"] as! String?
        version = map.JSON["Version"] as! String?
        image = map.JSON["Image"] as! String?
        km = map.JSON["KM"] as! Int?
        price = map.JSON["Price"] as! String?
        yearModel = map.JSON["YearModel"] as! Int?
        yearFab = map.JSON["YearFab"] as! Int?
        color = map.JSON["Color"] as! String?
    }
}
