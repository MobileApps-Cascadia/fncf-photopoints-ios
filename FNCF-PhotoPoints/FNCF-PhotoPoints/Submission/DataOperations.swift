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

protocol SubmissionOps {
    
    
    func addStream(newStream: StreamOBJ )
    func addPlant(newPlant: PlantOBJ )
    
    func getStream(indentifier: Int) -> Int
    func getPlant(indentifier: Int) -> Int
    
     // will implement these later
    func ModifyStream(identifier: Int, stream: StreamOBJ) -> Int
    func ModifyPlant(identifier: Int, plant: PlantOBJ) -> Int
   
    //func addImages(username: String, images: UIImage)
    
    
    
    func DeleteStream(identifier: Int)
    func DeletePlant(identifier: Int)
}

public class DataOperations: SubmissionOps{
    
    func ModifyStream(identifier: Int, stream: StreamOBJ) -> Int {
     
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StreamData")
        
        fetchRequest.predicate = NSPredicate(format: "streamid = %i", identifier)
        
        do{
            let test = try managedContext?.fetch(fetchRequest)
            
            let UpdatedUser = test![0] as! NSManagedObject
            
            UpdatedUser.setValue(stream.Date, forKey: "date")
            UpdatedUser.setValue(stream.StreamHeight, forKey: "streamheight")
            UpdatedUser.setValue(stream.StreamID, forKey: "streamid")
            UpdatedUser.setValue(stream.Weather, forKey: "weather")
            
            
            
            do{
                try managedContext?.save()
                return UpdatedUser.value(forKey: "streamid") as! Int
            }
            catch{
                print("error")
            }
        }
        catch{
            print("error")
        }
        return -1
    }
    
    func ModifyPlant(identifier: Int, plant: PlantOBJ) -> Int {
       
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlantData")
        
        fetchRequest.predicate = NSPredicate(format: "plantid = %i", identifier)
        
        do{
            let test = try managedContext?.fetch(fetchRequest)
            
            let UpdatedUser = test![0] as! NSManagedObject
            
            UpdatedUser.setValue(plant.Date, forKey: "date")
            UpdatedUser.setValue(plant.Comments, forKey: "comments")
            UpdatedUser.setValue(plant.Foliage, forKey: "foliage")
            UpdatedUser.setValue(plant.Fruit, forKey: "fruit")
            UpdatedUser.setValue(plant.PlantID, forKey: "plantid")
            
            
            
            do{
                try managedContext?.save()
                return UpdatedUser.value(forKey: "plantid") as! Int
            }
            catch{
                print("error")
            }
        }
        catch{
            print("error")
        }
        return -1
    }
    

    
   
    

    
    func addStream(newStream: StreamOBJ) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "StreamData", in: managedContext)!
        let newUser = NSManagedObject(entity: entity, insertInto: managedContext)
        
        newUser.setValue(newStream.Date, forKey: "date")
        newUser.setValue(newStream.StreamHeight, forKey: "streamheight")
        newUser.setValue(newStream.StreamID, forKey: "streamid")
        newUser.setValue(newStream.Weather, forKey: "weather")
      
        
        
        do{
            try managedContext.save()
            
        }catch _ as NSError{
            print("sorry bud")
        }
        
        
    }
    
    func addPlant(newPlant: PlantOBJ) {
      
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "PlantData", in: managedContext)!
        let newUser = NSManagedObject(entity: entity, insertInto: managedContext)
        
        newUser.setValue(newPlant.Date, forKey: "date")
        newUser.setValue(newPlant.Comments, forKey: "comments")
        newUser.setValue(newPlant.Foliage, forKey: "foliage")
        newUser.setValue(newPlant.Fruit, forKey: "fruit")
        newUser.setValue(newPlant.PlantID, forKey: "plantid")
    
        
        do{
            try managedContext.save()
            
        }catch _ as NSError{
            print("sorry bud")
        }
        
    }
    
    
    func getStream(indentifier: Int) -> Int {
        
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let managedContext = appDelegate?.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StreamData")
            
            // will predicate the users so to return One user
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "streamid = %i", indentifier)
            fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "streamid", ascending: false)]
            
            do{
                let result = try managedContext?.fetch(fetchRequest)
                for data in result as! [NSManagedObject]{
                    return (data.value(forKey: "streamid") as! Int)
                }
            } catch {
                print( "failed" )
            }
            return -1
        }
        
    
    
    func getPlant(indentifier: Int) -> Int {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlantData")
        
        // will predicate the users so to return One user
        fetchRequest.fetchLimit = 1
        // using the plant id we are able to set the predicate %i where i is the Int
        fetchRequest.predicate = NSPredicate(format: "plantid = %i", indentifier)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "plantid", ascending: false)]
        
        do{
            let result = try managedContext?.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                return (data.value(forKey: "plantid") as! Int)
            }
        } catch {
            print( "failed" )
        }
        return -1
    
    }
    
    
    func DeleteStream(identifier: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "StreamData")
        
        fetchRequest.predicate = NSPredicate(format: "streamid = %i", identifier)
        
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            let objectDeleted = test[0] as! NSManagedObject
            managedContext.delete(objectDeleted)
            do{
                try managedContext.save()
            }catch{
                print(error)
            }
        }catch {
            print(error)
        }
    }
    
    func DeletePlant(identifier: Int) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PlantData")
        
        fetchRequest.predicate = NSPredicate(format: "plantid = %i", identifier)
        
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
        }    }

    
}

