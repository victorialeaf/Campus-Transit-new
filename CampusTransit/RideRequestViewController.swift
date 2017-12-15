//
//  RideRequestViewController.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 11/19/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit
import os.log


class RideRequestViewController: UIViewController, UITextFieldDelegate,UINavigationControllerDelegate {

    //MARK: Properties
    
    @IBOutlet weak var PickupTextField: UITextField!
    @IBOutlet weak var PickupLabel: UILabel!
    @IBOutlet weak var DropoffTextField: UITextField!
    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var DropoffLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var RequestButton: UIBarButtonItem!
    
    var ride: Rides?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text field user input through delegate callbacks
        PickupTextField.delegate = self
        DropoffTextField.delegate = self
        DateTextField.delegate = self
        
        //enable done button only if valid fields
       // updateRequestButtonState()
    
        
        // Do any additional setup after loading the view.
    }
    //MARK: Navigation
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the button is pressed.
        guard let button = sender as? UIBarButtonItem, button === RequestButton else {
            os_log("The request button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let pickup = PickupTextField.text ?? ""
        let dropoff = DropoffTextField.text ?? ""
        let ridedate = DateTextField.text ?? ""
        
        // Set the ride to be passed to RideTableViewController after the unwind segue.
        ride = Rides(pickup: pickup, dropoff: dropoff, ridedate: ridedate)
    }
    
   
    
    //MARK: Actions

    @IBAction func RequestRide(_ sender: UIBarButtonItem) {
    }
}
