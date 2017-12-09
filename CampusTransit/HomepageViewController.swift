//
//  HomepageViewController.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 10/18/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit
import MapKit
import Firebase


class HomepageVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting initial location to MU
        let initialLocation = CLLocation(latitude: 43.038611, longitude: -87.928759)
        centerMapLocation(location: initialLocation)
        //show LIMOS on map
        let message = MapMessage(title: "Hello", locationName: "Raynor Memorial Library", username: "John Smith", coordinate: CLLocationCoordinate2D(latitude: 43.0381, longitude: -87.9299))
        mapView.addAnnotation(message)
    }
        let regionRadius: CLLocationDistance = 1000
        
        func centerMapLocation(location: CLLocation){
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius*2.0, regionRadius*2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
    //location manager to authorize user location for maps app
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus () {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
        locationManager.requestWhenInUseAuthorization()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
