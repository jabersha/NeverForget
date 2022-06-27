//
//  ItemView.swift
//  NeverForget
//
//  Created by Jaber Shamali on 26/06/22.
//

import UIKit
import MapKit


class ItemView: UIView {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mapsView:MKMapView = {
        let map = MKMapView(frame: .zero)
        map.mapType = MKMapType.hybrid
        map.isZoomEnabled = true
        map.isScrollEnabled = true
        map.isRotateEnabled = true
        map.showsUserLocation = true
        map.pointOfInterestFilter = .init(including: [MKPointOfInterestCategory.store])
        
        return map
    }()

    
    lazy var table: UITableView = {
        
        let t = UITableView(frame: .zero)
        
        return t
    }()
    
    lazy var bottomView : UIView = {
        let view = UIView(frame: .zero)
        
        return view
    }()
    
    lazy var addBtn: UIButton = {
        let btn = UIButton(frame: .zero)
        btn.setTitle("+", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Arial", size: 70)
        
        return btn
    }()
}

