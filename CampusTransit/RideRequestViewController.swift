//
//  RideRequestViewController.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 11/19/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit

class RideRequestViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var PickupTextField: UITextField!
    @IBOutlet weak var PickupLabel: UILabel!
    @IBOutlet weak var DropoffTextField: UITextField!
    @IBOutlet weak var DropoffLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //MARK: Actions

    @IBAction func RequestRide(_ sender: UIButton) {
    }
}
