//
//  AddTaskViewController.swift
//  Taskit
//
//  Created by ankurchdry on 3/14/15.
//  Copyright (c) 2015 ankurchdry. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    

    
    @IBOutlet weak var taskTextField: UITextField!
    
    @IBOutlet weak var subTaskTextField: UITextField!
    
    @IBOutlet weak var dateField: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func saveTaskButtonPressed(sender: UIButton) {
       
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let managedObjectContext = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        
        task.task = taskTextField.text
        task.subTask = subTaskTextField.text
        task.date = dateField.date
        task.completed = false
        
        appDelegate.saveContext()
       
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        
        var result: NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        
        for res in result {
            
            println(res)
        }
       
     self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    


    

}
