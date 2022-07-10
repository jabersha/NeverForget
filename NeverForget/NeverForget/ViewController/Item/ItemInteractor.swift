//
//  ItemInteractor.swift
//  NeverForget
//
//  Created by Jaber Shamali on 26/06/22.
//  Copyright (c) 2022 Jabinho. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ItemBusinessLogic
{
  func doSomething(request: Item.Something.Request)
}

protocol ItemDataStore
{
  //var name: String { get set }
}

class ItemInteractor: ItemBusinessLogic, ItemDataStore
{
  var presenter: ItemPresentationLogic?
  var worker: ItemWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Item.Something.Request)
  {
    worker = ItemWorker()
    worker?.doSomeWork()
    
//    let response = Item.Something.Response()
//    presenter?.presentSomething(response: response)
  }
}
