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
        
        Alamofire.request(url).responseJSON { (response) -> Void in
            print(response)

            if response.result.isSuccess {
                //let resJson = JSON(responseObject.result.value!)
                //self.delegate?.succesGetVehicles()
            }
            if response.result.isFailure {
                self.delegate?.failureGetVehicles()
            }
        }
    }
    
}
