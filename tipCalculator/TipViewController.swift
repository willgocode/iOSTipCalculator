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
				let convert = String(describing: lastTip)
				print(convert)
				
				tipLabel.text = String(format: "$%.2f", convert)
			}
			
			if let lastBill = userDefaults.object(forKey: "savedBill") {
				let convert = String(describing: lastBill)
				print(convert)
				
				billField.text = String(format: "%.2f", convert)
			}
			
			if let lastTotal = userDefaults.object(forKey: "savedTotal") {
				let convert = String(describing: lastTotal)
				print(convert)
				totalLabel.text = String(format: "$%.2f", convert)
			}
		}*/
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
		
		let currentTime = Date.init()
		userDefaults.set(tip, forKey: "savedTip")
		userDefaults.set(bill, forKey: "savedBill")
		userDefaults.set(total, forKey: "savedTotal")
		userDefaults.set(currentTime, forKey: "lastUpdated")
		
		userDefaults.synchronize()
		print("saved")
		tipLabel.text = String(format: "$%.2f", tip)
		totalLabel.text = String(format: "$%.2f", total)
	}
	
	@IBAction func returnToMain(segue: UIStoryboardSegue) {
		useDefault = true
		calculateTip(self)
	}
}

