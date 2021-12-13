//
//  VehicleTableViewCell.swift
//  ChallengeWebmotors
//
//  Created by Josias Fabrício on 09/12/21.
//

import Foundation
import UIKit
import Kingfisher


class VehicleTableViewCell: UITableViewCell {
  
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    var vehicle: Vehicle? {
        didSet{
            makeLabel.text = vehicle?.make
            modelLabel.text = vehicle?.model
            versionLabel.text = vehicle?.version
            priceLabel.text = "R$ \(vehicle?.price ?? "")"
            kmLabel.text = "\(vehicle?.km ?? 0) km"
            yearLabel.text = "\(vehicle?.yearFab ?? 1900)/\(vehicle?.yearModel ?? 1900)"
            colorLabel.text = vehicle?.color
            
            let imgHttps = vehicle?.image!.replacingOccurrences(of: "http", with: "https")
            
            img.kf.setImage(with: URL(string: imgHttps!), placeholder: UIImage(named: "vehicleDefault"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
}
