

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    //for slide over
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    @IBOutlet weak var MenuView: UIView!
    
    @IBOutlet weak var PlantListButton: RoundButton!
    @IBOutlet weak var ScannerButton: RoundButton!
    @IBOutlet weak var GalleryButton: RoundButton!
    @IBOutlet weak var MenuButton: RoundButton!
    @IBOutlet weak var textField: UITextField!
    
    
    //Variables for Search
    var timer = Timer()
    var autoCompleteCharacterCount = 0
    var plant = Plant(plantID: -1, name: "void", latinName: "void", desc: "void")
    
    var PlantListButtonCenter: CGPoint!
    var ScannerButtonCenter: CGPoint!
    var GalleryButtonCenter: CGPoint!
    let pm = PlantManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuView.layer.shadowOpacity = 1
        MenuView.layer.shadowRadius = 5
        
        PlantListButtonCenter = PlantListButton.center
        GalleryButtonCenter = GalleryButton.center
        ScannerButtonCenter = ScannerButton.center
        
        PlantListButton.center = MenuButton.center
        GalleryButton.center = MenuButton.center
        ScannerButton.center = MenuButton.center
        
        self.view.bringSubviewToFront(MenuButton)
        
        self.textField.delegate = self
        
        //observer for textField
        textField.addTarget(self, action: #selector(ViewController.textField(_:shouldChangeCharactersIn:replacementString:)), for: UIControl.Event.editingChanged)

        // TEST CODE //  TEST CODE //  TEST CODE //
        //print(pm.getPlantByName(name: "Douglas Fir").name)
        //print(pm.getPlantByID(id: 2).latinName)
        //print(pm.getPlantByID(id: 4).desc)
        //print(pm.getPlantByID(id: 5).desc)
    }
    
    //called when user presses return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        self.performSegue(withIdentifier: "plantInfoSegue", sender: self)
        return true
    }
    
    //called when user alters textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var subString  = (textField.text!.capitalized as NSString).replacingCharacters(in: range, with: string)
        subString = formatSubstring(subString: subString)
        
        if subString.count  == 0 {
            resetValues()
        } else{
            searchAutocompleteEntriesWithSubstring(substring: subString)
        }
        return true
    }
    
    func formatSubstring(subString: String) -> String {
        let formatted = String(subString.dropLast(autoCompleteCharacterCount))
        return formatted
    }
    
    func resetValues(){
        autoCompleteCharacterCount = 0
        textField.text = ""
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String){
        //search plants based on text input
        let suggestions = pm.searchPlant(input: substring)
        //autocomplete with most likely result
        
        if suggestions.count > 0 {
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: {(timer) in
                let autocompleteResult = self.formatAutoCompleteResult(substring: substring, possibleMatches: suggestions)
                self.putColorFormattedTextInTextField(autocompleteResult: autocompleteResult, userQuery: substring)
                self.moveCurToEndOfUserQueryPosition(userQuery: substring)
                self.plant = self.pm.getPlantByName(name: suggestions[0])
            })
        } else{
            timer = .scheduledTimer(withTimeInterval: 0.01, repeats: false, block: {(timer) in
                self.textField.text = substring
            })
        }
        
        for r in suggestions{
            print(r)
        }
        print(suggestions.count)
        print("complete")
    }
    
    
    //function that toggls menu open and closed
    @IBAction func openMenu(_ sender: Any) {
        
        if(menuShowing){
            menuLeadingConstraint.constant = -195
        }else{
            menuLeadingConstraint.constant = 0
    }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        menuShowing = !menuShowing
    }
    
    
    func putColorFormattedTextInTextField(autocompleteResult: String, userQuery: String){
        let coloredString: NSMutableAttributedString = NSMutableAttributedString(string: userQuery + autocompleteResult)
        coloredString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black,  range: NSRange(location: userQuery.count, length: autocompleteResult.count))
        self.textField.attributedText = coloredString
    }
    
    func moveCurToEndOfUserQueryPosition(userQuery : String){
        if let newPosition = self.textField.position(from: self.textField.beginningOfDocument, offset: userQuery.count){
            self.textField.selectedTextRange = self.textField.textRange(from: newPosition, to: newPosition)
        }
        let selectedRange: UITextRange? = textField.selectedTextRange
        textField.offset(from: textField.beginningOfDocument, to: (selectedRange?.start)!)
        
        
        
    }
    
    func formatAutoCompleteResult(substring: String, possibleMatches: [String]) -> String {
        var autoCompleteResult = possibleMatches[0]
        autoCompleteResult.removeSubrange(autoCompleteResult.startIndex..<autoCompleteResult.index(autoCompleteResult.startIndex, offsetBy: substring.count))
        autoCompleteCharacterCount = autoCompleteResult.count
        return autoCompleteResult
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "plantInfoSegue"){
            let vc = segue.destination as! PlantInfoViewController
            vc.myPlant = plant
        }
    }
}


