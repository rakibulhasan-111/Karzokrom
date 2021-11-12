//
//  AddKarzokrom.swift
//  Karzokrom
//
//  Created by CSE on 11/1/21.
//  Copyright © 2021 CSE. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddKarzokrom: UIViewController {
    
    @IBOutlet weak var addkarzo: UITextField!
    @IBOutlet weak var name: UITextField!
    var ref : DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
    }
    
    @IBAction func postntn(_ sender: Any) {
        
        
        ref?.child("karzokrom").childByAutoId().setValue(["username": name.text, "karzo": addkarzo.text])
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
    
    
}
