//
//  ViewController.swift
//  TextFeildValidationSwift
//
//  Created by MD Faizan on 12/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var PhoneNumberError: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetForm()
        
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "TextFieldViewController")
        self.navigationController?.pushViewController(secondVC!, animated: true)
//        secondVC?.modalPresentationStyle = .fullScreen
//        self.present(secondVC!, animated: true)
       
    }
    
    func resetForm() {
        
        submitButton.isEnabled = false
        
        emailError.isHidden = false
        passwordError.isHidden = false
        PhoneNumberError.isHidden = false
        
        emailError.text = "Required"
        passwordError.text = "Required"
        PhoneNumberError.text = "Required"
        
        emailTF.text = ""
        passwordTF.text = ""
        phoneTF.text = ""
        
    }
    
    
    @IBAction func emailChanged(_ sender: Any) {
        
     
        if let email = emailTF.text
        {
            if let errorMessage = invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else
            {
                emailError.isHidden = true
            }
        }
        
        checkForValidForm()
        
    }
    

    
    func invalidEmail(_ value:String) -> String? {
        
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email Address"
        }
        
        return nil
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        print("faizan")
        if let password = passwordTF.text
                {
                    if let errorMessage = invalidPassword(password)
                    {
                        passwordError.text = errorMessage
                        passwordError.isHidden = false
                    }
                    else
                    {
                        passwordError.isHidden = true
                    }
                }
                
                checkForValidForm()
    }
    
    func invalidPassword(_ value:String) -> String? {
        
        if value.count < 8
                {
                    return "Password must be at least 8 characters"
                }
                if containsDigit(value)
                {
                    return "Password must contain at least 1 digit"
                }
        var result = containsLowerCase(value)
        print(result,"============>")
        
                if containsLowerCase(value)
                {
                    return "Password must contain at least 1 lowercase character"
                }
                if containsUpperCase(value)
                {
                    return "Password must contain at least 1 uppercase character"
                }
                return nil
    }
    
    func containsDigit(_ value: String) -> Bool
        {
            let reqularExpression = ".*[0-9]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
        
        func containsLowerCase(_ value: String) -> Bool
        {
            let reqularExpression = ".*[a-z]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
        
        func containsUpperCase(_ value: String) -> Bool
        {
            let reqularExpression = ".*[A-Z]+.*"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            return !predicate.evaluate(with: value)
        }
    
    @IBAction func phoneNumberChanged(_ sender: Any) {
        
        if let phoneNumber = phoneTF.text {
            if let errorMassege = invalidPhoneNumber(phoneNumber){
                PhoneNumberError.text = errorMassege
                PhoneNumberError.isHidden = false
            } else {
                PhoneNumberError.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidPhoneNumber(_ value:String) -> String? {
        
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set){
            return "phone Number must contain only digits"
        }
        
        
        
        if value.count != 10 {
            return "Phone Number Must be 10 digit in Length"
        }
        return nil
    }
    
    func checkForValidForm(){
        if emailError.isHidden && passwordError.isHidden && PhoneNumberError.isHidden {
            submitButton.isEnabled = true
        }else {
            submitButton.isEnabled = false
        }
        
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        resetForm()
        
    }
    
    
}

