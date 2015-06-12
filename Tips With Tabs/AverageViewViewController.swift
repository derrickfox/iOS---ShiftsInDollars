//
//  AverageViewViewController.swift
//  Tips With Tabs
//
//  Created by Derrick Fox on 5/21/15.
//  Copyright (c) 2015 Derrick Fox. All rights reserved.
//

import UIKit
import CoreData

class AverageViewViewController: UIViewController {

    @IBOutlet weak var averageLunchLabel: UILabel!
    @IBOutlet weak var averageDinnerLabel: UILabel!
    @IBOutlet weak var averagePartyLabel: UILabel!
    
    @IBAction func loadButton(sender: AnyObject) {
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let requestLunch = NSFetchRequest(entityName: "Shift")
        requestLunch.returnsObjectsAsFaults = false
        
        requestLunch.predicate = NSPredicate(format: "shiftType = %@", "Lunch")
        
        var lunch:NSArray = context.executeFetchRequest(requestLunch, error: nil)!
        
        if lunch.count > 0 {
            println("\(lunch.count) found!")
        }else{
            println("No results found")
        }
        
        var total = 0.0
        for shift in lunch {
            var amount = 0.0
            total = (shift as! Shift).money + total
        }
        var  aveLunch : Double = Double(total) / Double(lunch.count)
        var totalLunchString:String = String(format:"%f", aveLunch)
        averageLunchLabel.text = totalLunchString
        println(totalLunchString)
        //////////////////////////////////////////////////////////////////////
        let requestDinner = NSFetchRequest(entityName: "Shift")
        requestLunch.returnsObjectsAsFaults = false
        
        requestDinner.predicate = NSPredicate(format: "shiftType = %@", "Dinner")
        
        var dinners:NSArray = context.executeFetchRequest(requestDinner, error: nil)!
        
        if dinners.count > 0 {
            println("\(dinners.count) found!")
        }else{
            println("No results found")
        }
        
        var totaldinners = 0.0
        for shift in dinners {
            var amount = 0.0
            totaldinners = (shift as! Shift).money + totaldinners
        }
        var  aveDinners : Double = Double(totaldinners) / Double(dinners.count)
        var totalDinnerString:String = String(format:"%f", aveDinners)
        averageDinnerLabel.text = totalDinnerString
        println(totalDinnerString)
        ///////////////////////////////////////////////////////////////////////
        let requestParty = NSFetchRequest(entityName: "Shift")
        requestParty.returnsObjectsAsFaults = false
        
        requestParty.predicate = NSPredicate(format: "shiftType = %@", "Party")
        
        var party:NSArray = context.executeFetchRequest(requestParty, error: nil)!
        
        if party.count > 0 {
            println("\(party.count) found!")
        }else{
            println("No results found")
        }
        
        var totalParty = 0.0
        for shift in party {
            var amount = 0.0
            totalParty = (shift as! Shift).money + totalParty
        }
        var  aveParty : Double = Double(totalParty) / Double(party.count)
        var totalPartyString:String = String(format:"%f", aveParty)
        averagePartyLabel.text = totalPartyString
        println(totalPartyString)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
