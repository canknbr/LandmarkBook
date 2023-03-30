//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Can Kanbur on 30.03.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tblView: UITableView!
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenName = ""
    var chosenImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self

  
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")

        landmarkImages.append(UIImage(named: "colosseum.jpeg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpeg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpeg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpeg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpeg")!)
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
        chosenName = landmarkNames[indexPath.row]
        chosenImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destination = segue.destination as! DetailsViewController
            destination.mainName = chosenName
            destination.mainImage = chosenImage
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
}
