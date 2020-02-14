//
//  ViewController.swift
//  Test
//
//  Created by TrackEnsure on 2020-02-13.
//  Copyright © 2020 Eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var display: UILabel!
    var first :Bool=false
    @IBAction func addnumber(sender: UIButton) {
        if(!first){
            display.text!=""
            first=true
        }
        if(sender.currentTitle==nil || display.text==nil){
            return
        }
        let digit = sender.currentTitle
            if(display.text!=="" && digit == "."){
                return
            }
            display.text! += digit!
    }
    var firstval : Float = 0
    var secondval : Float = 0
    var resultat : Float = 0
    var act : String = "0"
    
    @IBAction func plusact(sender: UIButton) {
        if(display.text! == "" || display.text==nil){
            return
        }
        firstval = Float(display.text!)!
        act = "+"
        display.text =  ""
    }
    
    @IBAction func minusact(sender: UIButton) {
        if(!first){
            display.text!=""
            first=true
        }
        /*if display.text?.isEmpty ?? true {
            display.text!
        }
        
        if let text = display.text, !text.isEmpty {
            text
        }
        guard let text = display.text else {print("Error getting value") ; return}
        text
        
        if display.text != nil, display.text!.isEmpty {
            display.text!
        }*/
        if(display.text! == "" || display.text==nil){
            let digit  = sender.currentTitle
            display.text! += digit!
            return
        }
        firstval = Float(display.text!)!
        act = "-"
        display.text =  ""
    }
    
    @IBAction func umnact(sender: UIButton) {
        if(display.text! == "" || display.text==nil){
            return
        }
        firstval = Float(display.text!)!
        act = "*"
        display.text =  ""
    }
    
    @IBAction func delit(sender: UIButton) {
        if(display.text! == "" || display.text==nil){
            return
        }
        firstval = Float(display.text!)!
        act = "/"
        display.text =  ""
    }
    @IBAction func percentOfDiv(sender: UIButton) {
        if(display.text! == "" || display.text==nil){
            return
        }
        firstval = Float(display.text!)!
        act = "%"
        display.text =  ""
    }
    @IBAction func clearact(sender: UIButton) {
        firstval = 0
        secondval = 0
        act = ""
        if(display.text==nil){
            return
        }
        display.text =  "0"
    }
    
    @IBAction func ravnoact(sender: UIButton) {
        if(display.text! == "" || display.text==nil){
            return
        }
        secondval = Float(display.text!)!
        switch act {
        case "+":
            resultat = firstval + secondval
        case "-":
            resultat = firstval - secondval
        case "*":
            resultat = firstval * secondval
        case "/":
            resultat = firstval / secondval
        case "%":
            resultat = firstval.truncatingRemainder(dividingBy: secondval)
        default:
            return
        }
        display.text = String(resultat)
        act=""
        
    }
}

