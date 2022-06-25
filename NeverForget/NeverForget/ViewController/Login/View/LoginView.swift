//
//  LoginView.swift
//  NeverForget
//
//  Created by Jaber Shamali on 24/06/22.
//

import UIKit


class LoginView: UIView {
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var delegate: LoginViewControllerDelegate?

    
    lazy var logoImg: UIImageView = {
        let view = UIImageView(frame: .zero)
        //         view.image = UIImage(named: "")
        view.layer.cornerRadius = 20.0
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var userTxtFd: UITextField = {
        let view = UITextField(frame: .zero)
        view.keyboardType = .emailAddress
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.placeholder = "Login"
        view.textAlignment = .center
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    lazy var passTxtFd: UITextField = {
        let view = UITextField(frame: .zero)
        view.isSecureTextEntry = true
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.placeholder = "Senha"
        view.textAlignment = .center
        view.backgroundColor = .systemGray3
        
        return view
    }()
    
    lazy var userRecoveryBtn: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Esqueceu a senha?", for: .normal)
        view.setTitleColor( UIColor.darkGray , for: .normal)
        
        return view
    }()
    
    lazy var enterBtn: UIButton = {
        let view = UIButton(frame: .zero)
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        view.setTitle("Entrar", for: .normal)
        view.setTitleColor( UIColor.white , for: .normal)
        view.addTarget(self, action: #selector(buttonAct), for: .touchUpInside)
        
        return view
    }()
    
    
    @objc func buttonAct(sender: UIButton!){
        self.delegate?.nextView()
    }
    
    
    
}

extension LoginView: CodeView{
    func buildHierarchy() {
        addSubview(logoImg)
        addSubview(userTxtFd)
        addSubview(passTxtFd)
        addSubview(userRecoveryBtn)
        addSubview(enterBtn)
    }
    
    func configConstraints() {
        logoImg.snp.makeConstraints{ make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(70)
            make.centerX.equalToSuperview()
            
        }
        
        userTxtFd.snp.makeConstraints{ make in
            make.top.equalTo(logoImg.snp.bottom).offset(70)
            make.centerX.equalTo(logoImg)
            make.width.equalTo(190)
            make.height.equalTo(30)
        }
        
        passTxtFd.snp.makeConstraints{ make in
            make.top.equalTo(userTxtFd.snp.bottom).offset(30)
            make.centerX.equalTo(userTxtFd)
            make.left.right.equalTo(userTxtFd)
            make.height.equalTo(30)
        }
        
        userRecoveryBtn.snp.makeConstraints{ make in
            make.top.equalTo(passTxtFd.snp.bottom).offset(0)
            make.left.right.equalTo(passTxtFd)
            make.height.equalTo(30)
        }
        
        enterBtn.snp.makeConstraints{ make in
            make.top.equalTo(userRecoveryBtn.snp.bottom).offset(30)
            make.centerX.equalTo(userTxtFd)
            make.left.right.equalTo(passTxtFd)
            make.height.equalTo(50)
        }
    }
    
    func additionalConfig() {
        backgroundColor = UIColor.systemBlue
    }
    
}
