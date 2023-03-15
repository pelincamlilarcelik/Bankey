//
//  ViewController.swift
//  Bankey
//
//  Created by Onur Celik on 14.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    let toptitle = UILabel()
    let subtitle = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String?{
        loginView.usernameTextField.text
    }
    var password: String?{
        loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }


}
extension LoginViewController{
    
   
    
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = .zero
        errorMessageLabel.isHidden = true
        
        toptitle.translatesAutoresizingMaskIntoConstraints = false
        toptitle.text = "Bankey"
        toptitle.font = .preferredFont(forTextStyle: .largeTitle)
        toptitle.textAlignment = .center
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.text = "You premium source for all things banking!"
        subtitle.font = .preferredFont(forTextStyle: .body)
        subtitle.textAlignment = .center
        
        
    }
    private func layout(){
        view.addSubview(toptitle)
        view.addSubview(subtitle)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            
            toptitle.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -8),
            toptitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            toptitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            subtitle.topAnchor.constraint(equalTo: toptitle.bottomAnchor, constant: 8),
            subtitle.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -8),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1),
            
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1),
        ])
    }
}
extension LoginViewController{
    
    @objc func signInTapped(){
        login()
    }
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("Username/password should never be nil")
            return
        }
        if username.isEmpty || password.isEmpty{
            configureView(withMessage:"Username / password cannot be blank")
            return
        }
        if username == "Pelin" && password == "iosdeveloper"{
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "Incorrect username / password ")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
