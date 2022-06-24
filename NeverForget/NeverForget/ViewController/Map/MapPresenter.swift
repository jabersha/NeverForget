//
//  MapPresenter.swift
//  NeverForget
//
//  Created by Jaber Shamali on 24/06/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MapPresentationLogic{
    func presentMap(response: Map.MapView.Response)
}

class MapPresenter: MapPresentationLogic{
    
    
    var viewController: MapDisplayLogic?
    
    // MARK: Do something
    
    
    func presentMap(response: Map.MapView.Response) {
        let viewModel = Map.MapView.ViewModel(view: response.view)
        viewController?.displayMap(viewModel: viewModel)
    }
}
