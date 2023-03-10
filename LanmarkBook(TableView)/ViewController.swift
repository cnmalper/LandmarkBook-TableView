//
//  ViewController.swift
//  LanmarkBook(TableView)
//
//  Created by Alper Canımoğlu on 27.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tabelView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var landmarkInfos = [String]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    var chosenLanmarkInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
        landmarkInfos.append("Istanbul, the city in Part of Marmara Region's Catalca-Kocaeli, and one of 81 cities of Turkey. It's the most crowded city of Turkey. The city foremost about economically, sociocultural and historically.")
        landmarkInfos.append("Lugo is a city in northwestern Spain in the autonomous community of Galicia.")
        landmarkInfos.append("New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square.")
        landmarkInfos.append("Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine. Beyond such landmarks as the Eiffel Tower and the 12th-century, Gothic Notre-Dame cathedral, the city is known for its cafe culture and designer boutiques along the Rue du Faubourg Saint-Honoré.")
        landmarkInfos.append("The Taj Mahal, is an Islamic ivory-white marble mausoleum on the right bank of the river Yamuna in the Indian city of Agra. It was commissioned in 1631 by the Mughal emperor Shah Jahan to house the tomb of his favourite wife, Mumtaz Mahal; it also houses the tomb of Shah Jahan himself.")
        
        
        landmarkNames.append("Istanbul")
        landmarkNames.append("Lugo")
        landmarkNames.append("New York")
        landmarkNames.append("Paris")
        landmarkNames.append("Taj Mahal")
        
        
        landmarkImages.append(UIImage(named: "istanbul.jpg")!)
        landmarkImages.append(UIImage(named: "lugo.jpg")!)
        landmarkImages.append(UIImage(named: "newyork.jpg")!)
        landmarkImages.append(UIImage(named: "paris")!)
        landmarkImages.append(UIImage(named: "tacmahal")!)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        chosenLanmarkInfo = landmarkInfos[indexPath.row]
        performSegue(withIdentifier: "to2VC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to2VC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkNames = chosenLandmarkName
            destinationVC.selectedLandmarkImages = chosenLandmarkImage
            destinationVC.selectedLandmarkInfo = chosenLanmarkInfo
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkInfos.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

