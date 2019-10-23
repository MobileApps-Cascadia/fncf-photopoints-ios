//
//  DbOperations.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 10/22/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation
import CoreData
import UIKit
//
//  ViewController.swift
//  coredata-device
//
//  Created by Brian Bansenauer on 10/13/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//
// BluePrint
/*
 BluePrint:
 firstName : string
 lastName : string
 email : string
 password : string
 userName : string
 images : Binary data
 
 
 */
protocol DbOps {
  
    
    func add(firstName: String, lastName:String, email:String, password:String, userName:String)
    func Modifyuser(Email: String, Password: String) -> String
    
   // will implement this later
    
   //func addImages(username: String, images: BinaryFloatingPoint)
    
    
    func get (indentifier:String) -> String?
    func Delete(identifier: String)
}

public class DbOperations: DbOps{
    
    func Modifyuser(Email: String, Password: String) -> String {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", Email)
        
        do{
            let test = try managedContext?.fetch(fetchRequest)
            
            let UpdatedUser = test![0] as! NSManagedObject
            UpdatedUser.setValue(Password, forKey: "password")
            do{
                try managedContext?.save()
                return UpdatedUser.value(forKey: "password") as! String
            }
            catch{
                print("error")
            }
        }
        catch{
            print("error")
        }
        return "user Not Found"
    }
    
    
   
    
    func add(firstName: String, lastName: String, email: String, password: String, userName: String) {
      
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)!
        let newUser = NSManagedObject(entity: entity, insertInto: managedContext)
        
        newUser.setValue(firstName, forKey: "firstName")
        newUser.setValue(lastName, forKey: "lastName")
        newUser.setValue(email, forKey: "email")
        newUser.setValue(password, forKey: "password")
        newUser.setValue(userName, forKey: "userName")
        
        
        do{
            try managedContext.save()
            
        }catch _ as NSError{
            print("sorry bud")
        }
        
        
    }
   
        
    
    func get(indentifier: String) -> String? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // will predicate the users so to return One user
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "email = %@", indentifier)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
        
        do{
            let result = try managedContext?.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                return (data.value(forKey: "Email") as! String)
            }
        } catch {
            print( "failed" )
        }
        return "User Not Found"
    }
    
    
    func Delete(identifier: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        fetchRequest.predicate = NSPredicate(format: "email = %@", identifier)
        
        do{
            let test = try managedContext?.fetch(fetchRequest)
            
            let objectDeleted = test![0] as! NSManagedObject
            managedContext?.delete(objectDeleted)
            do{
                try managedContext?.save()
            }catch{
                print(error)
            }
        }catch {
            print(error)
        }
        
    }
        
    }

