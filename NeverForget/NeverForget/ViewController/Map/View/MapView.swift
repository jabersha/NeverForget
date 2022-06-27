//
//  MapView.swift
//  NeverForget
//
//  Created by Jaber Shamali on 24/06/22.
//

import UIKit
import MapKit

class MapView: UIView {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var locationManager:CLLocationManager!

    
    lazy var maps:MKMapView = {
        let map = MKMapView(frame: .zero)
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.isRotateEnabled = true
        
        determineCurrentLocation()
        
        return map
    }()
    
}

extension MapView: CodeView{
    func buildHierarchy() {
        addSubview(maps)

    }
    
    func configConstraints() {
        maps.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.bottom.left.right.equalToSuperview()
        }
    }
    
    func additionalConfig() {
        backgroundColor = UIColor.systemBlue
    }
    
}

extension MapView: MKMapViewDelegate, CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let mUserLocation:CLLocation = locations[0] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        maps.setRegion(mRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error - locationManager: \(error.localizedDescription)")
    }
    //MARK:- Intance Methods
    
    func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
}
