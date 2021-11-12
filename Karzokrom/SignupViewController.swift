//
//  SignupViewController.swift
//  Karzokrom
//
//  Created by CSE on 11/1/21.
//  Copyright © 2021 CSE. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signupbtn(_ sender: Any) {
        if Email.text?.isEmpty == true {
            print("Please Enter Email!")
            return
        }
        
        if Password.text?.isEmpty == true {
            print("Please Enter Password!")
            return
        }
        signUp()
    }
    @IBAction func loginpage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    func signUp(){
        Auth.auth().createUser(withEmail: Email.text!, password: Password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error\(error?.localizedDescription)")
                return
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
