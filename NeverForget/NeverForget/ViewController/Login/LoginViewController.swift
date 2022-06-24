//
//  LoginViewController.swift
//  NeverForget
//
//  Created by Jaber Shamali on 23/06/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic{
    func displaySomething(viewModel: Login.Something.ViewModel)
    func displayView(viewModel: Login.LoginView.ViewModel)
    func displayMap()

}

protocol LoginViewControllerDelegate {
    func nextView()
    
}

class LoginViewController: UIViewController, LoginDisplayLogic, LoginViewControllerDelegate{
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    var vc = LoginView()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup(){
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad(){
        super.viewDidLoad()
        doView()
        //        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething(){
        let request = Login.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Login.Something.ViewModel){
        //nameTextField.text = viewModel.name
    }
    
    func doView(){
        let request = Login.LoginView.Request()
        interactor?.doLoadView(request: request)
    }
    
    func displayView(viewModel: Login.LoginView.ViewModel) {
        view = viewModel.view
        
    }
    
    func nextView() {
        interactor?.doMapView()
    }
    
    func displayMap() {
        router?.routeToMap()
    }
}
