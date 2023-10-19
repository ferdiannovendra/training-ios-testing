//
//  CoreDataViewController.swift
//  testing
//
//  Created by P090MMCTSE014 on 19/10/23.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userViewModel: UserViewModel!

    
//    let anu = UserModel(id: 1, nama: "noven")
    
    @IBOutlet weak var tableViewC: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.userData.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nama = userViewModel.userData[indexPath.row].nama
        let id = userViewModel.userData[indexPath.row].id
        let salary = userViewModel.userData[indexPath.row].salary
        
        let alert = UIAlertController(title: "Update Employee", message: "Fill the form below to add new employee", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {tf in
            tf.text = "\(id)"
            tf.isEnabled = false
        })
        alert.addTextField(configurationHandler: {tf in
            tf.text = "\(nama)"
        })
        alert.addTextField(configurationHandler: {tf in
            tf.text = "\(salary)"
        })
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { action in
            if(alert.textFields![0].text!.isEmpty || alert.textFields![1].text!.isEmpty) {
                let warning = UIAlertController(title: "Warning", message: "Fill all the textfields", preferredStyle: .alert)
                warning.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(warning, animated: true)
            } else {
                //sukses nya disini yak method nya
                self.userViewModel.updateUser(Int(alert.textFields![0].text!)!, alert.textFields![1].text!, index: indexPath.row, Int(alert.textFields![2].text!)!)
                
                let success = UIAlertController(title: "Success", message: "Data Updated!", preferredStyle: .alert)
                success.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(success, animated: true)
                self.userViewModel = UserViewModel()
                self.userViewModel.bindDataToVC = {
                    self.tableViewC.reloadData()
                }
                self.userViewModel.fetchUser()
                self.tableViewC.reloadData()
                
            }
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
            self.userViewModel.delete(indexPath.row
            )
            let success = UIAlertController(title: "Success", message: "Data Deleted!", preferredStyle: .alert)
            success.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(success, animated: true)
            self.userViewModel = UserViewModel()
            self.userViewModel.bindDataToVC = {
                self.tableViewC.reloadData()
            }
            self.userViewModel.fetchUser()
            self.tableViewC.reloadData()

        }))


        self.present(alert, animated: true)

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataCell", for: indexPath) as! CoreDataCellTableViewCell
        cell.labelText.text = String(userViewModel.userData[indexPath.row].id) + ", " + userViewModel.userData[indexPath.row].nama
        cell.labelSalary.text = "Rp. " + String(userViewModel.userData[indexPath.row].salary)
        return cell
    }
    
    
//    func readUsers() -> [UserModel]{
//        var users = [UserModel]()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        
//        do{
//            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
//            result.forEach{user in
//                users.append(UserModel(id: user.value(forKey: "id") as! Int, nama: user.value(forKey: "name") as! String))
//            }
//        } catch let err {
//            print(err)
//        }
//        return users
//    }
    @IBAction func btnTambah(_ sender: Any) {
        let alert = UIAlertController(title: "New Employee", message: "Fill the form below to add new employee", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "id"})
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "nama"})
        alert.addTextField(configurationHandler: {tf in tf.placeholder = "salary"})
        
        alert.addAction(UIAlertAction(title: "Tambah", style: .default, handler: { action in
            if(alert.textFields![0].text!.isEmpty || alert.textFields![1].text!.isEmpty || alert.textFields![2].text!.isEmpty) {
                let warning = UIAlertController(title: "Warning", message: "Fill all the textfields", preferredStyle: .alert)
                warning.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(warning, animated: true)
            } else {
                //sukses nya disini yak method nya
                self.userViewModel.create(Int(alert.textFields![0].text!)!, alert.textFields![1].text!, Int(alert.textFields![2].text!)!)
                
                let success = UIAlertController(title: "Success", message: "Data Added!", preferredStyle: .alert)
                success.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(success, animated: true)
                //Init view model
                self.userViewModel = UserViewModel()
                self.userViewModel.bindDataToVC = {
                    self.tableViewC.reloadData()
                }
                self.userViewModel.fetchUser()
                self.tableViewC.reloadData()
                
            }
        }))
        self.present(alert, animated: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewC.register(
            UINib(
                nibName: "CoreDataCellTableViewCell", bundle: nil
            ), forCellReuseIdentifier: "CoreDataCell")
        
        tableViewC.dataSource = self
        tableViewC.delegate = self
        
        tableViewC.rowHeight = UITableView.automaticDimension
        tableViewC.estimatedRowHeight = 216
        
        //Init view model
        userViewModel = UserViewModel()
        userViewModel.bindDataToVC = {
            self.tableViewC.reloadData()
        }
        userViewModel.fetchUser()

//        arrUsers.append(anu)
        tableViewC.reloadData()
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
