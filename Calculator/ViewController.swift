//
//  ViewController.swift
//  Calculator
//
//  Created by Pranav Doshi on 16/06/20.
//  Copyright © 2020 Pranav Doshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var calcOn = false
    var operation = 0
    var realNumber: Double = 0
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if calcOn == true
        {
            if sender.tag == 21
            {
                label.text = "π"
                numberOnScreen = 3.14159265
            }
            else
            {
                label.text = String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
            }
            calcOn = false
        }
        else
        {
            if label.text == "0"
            {
                label.text = ""
            }
            
            if sender.tag == 20 || sender.tag == 21
            {
                if sender.tag == 20
                {
                    label.text = label.text! + "."
                    numberOnScreen = Double(label.text!)!
                }
                else
                {
                    print("Pi pressed")
                    label.text = "π"
                    numberOnScreen = 3.14159265
                }
            }
            else
            {
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
            }

        }
    }
    
    
    @IBAction func plusMinusButton(_ sender: UIButton)
    {
        realNumber = 0 - realNumber
        label.text = String(realNumber)
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 17
        {
            if label.text == "π"
            {
                previousNumber = 3.14159265
            }
            else
            {
                previousNumber = Double(label.text!)!
            }
            if sender.tag == 12
            {
                label.text = "/";
            }
            if sender.tag == 13
            {
                label.text = "x";
            }
            if sender.tag == 14
            {
                label.text = "-";
            }
            if sender.tag == 15
            {
                label.text = "+";
            }
            if sender.tag == 16
            {
                label.text = "Mod";
            }
            operation = sender.tag
            calcOn = true;
        }

        else if sender.tag == 17
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
                realNumber = previousNumber / numberOnScreen
            }

            else if operation == 13
            {
                label.text = String(previousNumber * numberOnScreen)
                realNumber = previousNumber * numberOnScreen
                
            }

            else if operation == 14
            {
                label.text = String(previousNumber - numberOnScreen)
                realNumber = previousNumber - numberOnScreen

            }

            else if operation == 15
            {
                label.text = String(previousNumber + numberOnScreen)
                realNumber = previousNumber + numberOnScreen
            }
            else if operation == 16
            {
                label.text = String(Int(previousNumber) % Int(numberOnScreen))
                realNumber = Double(Int(previousNumber) % Int(numberOnScreen))
            }
        }
 
        else if sender.tag == 11
        {
            label.text = "0"
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
