//
//  homeViewController.swift
//  konbinicoupon2
//
//  Created by USER on 2023/05/16.
//

import UIKit
import MapKit


class homeViewController: UIViewController, MKMapViewDelegate, UINavigationBarDelegate {
    @IBOutlet weak var homeNavigationBar: UINavigationBar!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var secondView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeNavigationBar.delegate = self
        
        let loc = CLLocation(latitude: 35.6762, longitude: 139.6503)
        let cr = MKCoordinateRegion(center: loc.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(cr, animated: true)
        

    
        
        let pa = MKPointAnnotation()
        pa.coordinate = loc.coordinate
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(pa)
        
        mapView.delegate = self
        
        secondView.isHidden = true
        
        
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            secondView.isHidden = false
        } 
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
        
    }
    
}
