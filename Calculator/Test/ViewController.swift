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
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var display: UITextField!
    
    //переменная хранит, начали ли печатать
    var notstarttyping : Bool = false
    
    //action для цифр
    @IBAction func addnumber(sender: UIButton) {
        //константа для цифры
        //берем ее из свойства title вызвавшей этот action кнопки
        let digit  = sender.currentTitle
        
        //если начали печатать
        if (notstarttyping == false) {
            //сотрем 0 и присвоим цифру
            display.text = digit
            notstarttyping = true
            
        } else {
            //добавим к существующему значению цифру
            display.text! += digit!
        }
    }
    
    //первая часть выражения
    var firstval : Float = 0
    //вторая часть выражения
    var secondval : Float = 0
    //результат
    var resultat : Float = 0
    //что это за действие
    var act : String = "0"
    
    //обработка сложения
    @IBAction func plusact(sender: UIButton) {
        //присвоим первой части то что написано в display
        //конвертируем NSString во float
        firstval = Float(display.text!)!
        //покажем, что это сложение
        act = "+"
        //очистим display
        display.text =  ""
        
    }
    
    //обработка вычитания
    @IBAction func minusact(sender: UIButton) {
        //присвоим первой части то что написано в display
        //конвертируем NSString во float
        firstval = Float(display.text!)!
        //покажем, что это вычитание
        act = "-"
        //очистим display
        display.text =  ""
    }
    
    //обработка умножения
    @IBAction func umnact(sender: UIButton) {
        //присвоим первой части то что написано в display
        //конвертируем NSString во float
        firstval = Float(display.text!)!
        //покажем, что это умножение
        act = "*"
        //очистим display
        display.text =  ""
    }
    
    //обработка деления
    @IBAction func delit(sender: UIButton) {
        //присвоим первой части то что написано в display
        //конвертируем NSString во float
        firstval = Float(display.text!)!
        //покажем, что это деление
        act = "/"
        //очистим display
        display.text =  ""
    }
    
    //очистка, обработка C
    @IBAction func clearact(sender: UIButton) {
        //обнулим все переменные
        firstval = 0
        secondval = 0
        act = ""
        //очистим display
        display.text =  ""
    }
    
    //обработка "равно"
    @IBAction func ravnoact(sender: UIButton) {
        //присваиваем второй части выражения, то что написано в display
        secondval = Float(display.text!)!
        //смотрим какое это действие и выполняем его
        //результат записываем в переменную resultat
        switch act {
        case "+":
            resultat = firstval + secondval
        case "-":
            resultat = firstval - secondval
        case "*":
            resultat = firstval * secondval
        case "/":
            resultat = firstval / secondval
        default:
            print("other")
        }
        //присваиваем значение переменной resultat метке
        display.text = String(resultat)
        
    }


}

