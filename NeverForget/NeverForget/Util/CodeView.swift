//
//  CodeView.swift
//  NeverForget
//
//  Created by Jaber Shamali on 24/06/22.
//

import UIKit
import SnapKit

protocol CodeView{
    func buildHierarchy()
    func configConstraints()
    func additionalConfig()
    func setupView()
}

extension CodeView{
    func setupView(){
        buildHierarchy()
        configConstraints()
        additionalConfig()
    }
}
