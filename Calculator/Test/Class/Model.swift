//
//  Model.swift
//  Test
//
//  Created by TrackEnsure on 2020-02-19.
//  Copyright © 2020 Eugene. All rights reserved.
//

import Foundation
import UIKit

class Model : CalculateProtocol{
    var firstval : Float?
    var secondval : Float?
    var resultat : Float?
    var act : Operation?
    var number : Numbers?
    var errorClear : Bool
    var str : Array<String>
    init() {
        str = Array(repeating: "", count: 6)
        errorClear = false
    }
    func addnumber(sender: UIButton, displayLabel:UILabel) {
           errorClearFunc(displayLabel:displayLabel)
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
       
       func addpoint(sender: UIButton, displayLabel:UILabel) {
           errorClearFunc(displayLabel:displayLabel)
           if let text = displayLabel.text {
               if(text.count>=13){return}
               
               if (text.last==Numbers.point.rawValue.first || text.isEmpty || text.contains(Numbers.point.rawValue)){
                   return
               } else {
                   displayLabel.text! += Numbers.point.rawValue
               }
           }
           
       }
       
       func operation(sender: UIButton, displayLabel:UILabel) {
           errorClearFunc(displayLabel:displayLabel)
           if let text = displayLabel.text,let digit = sender.currentTitle {
               if text.isEmpty && digit.isEmpty {return}
               if let  num  = Float(text){
                   firstval = num
                   act = Operation.init(rawValue: digit) ?? nil
                   displayLabel.text =  ""
               }
           }
       }
       
       func clearact(sender: UIButton, displayLabel:UILabel) {
           errorClearFunc(displayLabel:displayLabel)
           firstval = nil
           secondval = nil
           act = nil
           if displayLabel.text != nil{
               displayLabel.text = ""
           }
       }
       
       func change(sender: UIButton, displayLabel:UILabel) {
           errorClearFunc(displayLabel:displayLabel)
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
       
       func equal(sender: UIButton, displayLabel:UILabel,tableView:UITableView) {
           errorClearFunc(displayLabel:displayLabel)
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
                               if(secondval == 0){displayLabel.text="Not divide by zero";errorClear = true;return}
                               resultat = num / num2
                           case .remaind:
                               resultat = num.truncatingRemainder(dividingBy: num2)
                           }
                           let sss = "\(num)\(operat.rawValue)\(num2)"
                           if(str.count < 6){
                               addnewHistory(hist: sss ,full: false,tableView: tableView)
                           }
                           else{
                               addnewHistory(hist: sss ,full: true,tableView: tableView)
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
    func addnewHistory(hist : String , full : Bool,tableView:UITableView){
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
       }
       
       func errorClearFunc(displayLabel:UILabel){
           if(errorClear){
               errorClear = false
               if(displayLabel.text != nil){
                   displayLabel.text = ""
               }
           }
       }
       
       func back(sender: UIButton, displayLabel:UILabel) {
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
