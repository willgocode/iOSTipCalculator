//
//  TipViewController.swift
//  tipCalculator
//
//  Created by William Wu on 8/1/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
	var userDefaults : UserDefaults = UserDefaults.standard
	@IBOutlet weak var billField: UITextField!
	@IBOutlet weak var tipLabel: UILabel!
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var tipControl: UISegmentedControl!
	var useDefault = true

	override func viewDidLoad() {
		super.viewDidLoad()
		
		//billField.becomeFirstResponder()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		billField.becomeFirstResponder()
/*
		if let lastDate = userDefaults.object(forKey: "lastUpdated") {
			print("Pulling")
			var nextDate = lastDate as! Date
			nextDate.addTimeInterval(600)
			let currentDate = Date.init()
			
			if(nextDate <= currentDate) {
				userDefaults.removeObject(forKey: "lastUpdated")
				userDefaults.removeObject(forKey: "savedTip")
				userDefaults.removeObject(forKey: "savedBill")
				userDefaults.removeObject(forKey: "savedTotal")
				userDefaults.synchronize()
			}
			
			if let lastTip = userDefaults.object(forKey: "savedTip") {
				tipLabel.text = lastTip as! String
			}
			
			if let lastBill = userDefaults.object(forKey: "savedBill") {
				billField.text = lastBill as! String
			}
			
			if let lastTotal = userDefaults.object(forKey: "savedTotal") {
				totalLabel.text = lastTotal as! String
			}
		}
*/
		calculateTip(self)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func onTap(_ sender: Any) {
		view.endEditing(true)
	}
	
	@IBAction func tipControlChange(_ sender: Any) {
		useDefault = false
		calculateTip(self)
	}
	
	@IBAction func calculateTip(_ sender: Any) {
		let tipPercentages = [0.18, 0.2, 0.25]
		let bill = Double(billField.text!) ?? 0
		var tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
		
		if useDefault == true {
			if let defaultTip = userDefaults.object(forKey: "defaultTip") as! Double? {
				tip = bill * defaultTip
			}
		}
		
		let total = bill + tip

		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .currency
		numberFormatter.locale = Locale.current
		let tipAmount = numberFormatter.string(from: NSNumber(value: tip))
		let totalAmount = numberFormatter.string(from: NSNumber(value: total))
		let billAmount = numberFormatter.string(from: NSNumber(value: bill))
		
		let currentTime = Date.init()
		userDefaults.set(tipAmount, forKey: "savedTip")
		userDefaults.set(billAmount, forKey: "savedBill")
		userDefaults.set(totalAmount, forKey: "savedTotal")
		userDefaults.set(currentTime, forKey: "lastUpdated")
	
		userDefaults.synchronize()
		
		tipLabel.text = tipAmount!
		totalLabel.text = totalAmount!
	}
	
	@IBAction func returnToMain(segue: UIStoryboardSegue) {
		useDefault = true
		calculateTip(self)
	}
}

