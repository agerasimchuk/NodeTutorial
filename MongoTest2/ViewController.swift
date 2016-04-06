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
        //print("In mogoDBTest")
        let mongodb = MongoDB(database: "test")

        if mongodb.connectionStatus != .Success {
            print("connection was not successful")
            return
        }
        
        //let DocCollection = MongoCollection(name: "subjects")

        
        let subjects = MongoCollection(name: "subjects")

        
        mongodb.registerCollection(subjects)
        
        let results =  subjects.find().successValue!
        
        /*
        for (index,value) in subjects.find().successValue!.enumerate(){
            debugPrint(value)
        }
*/
        
        
        for testSubject in results {
            //print(testSubject.data)
            print(testSubject.data)
        }
        //struct Object : MongoObject{}
        
        //let cursor = try subjects.find()
        //let testSubjects = try cursor.all()
        
        //let thisResult = subjects.find(id: "5702876edafb6e916766db6b")
       /*
        do{
            let results: [SwiftMongoDB.MongoDocument] = try subjects.find(["type" : "menuitem"])
            print("RESULTS: \(results)")
            for testResult: MongoDocument in results{
               print("HUY")
            }
            }catch{
                
            }
        */
        
        //let results = subjects.find().isSuccessful.description
        
        //let results = try subjects.find().successValue?.indexOf(index)

      /*
        for (index, value) in (subjects.find().successValue?.enumerate())!{
            //print()
            print("THIS IS INDEX: \(index)")
            
        }
*/
        
        //print("registered collection")
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
        //let subject3 = subjects.
        //print("inserted documents")
        
        // Using Swift 2 error handling model (methods can throw erorrs)
        /*
        do {
            
            
            //try subjects.insert(subject1) // insert dan
            //try subjects.insert(subject2) // insert App Menu
            
            try subjects.remove(["_id": subject1.id!]) // remove dan
            
            try subjects.update(query: ["name":"Dan"], document: subject2, type: .Basic) // basic = single override (non-additive)
            
            
            
            
            //RETRIEVE ALL SUBJECTS FROM COLLECTION
            //print("And subject are:\(subject.items[0])")
            let firstItem = subject.items[0]
            let secondItem = subject.items[1]
            let thirdItem = subject.items[2]
            btnOne.setTitle(firstItem, forState: UIControlState.Normal)
            btnThree.setTitle(thirdItem, forState: UIControlState.Normal)
            btnTwo.setTitle(secondItem, forState: UIControlState.Normal)
            
            //print("And subject.Document is: \(subject2)")
            
            
            
        } catch {
            print(error)
        }*/
    }

}

