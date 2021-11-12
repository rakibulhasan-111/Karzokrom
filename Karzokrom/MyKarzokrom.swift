//
//  MyKarzokrom.swift
//  Karzokrom
//
//  Created by CSE on 11/1/21.
//  Copyright © 2021 CSE. All rights reserved.
//

import UIKit

class MyKarzokrom: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func mylogoutntn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func myhomentn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func myaddntn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Post")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
