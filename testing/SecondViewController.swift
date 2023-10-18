//
//  SecondViewController.swift
//  testing
//
//  Created by P090MMCTSE014 on 13/10/23.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let dataProfile = Profile(name: "Noven", job: "BCA", age: 20, bio: "HEHEHE")
    let profileTypeOrder = [
        ProfileType.name,
        ProfileType.age,
        ProfileType.job,
        ProfileType.bio
    ]

    @IBOutlet weak var labelDest: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var parseName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDest.text = parseName
        
        tableView.register(
            UINib(
                nibName: "ProfileTableViewCell", bundle: nil
            ), forCellReuseIdentifier: "ProfileCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 216
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileTableViewCell
        let cellData: [(ProfileType, String)] = [
            (profileTypeOrder[0], dataProfile.name),
            (profileTypeOrder[1], String(dataProfile.age)),
            (profileTypeOrder[2], dataProfile.job),
            (profileTypeOrder[3], dataProfile.bio),
        ]
        
        cell.setValue(type: cellData[indexPath.row].0, value: cellData[indexPath.row].1)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
