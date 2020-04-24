//
//  ViewController.swift
//  TravelBook
//
//  Created by Büşra Serdaroğlu on 24.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        locationManager.delegate = self
        
    
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setGestureRecognizer()
    }
    
    func setGestureRecognizer() {
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func chooseLocation(gestureRecognizer : UILongPressGestureRecognizer) {
        
        // get clicked coordinate
        // check gesture starting
        if gestureRecognizer.state == .began {
            // get touched points from gesture recognizer
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            
            // touched points cast to coordinates
            let touchedCoordinate = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            // create annotation for showing
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinate
            annotation.title = "New annotation"
            annotation.subtitle = "Travel Book"
            
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //CLLocation : latitude longitude
        // for draw location on map
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        // zoom level : span
        // the smaller the closer
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }

}

