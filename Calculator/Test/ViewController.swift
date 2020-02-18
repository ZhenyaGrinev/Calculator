//
//  ViewController.swift
//  Test
//
//  Created by TrackEnsure on 2020-02-13.
//  Copyright © 2020 Eugene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var history: UILabel!
    @IBOutlet weak var stackHistory: UIStackView!
    
    enum Operation : String {
        case plus = "+"
        case minus = "-"
        case mult = "*"
        case div = "/"
        case remaind = "%"
        case point = "."
    }
    enum Numbers : Int {
        case zero = 0
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
    }
    var firstval : Float?
    var secondval : Float?
    var resultat : Float?
    var act : Operation?
    var number : Numbers?
    var errorClear = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addnumber(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text {
            if let num = Numbers.init(rawValue:sender.tag){
            if(text.count>=13){return}
                displayLabel.text! += String(num.rawValue)
            }
        }
    }
    @IBAction func addpoint(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text {
            if(text.count>=13){return}
                if (text.last=="." || text.isEmpty || text.contains(".")){
                    return
                } else {
                    displayLabel.text! += Operation.point.rawValue
                }
        }
        
    }
    @IBAction func operation(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text,let digit = sender.currentTitle {
            if text.isEmpty && digit.isEmpty {return}
            if let  num  = Float(text){
                firstval = num
                act = Operation.init(rawValue: digit) ?? nil
                displayLabel.text =  String("")
            }
        }
    }
    @IBAction func clearact(sender: UIButton) {
        errorClearFunc()
        firstval = nil
        secondval = nil
        act = nil
        if displayLabel.text != nil && history.text != nil{
            displayLabel.text = String("")
            history.text =  String("")
        }
    }
    @IBAction func change(sender: UIButton) {
        errorClearFunc()
        if var text = displayLabel.text {
            if (text.isEmpty || text.last=="."){return}
            if(text.first=="-"){
                text.removeFirst();
            }
            else{
                text="-"+text
            }
            displayLabel.text = text
        }
    }
    
    @IBAction func ravnoact(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text {
        if text.isEmpty{return}
            if let tx = Float(text){
            secondval=tx
            if let num = firstval,let num2 = secondval{
                if let operat = act{
        switch operat {
        case .plus:
            resultat = num + num2
        case .minus:
            resultat = num - num2
        case .mult:
            resultat = num * num2
        case .div:
            if(secondval==0){displayLabel.text="Not divide by zero";errorClear = true;return}
            resultat = num / num2
        case .remaind:
            resultat = num.truncatingRemainder(dividingBy: num2)
        default:
            return
        }
        /*if history.text != nil {
            history.text! += "\(num)\(operat.rawValue)\(num2) \n"
        }*/
            let sss = UITextField()
            sss.text = "\(num)\(operat.rawValue)\(num2)"
            if stackHistory.subviews.count < 5 {
            stackHistory.addArrangedSubview(sss)
            }
            else{
                stackHistory.subviews[0].removeFromSuperview()
                stackHistory.addArrangedSubview(sss)
                print(stackHistory.subviews.count)
            }
                if let res = resultat{
        displayLabel.text = String(res)
                act = nil
                }
            }
            }
            }
        }
    }
    func errorClearFunc(){
        if(errorClear){
            errorClear = false
            if(displayLabel.text != nil){
                displayLabel.text = String("")
            }
        }
    }
    @IBAction func back(sender: UIButton) {
        if(act != .none){act = .none}
        else{
            if let text = displayLabel.text{
                if(text.isEmpty){return}
                else{
                    displayLabel.text?.removeLast()
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

