//
//  ViewController.swift
//  tiptip
//
//  Created by Cindy Zheng on 9/16/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
   
    var tipPercentages = [0.18,0.20,0.25]
    var defaults = NSUserDefaults.standardUserDefaults()

    @IBAction func billUpdateTextField(sender: AnyObject) {
        updateUI()
    }
    
       @IBAction func dismissKeyboardTap(sender: AnyObject) {
        
        view.endEditing(true )
        
    }
     @IBAction func tipPercentChanged(sender: AnyObject) {
        updateUI()
        syncWrite()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipSegment.selectedSegmentIndex = 0
        self.title = "TipTip"
        syncWrite()

   }
    
    override   func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true )
        syncRead()
        updateUI()
     }
    
    func updateUI()
    {
        var tipPercent = tipPercentages [tipSegment.selectedSegmentIndex]
        var bill = NSString (string: billTextField.text).doubleValue
        
        var tip = bill * tipPercent
        var total = bill + tip
        
        totalLabel.text = String(format:"$%.2f",total)
        tipLabel.text = String(format: "$%.2f",tip)
   
    }
    
    //sync between viewcontrollers  
    func syncWrite( )
    {
        //defaults.setObject("some_string_to_save", forKey: "some_key_that_you_choose")
        defaults.setInteger(tipSegment.selectedSegmentIndex, forKey: "tipIndex")
        defaults.synchronize()
        println("write : \(tipSegment.selectedSegmentIndex)")
        
    }
    
    func syncRead( )
    {
        defaults.synchronize()
        var tipInt = defaults.integerForKey("tipIndex")
        tipSegment.selectedSegmentIndex = tipInt
        println("read \(tipInt)" )

    }
}
