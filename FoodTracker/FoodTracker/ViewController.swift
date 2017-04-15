//
//  ViewController.swift
//  FoodTracker
//
//  Created by Ritvik Kar on 4/14/17.
//  Copyright © 2017 karr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var nameTestField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton){
        mealNameLabel.text = "Default Test"
    }


}

