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
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textFieldComment: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    
    var locationManager = CLLocationManager()
   
    var choosenLatitude = Double()
    var choosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedTitleId : UUID?
    
    var annotationTitle = ""
    var annotationComment = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        locationManager.delegate = self
        
    
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setGestureRecognizer()
        
        if selectedTitle != "" {
            // get detail from core data
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            
            let idString = selectedTitleId!.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        if let title = result.value(forKey: "title") as? String {
                            annotationTitle = title
                            
                            if let subTitle = result.value(forKey: "subtitle") as? String {
                                annotationComment = subTitle
                                    
                                if let latitude = result.value(forKey: "latitude") as? Double {
                                    annotationLatitude = latitude
                                                                    
                                    if let longitude = result.value(forKey: "longitude") as? Double {
                                        annotationLongitude = longitude
                                        
                                        let annotation = MKPointAnnotation()
                                        annotation.title = annotationTitle
                                        annotation.subtitle = annotationComment
                                        
                                        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                        
                                        annotation.coordinate = coordinate
                                        mapView.addAnnotation(annotation)
                                        
                                        textFieldName.text = annotationTitle
                                        textFieldComment.text = annotationComment
                                        
                                        // stop location manager listener
                                        locationManager.stopUpdatingLocation()
                                        
                                        // focus selected annotation point
                                        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                        let region = MKCoordinateRegion(center: coordinate, span: span)
                                        mapView.setRegion(region, animated: true)
                                    }
                                }
                            }
                        }
                    }
                }
            } catch {
                print("error")
            }
            
        } else {
            // add new data
        }
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
            
            // get choosen coordinates for core data
            choosenLatitude = touchedCoordinate.latitude
            choosenLongitude = touchedCoordinate.longitude
            
            // create annotation for showing
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinate
            annotation.title = textFieldName.text
            annotation.subtitle = textFieldComment.text
            
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if selectedTitle == "" {
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

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil // dont show user location be pin
        }
        
        let reuseId = "myAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier:reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            // create pin
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true // show extra detail
            pinView?.tintColor = UIColor.black // change pin color
            
            // add button to pin
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
            
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    @IBAction func saveAnnotation(_ sender: Any) {
        
        // save annotation core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
   
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(textFieldName.text, forKey: "title")
        newPlace.setValue(textFieldComment.text, forKey: "subtitle")
        newPlace.setValue(choosenLatitude, forKey: "latitude")
        newPlace.setValue(choosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("success")
        } catch {
            print("error")
        }
        
        // notfiy
        NotificationCenter.default.post(name: NSNotification.Name("newPlace"), object: nil)
        navigationController?.popViewController(animated: true)
    }
}

