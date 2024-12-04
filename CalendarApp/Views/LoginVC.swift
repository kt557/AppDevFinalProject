//
//  LoginVC.swift
//  CalendarApp
//
//  Created by Min Xu on 12/4/24.
//
//
import UIKit


class LoginVC: UIViewController, UINavigationControllerDelegate {
    
    // MARK: - Properties (view)
    private let profileImageView = UIImageView()
    private let username = UILabel()
    private let password = UILabel()
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signInButton = UIButton()
    private let createAccountButton = UIButton()

    // MARK: - Properties (data)
    private let usernameText: String
    private let passwordText: String

    // MARK: - Initializer
    init(usernameText: String, passwordText: String){
        self.usernameText = usernameText
        self.passwordText = passwordText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.calendarApp.offPink
        title = "Login"

        setupProfileImageView()
        setupNameLabel()
        setupPasswordLabel()
        setupSignInButton()
        setupCreateAccountButton()
    }

    // MARK: - Set Up Views
    private func setupProfileImageView() {
        profileImageView.image = UIImage(named: "vin")
        profileImageView.layer.cornerRadius = 48
        profileImageView.layer.masksToBounds = true

        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -265),
            profileImageView.widthAnchor.constraint(equalToConstant: 96),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor)
        ])
    }

    private func setupNameLabel() {
        usernameTextField.layer.borderWidth = 3
        usernameTextField.layer.borderColor = CGColor(red: 1.0, green: 0.4157, blue: 0.7569, alpha: 0.57)
        usernameTextField.layer.cornerRadius = 16
        usernameTextField.text = usernameText
        usernameTextField.backgroundColor = UIColor.calendarApp.offPink
        usernameTextField.textAlignment = .center
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(usernameTextField)
        
        username.text = "Username"
        username.font = UIFont.systemFont(ofSize: 20, weight: .light)
        username.textColor = UIColor.black
        username.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(username)
        
    
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 282),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 252),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            username.bottomAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: -4),
            username.centerXAnchor.constraint(equalTo: usernameTextField.centerXAnchor),
            username.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
        ])    }

    private func setupPasswordLabel() {
        passwordTextField.layer.borderWidth = 3
        passwordTextField.layer.borderColor = CGColor(red: 1.0, green: 0.4157, blue: 0.7569, alpha: 0.57)
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.text = passwordText
        passwordTextField.backgroundColor = UIColor.calendarApp.offPink
        passwordTextField.textAlignment = .center
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(passwordTextField)
        
        password.text = "Password"
        password.font = UIFont.systemFont(ofSize: 20, weight: .light)
        password.textColor = UIColor.black
        password.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(password)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 384),
            passwordTextField.widthAnchor.constraint(equalToConstant: 252),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            password.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -4),
            password.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
        ])
    }

    
    private func setupSignInButton() {
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor(red: 255/255, green: 106/255, blue: 193/255, alpha: 0.57)
        signInButton.setTitleColor(UIColor.black, for: .normal)
        signInButton.layer.cornerRadius = 16
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        signInButton.translatesAutoresizingMaskIntoConstraints = false

        signInButton.addTarget(self, action: #selector(SignInButtonTapped), for: .touchUpInside)

        view.addSubview(signInButton)

        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 474),
            signInButton.widthAnchor.constraint(equalToConstant: 252),
            signInButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    private func setupCreateAccountButton() {
        let createAccountButton = UIButton(type: .system)
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.backgroundColor = UIColor(red: 255/255, green: 106/255, blue: 193/255, alpha: 0.57)
        createAccountButton.setTitleColor(UIColor.black, for: .normal)
        createAccountButton.layer.cornerRadius = 16
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false

        createAccountButton.addTarget(self, action: #selector(CreateAccountButtonTapped), for: .touchUpInside)

        view.addSubview(createAccountButton)

        NSLayoutConstraint.activate([
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 781),
            createAccountButton.heightAnchor.constraint(equalToConstant: 46),
            createAccountButton.widthAnchor.constraint(equalToConstant: 252)
        ])
    }
    
    @objc func SignInButtonTapped() {
        let task = ViewController()
        navigationController?.pushViewController(task, animated: true)
    }
    
    @objc func CreateAccountButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}

