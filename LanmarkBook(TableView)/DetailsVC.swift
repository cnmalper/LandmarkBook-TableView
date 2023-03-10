//
//  DetailsVC.swift
//  LanmarkBook(TableView)
//
//  Created by Alper Canımoğlu on 27.10.2022.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var landmarkNameTitle: UILabel!
    @IBOutlet weak var landmarkImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var selectedLandmarkNames = ""
    var selectedLandmarkImages = UIImage()
    var selectedLandmarkInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkNameTitle.text = selectedLandmarkNames
        landmarkImage.image = selectedLandmarkImages
        infoLabel.text = selectedLandmarkInfo
        
    }
    

}
