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
    
    lazy var maps = MKMapView()
    

    @objc func buttonAct(sender: UIButton!){
        print("Teste")
    }
    
    
    
}

extension MapView: CodeView{
    func buildHierarchy() {
        addSubview(maps)
//        addSubview(logoImg)

    }
    
    func configConstraints() {
        maps.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
//        logoImg.snp.makeConstraints{ make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(70)
//            make.centerX.equalToSuperview()
//
//        }
    }
    
    func additionalConfig() {
        backgroundColor = UIColor.systemBlue
    }
    
}
