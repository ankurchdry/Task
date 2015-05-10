//
//  ShowTaskViewController.swift
//  Taskit
//
//  Created by ankurchdry on 3/3/15.
//  Copyright (c) 2015 ankurchdry. All rights reserved.
//

import UIKit

class ShowTaskViewController: UIViewController {
    
    var detailTaskModel: TaskModel!


    @IBOutlet weak var detailsSubTask: UITextField!
    @IBOutlet weak var detailsTask: UITextField!
    
    @IBOutlet weak var detailsDate: UIDatePicker!
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func doneButtonItemPressed(sender: UIBarButtonItem) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        detailTaskModel.task = detailsTask.text
        detailTaskModel.subTask = detailsSubTask.text
        detailTaskModel.date = detailsDate.date
        detailTaskModel.completed = detailTaskModel.completed
        appDelegate.saveContext()
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailsTask.text = detailTaskModel.task
        
        self.detailsSubTask.text = detailTaskModel.subTask
        
        self.detailsDate.date = detailTaskModel.date
        

       // println(detailTaskModel.subTask)       // Do any additional setup after loading the view.
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
