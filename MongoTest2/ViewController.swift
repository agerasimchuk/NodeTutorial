//
//  ViewController.swift
//  MongoTest2
//
//  Created by Anya Gerasimchuk on 3/21/16.
//  Copyright © 2016 Anya Gerasimchuk. All rights reserved.
//

import UIKit
import SwiftMongoDB


class ViewController: UIViewController {

    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mogoDBTest()
        
        //btnOne.setTitle("ahaaaa", forState: UIControlState.Normal)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mogoDBTest(){
        print("In mogoDBTest")
        let mongodb = MongoDB(database: "test")
        
        if mongodb.connectionStatus != .Success {
            print("connection was not successful")
            return
        }
        
        
        let subjects = MongoCollection(name: "subjects")
        mongodb.registerCollection(subjects)
        
        print("registered collection")
        // method #1 (basic)
        let subject1 = MongoDocument(
            data: [
                "name" : "Dan",
                "age": 15,
                "friends": [
                    "Billy",
                    "Bob",
                    "Joe"
                ],
                "location": [
                    "city":"San Francisco"]
            ]
        )
        
        // method #2 (cleaner, reusable)
        struct Menu: MongoObject {
            var name = "App Menu"
            var age = 15
            var items = [
                "Menu 1",
                "Menu 2",
                "Menu 3"
            ]
            var location = [
                "city" : "Evendale"
            ]
        }
        
        let subject = Menu()
        let subject2 = subject.Document()
        
        print("inserted documents")
        
        // Using Swift 2 error handling model (methods can throw erorrs)
        do {
            
            try subjects.insert(subject1) // insert dan
            try subjects.insert(subject2) // insert billy
            
            try subjects.remove(["_id": subject1.id!]) // remove dan
            
            try subjects.update(query: ["name":"Dan"], document: subject2, type: .Basic) // basic = single override (non-additive)
            
            let results = try subjects.find(["age": 15])
            
            print("MY results is successful?: \(results)")
            
            //RETRIEVE ALL SUBJECTS FROM COLLECTION
            print("And subject are:\(subject.items[0])")
            let firstItem = subject.items[0]
            let secondItem = subject.items[1]
            let thirdItem = subject.items[2]
            btnOne.setTitle(firstItem, forState: UIControlState.Normal)
            btnThree.setTitle(thirdItem, forState: UIControlState.Normal)
            btnTwo.setTitle(secondItem, forState: UIControlState.Normal)
            
            print("And subject.Document is: \(subject2)")
            
            
            
        } catch {
            print(error)
        }
    }
    


}

