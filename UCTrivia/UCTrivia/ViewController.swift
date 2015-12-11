//
//  ViewController.swift
//  UCTrivia
//
//  Created by Mitchell J Meyer on 12/10/15.
//  Copyright (c) 2015 Mitchell J Meyer. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignIn(sender: AnyObject) {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        
        //fetch user based on username
        var request = NSFetchRequest(entityName: "Player")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "userName = %@", userName.text)
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if (results.count > 0)
        {
            println(results[0])
            performSegueWithIdentifier("startSegue", sender: nil)
        }else{
            var newPlayer: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Player", inManagedObjectContext: context)
            newPlayer.setValue(userName.text, forKey: "userName")
            newPlayer.setValue(0, forKey: "highScore")
            context.save(nil)
            performSegueWithIdentifier("startSegue", sender: nil)
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var questionsVC: QuestionsViewController = segue.destinationViewController as! QuestionsViewController
        
        questionsVC.recievedUserName = userName.text
    }

}

