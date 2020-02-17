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
    var errorClear = false
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var history: UILabel!
    @IBAction func addnumber(sender: UIButton) {
        errorClearFunc()
        if let text = display.text, let digit = sender.currentTitle {
            if(text.count>=13){return}
            if (digit.elementsEqual(".")) {
                if (text.last=="." || text.isEmpty || text.contains(".")){
                    return
                } else {
                    display.text! += digit
                }
            } else{
                display.text! += digit
            }
        }
        
    }
    var firstval : Float = 0
    var secondval : Float = 0
    var resultat : Float = 0
    var act : String = "0"
    
    @IBAction func operation(sender: UIButton) {
        errorClearFunc()
        if let text = display.text,let digit = sender.currentTitle {
            if text.isEmpty && digit.isEmpty {return}
            if let  num  = Float(text){
                firstval = num
                act = digit
                display.text =  ""
            }
        }
    }
    @IBAction func clearact(sender: UIButton) {
        errorClearFunc()
        firstval = 0
        secondval = 0
        act = ""
        if display.text != nil {
            display.text =  ""
        }
    }
    @IBAction func change(sender: UIButton) {
        errorClearFunc()
        if var text = display.text {
            if (text.isEmpty || text.last=="."){return}
            if(text.first=="-"){
                text.removeFirst();
            }
            else{
                text="-"+text
            }
            display.text = text
        }
    }
    
    @IBAction func ravnoact(sender: UIButton) {
        errorClearFunc()
        if let text = display.text {
        if text.isEmpty{return}
            if let num = Float(text){
        secondval=num
        switch act {
        case "+":
            resultat = firstval + secondval
        case "-":
            resultat = firstval - secondval
        case "*":
            resultat = firstval * secondval
        case "/":
            if(secondval==0){display.text="Not divide by zero";errorClear = true;return}
            resultat = firstval / secondval
        case "%":
            resultat = firstval.truncatingRemainder(dividingBy: secondval)
        default:
            return
        }
        if history.text != nil {
        history.text = "\(firstval)\(act)\(secondval)"
        }
        display.text = String(resultat)
        act=""
            }
        }
    }
    func errorClearFunc(){
        if(errorClear){
            errorClear = false
            if(display.text != nil){
                display.text=""
            }
        }
    }
    @IBAction func back(sender: UIButton) {
        if(!act.isEmpty){act=""}
        else{
            if let text = display.text{
                if(text.isEmpty){return}
                else{
                    display.text?.removeLast()
                }
            }
        }
    }
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
