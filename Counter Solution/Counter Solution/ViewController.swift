//
//  ViewController.swift
//  Counter Solution
//
//  Created by Ben Johnson on 11/7/15.
//  Copyright © 2015 Pretty Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var counterValueString: String {
        return NSNumberFormatter.localizedStringFromNumber(NSNumber(double: stepper.value), numberStyle: .DecimalStyle)
    }
    
    var counterLabelColor: UIColor {
        let color: UIColor
        switch stepper.value {
        case let value where value < 0:
            color = UIColor.redColor()
        case let value where value > 0:
            color = UIColor.greenColor()
        default:
            color = UIColor.blackColor()
        }
        return color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        updateCounterLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCounterLabel() {
        counterLabel.text = counterValueString
        counterLabel.textColor = counterLabelColor
    }
    
    // MARK: User Interaction
    @IBAction func handleStepperValueChanged(sender: UIStepper) {
        updateCounterLabel()
    }
}

