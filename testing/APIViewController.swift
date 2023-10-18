//
//  APIViewController.swift
//  testing
//
//  Created by P090MMCTSE014 on 18/10/23.
//

import UIKit
import Alamofire

class APIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var employees: [Employee] = []
    
    let dataProfile = Profile(name: "Noven", job: "BCA", age: 20, bio: "HEHEHE")

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! TableEmployeesApiCell
        
//        for i in employees {
//            cell.setValue(value: i)
//        }
        cell.labelNama.text = self.employees[indexPath.row].nama
        cell.labelGaji.text = "Rp." + String(self.employees[indexPath.row].gaji)
        cell.labelUmur.text = String(self.employees[indexPath.row].umur)

        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(
                nibName: "TableEmployeesApiCell", bundle: nil
            ), forCellReuseIdentifier: "EmployeeCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 216

        guard let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees") else { return }
        
        let urlConvertible: URLConvertible = url
        
        AF.request(urlConvertible).response { responseData in
            
            guard let data = responseData.data else { return }
            do {
                let result = try JSONDecoder().decode(Wrapper.self, from: data)
                
                self.employees = result.data
                self.tableView.reloadData()
                
            } catch let jsonErr {
                print("Error json : ", jsonErr)
            }
            debugPrint(self.employees)
            self.tableView.reloadData()
            debugPrint(responseData.data)
        }
        
        // Do any additional setup after loading the view.
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
