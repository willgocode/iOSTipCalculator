//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by William Wu on 8/1/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	let userDefaults : UserDefaults = UserDefaults.standard
	@IBOutlet weak var tipField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		if let defaultTip = userDefaults.object(forKey: "defaultTip") {
			tipField.placeholder = String(describing: defaultTip)
		}
		tipField.becomeFirstResponder()
		//tipField.placeholder = String(describing: userDefaults.object(forKey: "defaultTip")!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func endEditing(_ sender: Any) {
		view.endEditing(true)
	}

	@IBAction func updateDefaults(_ sender: Any) {
		if tipField.text != "" {
			if let tipPercent = tipField.text {
				userDefaults.set(Double(tipPercent), forKey: "defaultTip")
				userDefaults.synchronize()
			}
		}
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
