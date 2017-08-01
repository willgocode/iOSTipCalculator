//
//  TipViewController.swift
//  tipCalculator
//
//  Created by William Wu on 8/1/17.
//  Copyright © 2017 william. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
	let userDefaults : UserDefaults = UserDefaults.standard
	@IBOutlet weak var billField: UITextField!
	@IBOutlet weak var tipLabel: UILabel!
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var tipControl: UISegmentedControl!

	override func viewDidLoad() {
		super.viewDidLoad()
		//billField.becomeFirstResponder()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		billField.becomeFirstResponder()
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
		calculateTip(self)
	}
	
	@IBAction func calculateTip(_ sender: Any) {
		let tipPercentages = [0.18, 0.2, 0.25]
		let bill = Double(billField.text!) ?? 0
		var tip = bill * tipPercentages[tipControl.selectedSegmentIndex]

		if let defaultTip = userDefaults.object(forKey: "defaultTip") as! Double? {
			tip = bill * defaultTip
		}
		
		let total = bill + tip

		tipLabel.text = String(format: "$%.2f", tip)
		totalLabel.text = String(format: "$%.2f", total)
	}
	
	@IBAction func returnToMain(segue: UIStoryboardSegue) {}
}

