//
//  LoginViewController.swift
//  Karzokrom
//
//  Created by CSE on 11/1/21.
//  Copyright © 2021 CSE. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase


class LoginViewController: UIViewController {
    let ref = Database.database().reference()
    
    let auth = Auth.auth()
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var checkerlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //ref.childByAutoId().setValue(["name" : "X"])
        self.checkerlbl.isHidden = true;
    }
    
    @IBAction func Loginbtn(_ sender: Any) {
        if Email.text?.isEmpty == true {
            print("Please Enter Email!")
            return
        }
        
        if Password.text?.isEmpty == true {
            print("Please Enter Password!")
            return
        }
        Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) { (result, error) in
            if(error != nil)
            {
                print("Error")
            }
            else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "home")
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
          // ...
        }
    }
    
   
    
    @IBAction func Signuppage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "signup")
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
    
    
    
    @IBAction func infontn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "developers")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
