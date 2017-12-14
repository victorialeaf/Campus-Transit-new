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
    
    var messageNodeRef : DatabaseReference!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //setting delegate to MapViewExtension.swift
        self.mapView.delegate = self
        
        //setting initial location to MU
        let initialLocation = CLLocation(latitude: 43.038611, longitude: -87.928759)
        centerMapLocation(location: initialLocation)
        
        //Firebase DB Reference for Available Limos
        messageNodeRef = Database.database().reference().child("messages")
        
        //observe handler to get realtime updates
        let pinMessageId = "msg-1"
        var pinMessage: MapMessage?
        messageNodeRef.child(pinMessageId).observe(.value, with: { (snapshot: DataSnapshot) in
            if let dictionary = snapshot.value as? [String: Any]
            {
                //if pin exists, remove it first
                if pinMessage != nil
                {
                    self.mapView.removeAnnotation(pinMessage!)
                }
                //map JSON tags to MapMessage class properties
                let pinLat = dictionary["latitude"] as! Double
                let pinLong = dictionary["longitude"] as! Double
                let messageDisabled = dictionary["isDisabled"] as! Bool
                
                let message = MapMessage(title: (dictionary["title"] as? String)!, locationName: (dictionary["locationName"] as? String)!, username: (dictionary["username"] as? String)!, coordinate: CLLocationCoordinate2D(latitude: pinLat, longitude: pinLong), isDisabled: messageDisabled
                )
                pinMessage = message
                //if message not disabled, show message as annotation
                if !message.isDisabled
                {
                    self.mapView.addAnnotation(message)
                }
            }
        })
        let pinMessageId2 = "msg-2"
        var pinMessage2: MapMessage?
        messageNodeRef.child(pinMessageId2).observe(.value, with: { (snapshot: DataSnapshot) in
            if let dictionary = snapshot.value as? [String: Any]
            {
                //if pin exists, remove it first
                if pinMessage2 != nil
                {
                    self.mapView.removeAnnotation(pinMessage2!)
                }
                //map JSON tags to MapMessage class properties
                let pinLat2 = dictionary["latitude"] as! Double
                let pinLong2 = dictionary["longitude"] as! Double
                let messageDisabled2 = dictionary["isDisabled"] as! Bool
                
                let message2 = MapMessage(title: (dictionary["title"] as? String)!, locationName: (dictionary["locationName"] as? String)!, username: (dictionary["username"] as? String)!, coordinate: CLLocationCoordinate2D(latitude: pinLat2, longitude: pinLong2), isDisabled: messageDisabled2
                )
                pinMessage2 = message2
                //if message not disabled, show message as annotation
                if !message2.isDisabled
                {
                    self.mapView.addAnnotation(message2)
                }
            }
        })
        
    
        
        //mapView.delegate = self
        
        //show LIMOS on map
        let message = MapMessage(title: "Limo Available", locationName: "Raynor Memorial Library", username: "John Smith", coordinate: CLLocationCoordinate2D(latitude: 43.0381, longitude: -87.9299), isDisabled: false)
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
