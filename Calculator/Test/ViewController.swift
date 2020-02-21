//
//  ViewController.swift
//  Test
//
//  Created by TrackEnsure on 2020-02-13.
//  Copyright © 2020 Eugene. All rights reserved.
//

import UIKit
class ViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var str : [String] = ["","","","","",""]
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return str.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        cell.textLabel?.text = str[indexPath.row]
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addnumber(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text {
            if let num = Numbers.init(rawValue:sender.currentTitle!){
                if(text.count>=13){return}
                if(num.rawValue == Numbers.change.rawValue){
                    displayLabel.text! = "-"+text
                    return
                }
                displayLabel.text! += String(num.rawValue)
            }
        }
    }
    
    @IBAction func addpoint(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text {
            if(text.count>=13){return}
            
            if (text.last==Numbers.point.rawValue.first || text.isEmpty || text.contains(Numbers.point.rawValue)){
                return
            } else {
                displayLabel.text! += Numbers.point.rawValue
            }
        }
        
    }
    
    @IBAction func operation(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text,let digit = sender.currentTitle {
            if text.isEmpty && digit.isEmpty {return}
            if let  num  = Float(text){
                model.firstval = num
                model.act = Operation.init(rawValue: digit) ?? nil
                displayLabel.text =  ""
            }
        }
    }
    
    @IBAction func clearact(sender: UIButton) {
        errorClearFunc()
        model.firstval = nil
        model.secondval = nil
        model.act = nil
        if displayLabel.text != nil{
            displayLabel.text = ""
        }
    }
    
    @IBAction func change(sender: UIButton) {
        errorClearFunc()
        if var text = displayLabel.text {
            if (text.isEmpty || text.last==Numbers.point.rawValue.first){return}
            if(text.first==Operation.minus.rawValue.first){
                text.removeFirst();
            }
            else{
                text=Operation.minus.rawValue+text
            }
            displayLabel.text = text
        }
    }
    
    @IBAction func ravnoact(sender: UIButton) {
        errorClearFunc()
        if let text = displayLabel.text {
            if text.isEmpty{return}
            if let tx = Float(text){
                model.secondval=tx
                if let num = model.firstval,let num2 = model.secondval{
                    if let operat = model.act{
                        switch operat {
                        case .plus:
                            model.resultat = num + num2
                        case .minus:
                            model.resultat = num - num2
                        case .mult:
                            model.resultat = num * num2
                        case .div:
                            if(model.secondval==0){displayLabel.text="Not divide by zero";model.errorClear = true;return}
                            model.resultat = num / num2
                        case .remaind:
                            model.resultat = num.truncatingRemainder(dividingBy: num2)
                        }
                        let sss = "\(num)\(operat.rawValue)\(num2)"
                        if(str.count < 6){
                            addnewHistory(hist: sss ,full: false)
                        }
                        else{
                            addnewHistory(hist: sss ,full: true)
                        }
                        if let res = model.resultat{
                            displayLabel.text = String(res)
                            model.act = nil
                        }
                    }
                }
            }
        }
    }
    func addnewHistory(hist : String , full : Bool){
        if(!full){
            let index = str.index(str.endIndex, offsetBy: 0)
            str[index] = hist
            let indexPath = IndexPath(row: index, section: 0)
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        else{
            str.removeFirst()
            str.append(hist)
            let indexPathAdd = IndexPath(row: str.count-1, section: 0)
            let indexPathDel = IndexPath(row: 0, section: 0)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPathDel], with: .automatic)
            tableView.insertRows(at: [indexPathAdd], with: .automatic)
            tableView.endUpdates()
        }
        for a in str{
             print("+ \(a)")
         }
    }
    
    func errorClearFunc(){
        if(model.errorClear){
            model.errorClear = false
            if(displayLabel.text != nil){
                displayLabel.text = ""
            }
        }
    }
    
    @IBAction func back(sender: UIButton) {
        if(model.act != .none){model.act = .none}
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


