//
//  UserViewModel.swift
//  testing
//
//  Created by P090MMCTSE014 on 19/10/23.
//

import Foundation
import UIKit
import CoreData

class UserViewModel: NSObject {
    private(set) var userData: [UserModel] = [] {
        didSet {
            self.bindDataToVC()
        }
    }
    var bindDataToVC: () -> () = {}
    override init() {
        super.init()
        self.userData = self.readUsers()
    }
    
    func fetchUser() {
        self.userData = self.readUsers()
    }
    
    func updateUser(_ id: Int, _ nama: String, index: Int, _ salary: Int) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do {
            let fetch = try managedContext.fetch(fetchRequest)
            print(fetch)
            let dataToUpdate = fetch[index] as! NSManagedObject
            dataToUpdate.setValue(nama, forKey: "name")
            dataToUpdate.setValue(salary, forKey: "salary")
//            dataToUpdate.setValue(id, forKey: "id")

            try managedContext.save()
            
        } catch let err {
            print(err)
        }
    }

    func create(_ id: Int, _ name: String, _ salary: Int){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        let insert = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        insert.setValue(id, forKey: "id")
        insert.setValue(name, forKey: "name")
        insert.setValue(salary, forKey: "salary")
        
        appDelegate.saveContext()
    }
    
    func delete(_ index: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        do {
            let fetch = try managedContext.fetch(fetchRequest)

            let dataToDelete = fetch[index] as! NSManagedObject
            managedContext.delete(dataToDelete)
            
            try managedContext.save()
        } catch let err {
            print(err)
        }


    }
    func readUsers() -> [UserModel]{
        var users = [UserModel]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            print(result)
            result.forEach{user in
                users.append(UserModel(id: user.value(forKey: "id") as! Int, nama: user.value(forKey: "name") as! String, salary: user.value(forKey: "salary") as! Int))
            }
        } catch let err {
            print(err)
        }
        return users
    }
}
