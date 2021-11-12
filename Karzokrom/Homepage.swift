//
//  Homepage.swift
//  Karzokrom
//
//  Created by CSE on 11/1/21.
//  Copyright © 2021 CSE. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Homepage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var postData : [karzosuchi] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref : DatabaseReference?
    var databaseHandle : DatabaseHandle?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        createtable()

        // Do any additional setup after loading the
    }
    
    func createtable() {
        self.ref = Database.database().reference()
        
        ref?.child("karzokrom").getData(completion: {error, snapshot in
            guard error == nil else{
                print(error?.localizedDescription ?? "ok")
                return;
            }
            
            self.ref?.child("karzokrom").observe(.childAdded, with: {(snapshot) in
                if let posts = snapshot.value as? NSDictionary{
                    
                    let Karzo = posts["karzo"] as? String ?? ""
                    let Name = posts["username"] as? String ?? ""
                    
                    
                    let posts0 = karzosuchi(name: Name, karzo: Karzo)
                    
                    self.postData.append(posts0)
                    
                    /*var p : karzosuchi
                    for p in self.postData{
                        print(p.name, " " , p.karzo)
                    }*/
                    
                    self.tableView.reloadData()
                }
                })
        })
    }
    
    
    @IBAction func logoutntn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    @IBAction func mykarzokromntn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Profile")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
    @IBAction func addkarzokromntn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Post")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = postData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "karzocell") as! karzoTableViewCell
        
        cell.Karzofn(table : post)
        
        return cell
    }
    
}




