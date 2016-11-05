//
//  MainVC.swift
//  enekes2
//
//  Created by G on 05/11/2016.
//  Copyright © 2016 erdgabios. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

        
        var _runningNumber: String!
        var _runningNumberInt: Int!
        var _length: Int!
        var _lastChar: String!
        
        var runningNumberInt: Int {
            get {
                if _runningNumberInt == nil {
                    _runningNumberInt = 0
                }
                return _runningNumberInt
            }
            set {
                _runningNumberInt = newValue
            }
        }
        
        
        var lastChar: String {
            get {
                if _lastChar == nil {
                    _lastChar = ""
                }
                return _lastChar
            }
            set {
                _lastChar = newValue
            }
        }
        
        
        var runningNumber: String {
            get {
                if _runningNumber == nil {
                    _runningNumber = ""
                }
                return _runningNumber!
            }
            set {
                _runningNumber = newValue
            }
        }
        
        var length: Int {
            get {
                if _length == nil {
                    _length = 0
                }
                return _length
            }
            set {
                _length = newValue
            }
        }
        
    
    @IBOutlet weak var azEnekSzamaLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        
        if length < 3 {
            
            runningNumber += "\(sender.tag)"
            runningNumberInt = Int(runningNumber)!
            
            length = runningNumber.characters.count
        }
        
        
        numberLabel.text = runningNumber
    }

    
    @IBAction func lapozzdFel(_ sender: Any) {
    }
    
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        
        runningNumber = ""
        
        if runningNumberInt < 1 || runningNumberInt > 512 {
            
            azEnekSzamaLabel.textColor = UIColor.red
        }
        
        
        if length > 0 && length < 4 {
            
            length = runningNumber.characters.count
            print("LENGTH: \(length)")
            
            numberLabel.text = runningNumber
            
        }
        
        if length < 3 {
            azEnekSzamaLabel.textColor = UIColor.black
        }
        

    }


    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if runningNumberInt > 0 && runningNumberInt < 513 && runningNumber != "0" && runningNumber != "00" && length > 0 && numberLabel.text != nil {
            
            return true
            
        } else {
            azEnekSzamaLabel.textColor = UIColor.red
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let DestVC: DalVC = segue.destination as! DalVC
        DestVC.enekSzamFejlec = numberLabel.text!
        azEnekSzamaLabel.textColor = UIColor.black
        
        
    }

}



