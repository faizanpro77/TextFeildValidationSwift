//
//  TextFieldViewController.swift
//  TextFeildValidationSwift
//
//  Created by MD Faizan on 13/06/23.
//

import UIKit

class TextFieldViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var checkTestFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        checkTestFeild.delegate = self
        // Do any additional setup after loading the view.
    
        checkTestFeild.borderStyle = .line
    }
   
    //MARK: only digits
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        
    }
    
    @IBAction func textFeildChanged(_ sender: Any) {
        print(checkTestFeild.text!)
    }
    

   

}
