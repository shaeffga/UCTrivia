//
//  QuestionsViewController.swift
//  UCTrivia
//
//  Created by Mitchell J Meyer on 12/10/15.
//  Copyright (c) 2015 Mitchell J Meyer. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var userNamelbl: UILabel!


    var correctAnswer = String();
    var playerScore = 0;
    var currentQuestion = 1;
    var recievedUserName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        userNamelbl.text = "User Name: " + recievedUserName
        // Call method to start quiz
        QuestionGenerator()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnOneAction(sender: AnyObject) {
        if (correctAnswer == "1")
        {
            playerScore = playerScore + 200
        }
        NSLog(playerScore.description)
        currentQuestion += 1
        QuestionGenerator()
        
        if (currentQuestion > 4)
        {
            //The Questions are over
            performSegueWithIdentifier("test", sender: nil)
        }
    }

    @IBAction func btnTwoAction(sender: AnyObject) {
        if (correctAnswer == "2")
        {
            playerScore = playerScore + 200
        }
        NSLog(playerScore.description)
        currentQuestion += 1
        QuestionGenerator()
        if (currentQuestion > 4)
        {
            //The Questions are over
            performSegueWithIdentifier("test", sender: nil)
        }

    }

    @IBAction func btnThreeAction(sender: AnyObject) {
        if (correctAnswer == "3")
        {
            playerScore += 200
        }
        NSLog(playerScore.description)
        currentQuestion += 1
        QuestionGenerator()
        if (currentQuestion > 4)
        {
            //The Questions are over
            performSegueWithIdentifier("test", sender: nil)
        }

    }
    @IBAction func btnFourAction(sender: AnyObject) {
        if (correctAnswer == "4")
        {
            playerScore += 200
        }
        NSLog(playerScore.description)
        currentQuestion += 1
        QuestionGenerator()
        if (currentQuestion > 4)
        {
            //The Questions are over
            performSegueWithIdentifier("test", sender: nil)
        }

    }
    func QuestionGenerator(){
        
        
        switch(currentQuestion){
        case 1:
            questionLabel.text = "Which popular television family was conceived by a UC alumnus? "
            btnOne.setTitle("The Waltons", forState: UIControlState.Normal)
            btnTwo.setTitle("The Bradys", forState: UIControlState.Normal)
            btnThree.setTitle("The Simpsons", forState: UIControlState.Normal)
            btnFour.setTitle("The Munsters", forState: UIControlState.Normal)
            correctAnswer = "1"

            break
        case 2:
            
            questionLabel.text = "Who the president of the University of Cincinnati?"
            btnOne.setTitle("Obama", forState: UIControlState.Normal)
            btnTwo.setTitle("George Bush", forState: UIControlState.Normal)
            btnThree.setTitle("Santa Ono", forState: UIControlState.Normal)
            btnFour.setTitle("Shia LaBeouf", forState: UIControlState.Normal)
            correctAnswer = "3"
            break
        case 3:
            
            questionLabel.text = "How many bars are on UC's campus?"
            btnOne.setTitle("One", forState: UIControlState.Normal)
            btnTwo.setTitle("Two", forState: UIControlState.Normal)
            btnThree.setTitle("Five", forState: UIControlState.Normal)
            btnFour.setTitle("Elevan", forState: UIControlState.Normal)
            correctAnswer = "1"
            break
        case 4:
            
            questionLabel.text = "What are the names of the two stone lions?"
            btnOne.setTitle("Mick and Mack", forState: UIControlState.Normal)
            btnTwo.setTitle("Tom and Jerry", forState: UIControlState.Normal)
            btnThree.setTitle("Bennie and The Jets", forState: UIControlState.Normal)
            btnFour.setTitle("Frick and Frack", forState: UIControlState.Normal)
            correctAnswer = "1"

            break
            
            
            
        default:
            break
            
        }
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var scoreScreenVC: ScoreScreenViewController = segue.destinationViewController as! ScoreScreenViewController
        
        scoreScreenVC.userName = self.recievedUserName
        scoreScreenVC.finalScore = self.playerScore
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
