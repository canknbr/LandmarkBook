//
//  DetailsViewController.swift
//  LandmarkBook
//
//  Created by Can Kanbur on 30.03.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var landmarkNameImage: UIImageView!
    @IBOutlet weak var landmarkNameLabel: UILabel!
    
    
    var mainName = ""
    var mainImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landmarkNameImage.image = mainImage
        landmarkNameLabel.text = mainName

        
    }
    

 

}
