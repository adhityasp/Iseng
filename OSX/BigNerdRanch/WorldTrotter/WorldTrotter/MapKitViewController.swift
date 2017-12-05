//
//  MapKitViewController.swift
//  WorldTrotter
//
//  Created by Adhitya Surya Pratama on 8/26/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController : UIViewController{
    var mapView: MKMapView!
    //Selector
    func changeMapType(segmentControl : UISegmentedControl){
        switch segmentControl.selectedSegmentIndex{
        case 0:
            print("standard")
            mapView.mapType = .standard
        case 1 :
            print("hybrid")
            mapView.mapType = .hybrid
        case 2:
            print("satelite")
            mapView.mapType = .satellite
        case 3:
            print("hybridflyover")
            mapView.mapType = .hybridFlyover
        case 4 :
            print("sateliteflyover")
            mapView.mapType = .satelliteFlyover
        default:
            break
        }
    }

    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        //make segmentedControl
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite",  "Hybrid Flyover",  "Satellite Flyover"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.addTarget(self, action:#selector(changeMapType(segmentControl:)), for: .valueChanged)
        
        view.addSubview(segmentedControl)
        
        //get margin guide
        let marginsGuide = view.layoutMarginsGuide
        
        //set constraint depends on margin guide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor)
        
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: marginsGuide.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("mapkit")
    }
}
