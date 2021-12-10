//
//  VehicleDataSource.swift
//  ChallengeWebmotors
//
//  Created by Josias Fabrício on 09/12/21.
//

import Foundation
import Alamofire
import ObjectMapper

protocol VehicleDataSourceDelegate: class {
    func failureGetVehicles()
    func sucessGetVehicles(response: [Vehicle])
}

protocol VehicleDataSouceProtocol {
    var delegate: VehicleDataSourceDelegate? { get set}
    func getVehicles(_ page: Int)
}

class VehicleDataSource: VehicleDataSouceProtocol {
    var delegate: VehicleDataSourceDelegate?
    
    func getVehicles(_ page: Int) {
        let url = "https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=\(page)"
        
        Alamofire.request(url).responseJSON { response in
            if response.result.isSuccess {
                if let vehicles: [Vehicle] = Mapper<Vehicle>().mapArray(JSONObject: response.result.value){
                    self.delegate?.sucessGetVehicles(response: vehicles)
                }else{
                    self.delegate?.failureGetVehicles()
                }
            }
            if response.result.isFailure {
                self.delegate?.failureGetVehicles()
            }
        }
    }
    
}
