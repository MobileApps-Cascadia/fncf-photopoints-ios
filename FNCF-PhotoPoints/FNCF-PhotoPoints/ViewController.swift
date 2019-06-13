

import UIKit

class ViewController: UIViewController {
   
    
    @IBOutlet weak var PlantListButton: RoundButton!
    @IBOutlet weak var ScannerButton: RoundButton!
    @IBOutlet weak var GalleryButton: RoundButton!
    @IBOutlet weak var MenuButton: RoundButton!
    
    var PlantListButtonCenter: CGPoint!
    var ScannerButtonCenter: CGPoint!
    var GalleryButtonCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlantListButtonCenter = PlantListButton.center
        GalleryButtonCenter = GalleryButton.center
        ScannerButtonCenter = ScannerButton.center
        
        PlantListButton.center = MenuButton.center
        GalleryButton.center = MenuButton.center
        ScannerButton.center = MenuButton.center
        
        self.view.bringSubviewToFront(MenuButton)
        
        let pm = PlantManager()
        
        print(pm.getPlantByName(name: "Douglas Fir").name)
        print(pm.getPlantByID(id: 2).latinName)
        print(pm.getPlantByID(id: 4).desc)
        print(pm.getPlantByID(id: 5).desc)
    }
    //use if using constrants on menu buttons
    //override func viewDidLayoutSubviews() {
       
    //   PlantListButton.center = MenuButton.center
    //  GalleryButton.center = MenuButton.center
    //   ScannerButton.center = MenuButton.center
    // }
    
    @IBAction func MenuClicked(_ sender: RoundButton) {
        if sender.currentTitleColor == UIColor.white{
            UIView.animate(withDuration: 0.5, animations: {
                //animation here
                self.PlantListButton.alpha = 1
                self.ScannerButton.alpha = 1
                self.GalleryButton.alpha = 1
                
                self.PlantListButton.center = self.PlantListButtonCenter
                self.GalleryButton.center = self.GalleryButtonCenter
                self.ScannerButton.center = self.ScannerButtonCenter
                
            })
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                //collapse Buttons
                self.GalleryButton.alpha = 0
                self.ScannerButton.alpha = 0
                self.PlantListButton.alpha = 0
                
                self.PlantListButton.center = self.MenuButton.center
                self.GalleryButton.center = self.MenuButton.center
                self.ScannerButton.center = self.MenuButton.center
               
             })
        }
        
        toggleButton(button: sender)
    }
    
    func toggleButton(button: RoundButton) {
        if button.currentTitleColor == UIColor.white{
            button.setTitleColor(UIColor.lightGray, for: .normal)
            button.layer.borderColor = UIColor.lightGray.cgColor
        }else{
            button.setTitleColor(UIColor.white, for: .normal)
            button.layer.borderColor = UIColor.white.cgColor
            
        }
    }
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

}


