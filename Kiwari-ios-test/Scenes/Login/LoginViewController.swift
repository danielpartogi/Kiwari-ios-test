//
//  LoginViewController.swift
//  Kiwari-ios-test
//
//  Created by daniel on 08/05/20.
//  Copyright (c) 2020 Daniel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Firebase

protocol LoginDisplayLogic: class
{
    func displayLoginUser(vm: Login.LoginUser.ViewModel)
}

class LoginViewController: UIViewController
{
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var bottomLoginConstrain: NSLayoutConstraint!
    
  
    
    
    // MARK: Setup
    
    private func setup()
    {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }
    
  
    
    override func viewWillDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: SETUP THE VIEW
    private func setupView()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
        
        view.addGestureRecognizer(tap)
        
    }

    
    // MARK: Handling Keyboard
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.bottomLoginConstrain.constant == 0 {
                UIView.animate(withDuration: 2) {
                    self.bottomLoginConstrain.constant += (keyboardSize.height - self.loginStackView.frame.height/2 + 20)
                    self.view.layoutIfNeeded()
                }
                
                
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        view.endEditing(true)
        if self.bottomLoginConstrain.constant != 0 {
            UIView.animate(withDuration: 2) {
                self.bottomLoginConstrain.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: unwind from anywhere
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
            
    }
    
    @IBAction func loginButton(_ sender: Any) {
        interactor?.isUserValid(email: email.text, password: password.text)
    }
    
    
    func displayLoginAlertDialog(title: String, message: String){
     self.popupAlert(title: title, message: message, actionTitles: ["OK"], actions:[nil])
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case email:
            password.becomeFirstResponder()
        case password:
            loginButton(self)
        default:
            password.becomeFirstResponder()
        }
        return false
    }
}


// MARK: Login Display Logic
extension LoginViewController: LoginDisplayLogic {
    
    func displayLoginUser(vm: Login.LoginUser.ViewModel) {
        switch vm.data {
        case .failure(let err as ErrorHandler):
            displayLoginAlertDialog(title: err.domain, message: err.description)
        default:
            performSegue(withIdentifier: "Chats", sender: nil)
        }
    }
}
