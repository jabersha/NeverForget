//
//  ItemView.swift
//  NeverForget
//
//  Created by Jaber Shamali on 26/06/22.
//

import UIKit
import GoogleMaps


class ItemView: UIView {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var gmaps:GMSMapView = {
        let map = GMSMapView(frame: .zero)
        map.isMyLocationEnabled = true
        map.settings.myLocationButton = true
        
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

