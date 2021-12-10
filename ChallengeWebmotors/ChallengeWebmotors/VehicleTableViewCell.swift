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
            
            img.kf.setImage(with: URL(string: (vehicle?.image)!), placeholder: UIImage(named: "vehicleDefault"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
