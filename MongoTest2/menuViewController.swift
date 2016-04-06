//
//  menuViewController.swift
//  MongoTest2
//
//  Created by Anya Gerasimchuk on 3/24/16.
//  Copyright © 2016 Anya Gerasimchuk. All rights reserved.
//

import Foundation
import UIKit
import SwiftMongoDB


class menuViewController: UITableViewController{
    
    func mongoDBTest(){
    print("In mogoDBTest")
    let mongodb = MongoDB(database: "test")
    
    if mongodb.connectionStatus != .Success {
    print("connection was not successful")
    return
    }
    
    
    let subjects = MongoCollection(name: "subjects").find()
    //mongodb.registerCollection(subjects)
        
    print("This is my subjects : \(subjects)")
    
    //print("registered collection")
    // method #1 (basic)
   
    
    
    
    // Using Swift 2 error handling model (methods can throw erorrs)
    do {
    
    
      
    } catch {
    print(error)
    }
    }
    
}
