//
//  CRUD.swift
//  TableView-Grouped
//
//  Created by Marni Anuradha on 1/2/20.
//  Copyright © 2020 Marni Anuradha. All rights reserved.
//

import UIKit
import CoreData

struct CRUD
{
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    
    //function for inserting values
    static func insertValue(entitiyName:String,key1:String,value1:String,key2:String,value2:String,key3:String,value3:Int16,key4:String, value4:String)
    {
        guard let entity = NSEntityDescription.entity(forEntityName: entitiyName, in: context) else
        {
            print("Error In Entity Description")
            return
            
        }
        
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        
        managedObject.setValue(value1, forKey: key1)
        
        managedObject.setValue(value2, forKey: key2)
        
        managedObject.setValue(value3, forKey: key3)
        
        managedObject.setValue(value4, forKey: key4)
    
        
        do
        {
            try context.save()
            
            print("Data Inserted Sucessfully")
        }
        catch
        {
            print("Catch Error : Failed To Insert Data")
        }
        
    }
    
    
        //function for fetching values
    static func fetchData(entityName:String) -> [NSManagedObject]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        var data:[NSManagedObject]!
        do
        {
            data = try context.fetch(fetchRequest) as! [NSManagedObject]
        }
        catch
        {
            print("Catch Error : Failed To Fetch Data")
        }
        
        return data
        
    }
    
        //function for deleting values
    static func deleteData(entityName:String,deleteBasedOnColumn columnName: String,value:String?)
    {
        let data = CRUD.fetchData(entityName: entityName)
        
        
        for x in data as! [NSManagedObject]
        {
            if(x.value(forKey: columnName) as? String == value)
            {
                context.delete(x)
            }
        }
        
        
        do
        {
            try context.save()
        }
        catch
        {
            print("Failed To Delete")
        }
    }
    
    
    
    
    
    
    
    
    
    static func deleteAll(entityName:String)
    {
        let data = CRUD.fetchData(entityName: entityName)
        
        
        for x in data as! [NSManagedObject]
        {
            
                context.delete(x)
          
        }
        
        
        do
        {
            try context.save()
        }
        catch
        {
            print("Failed To Delete Database")
        }
    }
    
    
//
//    static func updateData(entityName:String,referenceColumnName:String, referenceColumnValue:Any,referenceColumnValueDataType:String,desiredColumnName:String,desiredColumnValue:Any,desiredColumnValueDataType:String)
//    {
//        let data = CRUD.fetchData(entityName: entityName)
//
//
//        for x in data as! [NSManagedObject]
//        {
//
//        }
//
//
//        do
//        {
//            try context.save()
//        }
//        catch
//        {
//            print("Failed To Delete")
//        }
//
//
//        enum dataType
//        {
//            case str
//            case int16
//            case int32
//            case int64
//            case data
//
//
//        }
//    }
//
    
    static func updateData(entityName:String,updateBasedOnColumn columnName:String,updateBasedOnColumnValue columnValue:Any, columnValueDataType:dataType,targetColumnName:String, targetColumnValue: Any,targetColumnValueDataType:dataType)
       {
           
           let data = fetchData(entityName: entityName)
           
           var referenceColumnValue_Int16:Int16!
           var referenceColumnValue_Int32:Int32!
           var referenceColumnValue_Int64:Int64!
           var referenceColumnValue_String:String!
           var referenceColumnValue_Float:Float!
           var referenceColumnValue_Double:Double!
           var referenceColumnValue_Bool:Bool!
           
           switch columnValueDataType
           {
               
           case .int16:
               referenceColumnValue_Int16 = columnValue as! Int16
           case .int32:
               
               referenceColumnValue_Int32 = columnValue as! Int32
           case .int64:
               
               referenceColumnValue_Int64 = columnValue as! Int64
           case .string:
               
               referenceColumnValue_String = columnValue as! String
           case .float:
               
               referenceColumnValue_Float = columnValue as! Float
           case .double:
               
               referenceColumnValue_Double = columnValue as! Double
           case .bool:
               
               referenceColumnValue_Bool = columnValue as! Bool
               
           }
    
    
    
}


enum dataType:String
{
    case int16
       
    case int32
       
    case int64
        
        
    case string
        
        
    case float
        
        
    case double
        
        
    case bool
        
}

}
