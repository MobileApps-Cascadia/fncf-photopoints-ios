//
//  PlantInfoViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 5/2/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class PlantInfoViewController: UIViewController {
    
    @IBOutlet var plantNameLabel: UILabel!
    @IBOutlet var latinNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pictureScrollView: UIScrollView!
    
    var myPlant: Plant!
    let plantManager = PlantManager()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if(myPlant == nil)
        {
            myPlant = Plant(plantID: -1, name: "failed to get plant", latinName: "failed to get plant", desc: "failed to get plant")
        }
        
        if(myPlant.name == "Douglas Fir")
        {
        var imageArray = [UIImage]()
        
        //view.addSubview(pictureScrollView)
            
        imageArray = [#imageLiteral(resourceName: "DouglasFir_CloseUp"), #imageLiteral(resourceName: "DouglasFir")]
        
        func setupImages(_ images: [UIImage]){
            
            for i in 0..<images.count {
                
                let imageView = UIImageView()
                imageView.image = imageArray[i]
                let xPosition = UIScreen.main.bounds.width * CGFloat(i)
                imageView.frame = CGRect(x: xPosition, y: 0, width: pictureScrollView.frame.width, height: pictureScrollView.frame.height)
                imageView.contentMode = .scaleAspectFit
                
                pictureScrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
                pictureScrollView.addSubview(imageView)
                pictureScrollView.delegate = self as? UIScrollViewDelegate
            }
        }
        
        setupImages(imageArray)
        
        plantNameLabel.text = plantManager.getPlantByName(name: "Douglas Fir").name
        
        latinNameLabel.text = plantManager.getPlantByName(name: "Douglas Fir").latinName
        
        descriptionLabel.text = plantManager.getPlantByName(name: "Douglas Fir").desc
        }
        else{
            plantNameLabel.text = myPlant.name;
            latinNameLabel.text = myPlant.latinName;
            descriptionLabel.text = myPlant.desc;
        }
    }
}


