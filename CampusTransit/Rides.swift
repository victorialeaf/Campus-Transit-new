//
//  Rides.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 12/14/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import Foundation

class Rides {
    
    //MARK: Properties
    
    var pickup: String
    var dropoff: String
    var ridedate: String
    
    //MARK: Init
    init?(pickup: String, dropoff: String, ridedate: String) {
        // Initialization should fail if there is no name or if the rating is negative.
        if pickup.isEmpty || dropoff.isEmpty {
            return nil
        }
        //Initialize stored properties
        self.pickup = pickup
        self.dropoff = dropoff
        self.ridedate = ridedate 
        
       
    }
}


