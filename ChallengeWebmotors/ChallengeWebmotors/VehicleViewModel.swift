//
//  VehicleViewModel.swift
//  ChallengeWebmotors
//
//  Created by Josias Fabrício on 09/12/21.
//

import Foundation

class VehicleViewModel: NSObject {
    
    private var dataSource: VehicleDataSource!
    
    private (set) var vehiclesData: [Vehicle]! {
        didSet {
            self.bindVehicleViewModelToController()
        }
    }
    
    var bindVehicleViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.dataSource = VehicleDataSource()
        self.dataSource.delegate = self
    }
    
    func fetchVehicles(page: Int){
        self.dataSource.getVehicles(page)
    }
}

extension VehicleViewModel: VehicleDataSourceDelegate {
    func failureGetVehicles() {
        //
    }
    
    func sucessGetVehicles(response: [Vehicle]) {
        self.vehiclesData = response
    }
}
