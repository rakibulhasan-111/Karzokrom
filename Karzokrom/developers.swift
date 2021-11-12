//
//  developers.swift
//  Karzokrom
//
//  Created by CSE on 11/1/21.
//  Copyright © 2021 CSE. All rights reserved.
//

import UIKit

struct Developer: Decodable{
    let name1: String
    let name2: String
    let name3: String
    let name4: String
    let name5: String
    let name6: String
}

class developers: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var tv1: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let jsonUrlString = "https://mocki.io/v1/04c02c14-2860-48c1-8a3a-d79d665f2b56"
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let pdata = data else {return}
            do {
                let developer = try JSONDecoder().decode(Developer.self, from: pdata)
                var dev = developer.name1 + ", " + developer.name2 + ", " + developer.name3 + ", " + developer.name4 + ", " + developer.name5 + ", " + developer.name6 + ".";
                self.tv1.text = dev
                
                
            } catch let jsonErr {
                print ("error in parsing", jsonErr)
            }
            
        }.resume()
        
    }
    

    
    @IBAction func aboutloginntn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}
