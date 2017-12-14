//
//  RidesTableViewController.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 12/14/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit

class RidesTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var rides = [Rides]()

    override func viewDidLoad() {
        super.viewDidLoad()

       //load sample rides
        loadSampleRides()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rides.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RidesTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RidesTableViewCell else {
            fatalError("The dequeued cell is not an instance of RidesTableViewCell")
        }
        
        //fetches appropriate ride for the data source layout
        let ride = rides[indexPath.row]
        
        cell.pLabel.text = ride.pickup
        cell.dLabel.text = ride.dropoff
        cell.dateLabel.text = ride.ridedate
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    private func loadSampleRides() {
        guard let ride1 = Rides(pickup: "Humphrey Hall", dropoff: "Straz Tower", ridedate: "11/29/2017") else {
            fatalError("Unable to instantiate ride1")
        }
        guard let ride2 = Rides(pickup: "Raynor Memorial Library", dropoff: "Mashuda Hall", ridedate: "12/7/2017") else {
            fatalError("Unable to instantiate ride2")
        }
        guard let ride3 = Rides(pickup: "McCormick Hall", dropoff: "Al McGuire Center", ridedate: "12/11/2017") else {
            fatalError("Unable to instantiate ride3")
        }
        rides += [ride1, ride2, ride3]
        
        
    }

}
