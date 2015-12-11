//
//  ScoreScreenViewController.swift
//  UCTrivia
//
//  Created by Mitchell J Meyer on 12/10/15.
//  Copyright (c) 2015 Mitchell J Meyer. All rights reserved.
//

import UIKit
import CoreData

class ScoreScreenViewController: UIViewController {

    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var currentHighScore: UILabel!
    @IBOutlet weak var playerName: UILabel!
    var userName: String = ""
    var finalScore: Int = 0
    override func viewDidLoad() {
        currentScore.text = finalScore.description
        playerName.text = userName
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        //fetch user based on username
        var request = NSFetchRequest(entityName: "Player")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "userName = %@", userName)
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        //TODO: find out how to retrieve the Player from core data using the userName variable and check to see if there high score is greater then the finalScore. If it is greater change the high score of that Player in Core Data
        
//        if (results.count > 0)
//        {
//            currentHighScore.text = results[0]
//            println("This is the high score" + results[0].)
//        }else{
//            highScore.text = String(0)
//        }

        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
