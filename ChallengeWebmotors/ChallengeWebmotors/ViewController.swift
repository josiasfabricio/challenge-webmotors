//
//  ViewController.swift
//  ChallengeWebmotors
//
//  Created by Josias Fabrício on 08/12/21.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var vehiclesTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private var vehicleViewModel: VehicleViewModel!
    private var tableViewDataSource: VehicleTableViewDataSource<VehicleTableViewCell, Vehicle>!
    
    var isLoadingList : Bool = false
    var currentPage : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Challenge Webmotors"
        self.vehiclesTableView.delegate = self
        self.vehicleViewModel = VehicleViewModel()
        callToViewModelForUiUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        vehiclesTableView.isHidden = true
        loadingIndicator.isHidden = false
    }
    
    func callToViewModelForUiUpdate(){
        currentPage += 1
        
        self.vehicleViewModel.fetchVehicles(page: self.currentPage)
        self.vehicleViewModel.bindVehicleViewModelToController = {
            self.updateTableViewDataSource()
        }
        
        isLoadingList = false
    }
    
    func updateTableViewDataSource(){
        self.tableViewDataSource = VehicleTableViewDataSource(cellIdentifier: "VehicleTableViewCell", items: self.vehicleViewModel.vehiclesData, configureCell: { (cell, viewModel) in
            cell.vehicle = viewModel
        })
        
        self.loadingIndicator.isHidden = true
        self.vehiclesTableView.isHidden = false
        
        DispatchQueue.main.async {
            print("DispatchQueue.main.async")
            self.vehiclesTableView.dataSource = self.tableViewDataSource
            self.vehiclesTableView.reloadData()
        }
    }
}

extension ViewController:UITableViewDelegate, UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (vehiclesTableView.contentSize.height-100-scrollView.frame.size.height) && !isLoadingList {
            isLoadingList = true
            callToViewModelForUiUpdate()
        }
    }
}

