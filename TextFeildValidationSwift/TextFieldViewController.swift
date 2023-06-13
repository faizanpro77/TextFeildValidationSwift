//
//  TextFieldViewController.swift
//  TextFeildValidationSwift
//
//  Created by MD Faizan on 13/06/23.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet weak var checkTestFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        checkTestFeild.borderStyle = .line
    }
   
    
    @IBAction func textFeildChanged(_ sender: Any) {
        print(checkTestFeild.text!)
    }
    

   

}
