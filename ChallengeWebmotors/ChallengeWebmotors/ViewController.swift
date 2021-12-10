//
//  ViewController.swift
//  ChallengeWebmotors
//
//  Created by Josias Fabrício on 08/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vehiclesTableView: UITableView!
    
    private var vehicleViewModel: VehicleViewModel!
    private var tableViewDataSource: VehicleTableViewDataSource<VehicleTableViewCell, Vehicle>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUiUpdate()
    }
    
    func callToViewModelForUiUpdate(){
        self.vehicleViewModel = VehicleViewModel()
        self.vehicleViewModel.fetchVehicles(page: 1)
        self.vehicleViewModel.bindVehicleViewModelToController = {
            self.updateTableViewDataSource()
        }
    }
    
    func updateTableViewDataSource(){
        self.tableViewDataSource = VehicleTableViewDataSource(cellIdentifier: "VehicleTableViewCell", items: self.vehicleViewModel.vehiclesData, configureCell: { (cell, viewModel) in
            cell.vehicle = viewModel
        })
        
        DispatchQueue.main.async {
            self.vehiclesTableView.dataSource = self.tableViewDataSource
            self.vehiclesTableView.reloadData()
        }
    }


}

