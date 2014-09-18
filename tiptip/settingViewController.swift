//
//  settingViewController.swift
//  tiptip
//
//  Created by Cindy Zheng on 9/16/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {

    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    
    @IBAction func doneSettingButton(sender: AnyObject) {
        syncWrite()

        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Setting"
        syncRead()
    }
    
    //sync
    func syncWrite( )
    {
        defaults.setInteger(tipPercentSegment.selectedSegmentIndex, forKey: "tipIndex")
        defaults.synchronize()
        println("write : \(tipPercentSegment.selectedSegmentIndex)")

        
    }
    func syncRead( )
    {
        defaults.synchronize()
        var tipInt = defaults.integerForKey("tipIndex")
        tipPercentSegment.selectedSegmentIndex = tipInt
        println("read \(tipInt)" )

    }
   

}
