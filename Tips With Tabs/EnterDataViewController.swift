//
//  EnterDataViewController.swift
//  Tips With Tabs
//
//  Created by Derrick Fox on 4/21/15.
//  Copyright (c) 2015 Derrick Fox. All rights reserved.
//

import UIKit
import CoreData

class EnterDataViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var shiftPicker: UIPickerView!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var shiftDollarsString: UITextField!
    weak var date: NSDate!
    
    var day = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var shift = ["Lunch", "Dinner", "Party"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //shiftDollarsString.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        shiftDollarsString.resignFirstResponder()
        self.view.endEditing(true)
    }
    
    
    @IBAction func logButton(sender: AnyObject) {
        
        println(shiftDollarsString.text)
        println(shiftPicker.selectedRowInComponent(0))
        printDate(datePicker.date)
        printShift()
        ///////////////////////////////////////////////////
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("Shift", inManagedObjectContext: contxt)
        
        var newItem = Shift(entity: en!, insertIntoManagedObjectContext: contxt)
            
        newItem.money = (shiftDollarsString.text as NSString).doubleValue
        newItem.date = printDate(datePicker.date) as NSDate
        newItem.shiftType = printShift() as String
            
        println(newItem.money)
        println(newItem)
        
        
        contxt.save(nil)
        
        //self.navigationController?.popToRootViewControllerAnimated(true)
        
        println("Button pressed")

    }
    
    func printDate(date:NSDate) -> NSDate{
        let dateFormatter = NSDateFormatter()//3
        
        var theDateFormat = NSDateFormatterStyle.ShortStyle //5
        let theTimeFormat = NSDateFormatterStyle.ShortStyle//6
        
        dateFormatter.dateStyle = theDateFormat//8
        dateFormatter.timeStyle = theTimeFormat//9
        
        println("Today is: " + dateFormatter.stringFromDate(date))//11
        return date
    }
    
    func printShift() -> NSString{
        var shifty = shiftPicker.selectedRowInComponent(0)
        println(shift[shifty])
        return shift[shifty]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shift.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return shift[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var itemSelected = shift[row]
        
        let myDate = datePicker.date
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        let dateString = formatter.stringFromDate(myDate)
        
        selectedLabel.text = dateString
    }

    /*
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
