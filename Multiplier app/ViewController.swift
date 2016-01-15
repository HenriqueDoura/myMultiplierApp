//
//  ViewController.swift
//  Multiplier app
//
//  Created by Henrique Dev on 15/01/16.
//  Copyright © 2016 Henrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Properties
    var multiple = 0
    var runningSum = 0
    let MAX_SUM = 50
    var newSum: Int = 0

    //variables START VIEW
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var numberTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    //variables ADD VIEW
    @IBOutlet weak var multiplesLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    //FUNCS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    func startGame() -> Bool {
        if numberTxt.text != nil && numberTxt.text != "" {
            hideStartView()
            multiplesLabel.text = "Press Add to add!"
            return true
        } else {
            return false
        }
    }
    
    func resetGame() {
        showStartView()
        numberTxt.text = ""
        multiplesLabel.text = "Press Add to add!"
        multiple = 0
        runningSum = 0
    }

    func hideStartView() {
        logo.hidden           = true
        numberTxt.hidden      = true
        playBtn.hidden        = true

        multiplesLabel.hidden = false
        addBtn.hidden         = false
    }

    func showStartView() {
        logo.hidden           = false
        numberTxt.hidden      = false
        playBtn.hidden        = false
        
        multiplesLabel.hidden = true
        addBtn.hidden         = true
    }
    
    func findMultiplier() {
        if startGame() {
            
        multiple = Int(numberTxt.text!)!
        newSum = runningSum + multiple
        changeLabel(runningSum, mul: multiple, newSum: newSum)
        runningSum += multiple
            
        }
    }
    @IBAction func playBtnPressed(sender: AnyObject) {
        startGame()
        findMultiplier()
    }
    
    @IBAction func addBtnPressed(sender: AnyObject) {
        findMultiplier()
    }
    
    func changeLabel(oldSum: Int, mul: Int, newSum: Int) {
        if newSum >= MAX_SUM {
           resetGame()
        }
        multiplesLabel.text = "\(oldSum) + \(mul) = \(newSum)"
    }
    //teclado/keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

