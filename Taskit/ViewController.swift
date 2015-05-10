//
//  ViewController.swift
//  Taskit
//
//  Created by ankurchdry on 3/2/15.
//  Copyright (c) 2015 ankurchdry. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
   
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    var fetchResultController: NSFetchedResultsController = NSFetchedResultsController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchResultController = getFetchResultController()
        fetchResultController.delegate = self
        fetchResultController.performFetch(nil)
        
        //tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            
            let detailVc:ShowTaskViewController = segue.destinationViewController as! ShowTaskViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = fetchResultController.objectAtIndexPath(indexPath!) as! TaskModel
            
            detailVc.detailTaskModel = thisTask
        }
            
        else if segue.identifier == "addTaskDetails" {
            
            let addTaskVc:AddTaskViewController = segue.destinationViewController as! AddTaskViewController

        }
        
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
     self.performSegueWithIdentifier("addTaskDetails", sender: self)
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchResultController.sections!.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let thisTask = fetchResultController.objectAtIndexPath(indexPath) as! TaskModel
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }


    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = fetchResultController.objectAtIndexPath(indexPath) as! TaskModel
        if indexPath.section == 0 {
            thisTask.completed = true
        }
        else {
            thisTask.completed = false
        }
        (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    // Helper
    
    func taskFetchRequest() -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: "TaskModel")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        
        let completedSortDescriptor = NSSortDescriptor(key: "completed", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor, completedSortDescriptor]
        
        return fetchRequest
        
    }
    
    func getFetchResultController() -> NSFetchedResultsController {
        
        fetchResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
        
        return fetchResultController
        
    }
    
    
}

