//
//  CreateProfile.swift
//  CalendarApp
//
//  Created by ming xu on 12/3/24.
//

import UIKit
import SnapKit


class CreateProfile: UIViewController {
    
    //MARK: Properties (views)
    private let welcomeLabel = UILabel()
    private let createUsername = UILabel()
    private let usernameBox = UITextField()
    private let passwordBox = UITextField()
    private let createPassword = UILabel()
    private let confirmPassword = UILabel()
    private let confirmBox = UITextField()
    private let createButton = UIButton()
  
    
    //MARK: Properties (data)
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.calendarApp.offPink
        setUpWelcomeLabel()
        setUpCreateUsername()
        setUpUsernameText()
        setUpCreatePassword()
        setUpPasswordText()
        setUpConfirmPassword()
        setUpConfirmBox()
        setUpCreateButton()
    }
    
    //MARK: - Setup views
    private func setUpWelcomeLabel () {
        welcomeLabel.text = "Welcome!"
        welcomeLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        welcomeLabel.textColor = UIColor.black
        
        view.addSubview(welcomeLabel)
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(30)
        }
    }
    private func setUpCreateUsername() {
        createUsername.text = "Create a username"
        createUsername.font = .systemFont(ofSize: 20, weight: .light)
        createUsername.textColor = UIColor.calendarApp.silver
        
        view.addSubview(createUsername)
        
        createUsername.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(123)
            make.leading.equalToSuperview().offset(37)
        }
    }
    private func setUpUsernameText() {
        usernameBox.placeholder = "Username"
        usernameBox.font = .systemFont(ofSize: 16, weight: .light)
        usernameBox.textColor = UIColor.calendarApp.black
        usernameBox.layer.borderWidth = 1
        usernameBox.layer.cornerRadius = 16
        usernameBox.layer.borderColor = UIColor.calendarApp.transpPink.cgColor
        usernameBox.setLeftPadding(_amount: 16)
        
        
        view.addSubview(usernameBox)
        
        usernameBox.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(151)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(32)
            
        }
        
        
    }
    
    private func setUpCreatePassword() {
        createPassword.text = "Create a password"
        createPassword.font = .systemFont(ofSize: 20, weight: .light)
        createPassword.textColor = UIColor.calendarApp.silver
        
        view.addSubview(createPassword)
        createPassword.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(225)
            make.leading.equalToSuperview().offset(37)
        }
    }
    
    private func setUpPasswordText() {
        passwordBox.placeholder = "Password"
        passwordBox.textColor = UIColor.black
        passwordBox.font = .systemFont(ofSize: 16, weight: .light)
        passwordBox.layer.borderWidth = 1
        passwordBox.layer.borderColor = UIColor.calendarApp.transpPink.cgColor
        passwordBox.layer.cornerRadius = 16
        passwordBox.setLeftPadding(_amount: 16)
        
        view.addSubview(passwordBox)
        passwordBox.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(253)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(32)
        }
    }
    
    private func setUpConfirmPassword() {
        confirmPassword.text = "Confirm your password"
        confirmPassword.font = .systemFont(ofSize: 20, weight: .light)
        confirmPassword.textColor = UIColor.calendarApp.silver
        
        view.addSubview(confirmPassword)
        confirmPassword.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(321)
            make.leading.equalToSuperview().offset(37)
        }
    }
    private func setUpConfirmBox() {
        confirmBox.placeholder = "Confirm Password"
        confirmBox.textColor = UIColor.black
        confirmBox.font = .systemFont(ofSize: 16, weight: .light)
        confirmBox.layer.borderWidth = 1
        confirmBox.layer.borderColor = UIColor.calendarApp.transpPink.cgColor
        confirmBox.layer.cornerRadius = 16
        confirmBox.setLeftPadding(_amount: 16)
        
        view.addSubview(confirmBox)
        confirmBox.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(349)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(32)
        }
 
    }
    
    private func setUpCreateButton() {
        createButton.setTitle("Create Account", for: .normal)
        createButton.layer.cornerRadius = 16
        createButton.setTitleColor(UIColor.black, for: .normal)
        createButton.backgroundColor = UIColor.calendarApp.transpPink
        createButton.addTarget(self, action: #selector(pushTaskList), for: .touchUpInside)
        view.addSubview(createButton)
        
        createButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(739)
            make.leading.trailing.equalToSuperview().inset(70)
            make.height.equalTo(46)}
    }
    
    //MARK: - Button helpers
    @objc private func pushTaskList() {
        let taskListVC = ViewController()
        navigationController?.pushViewController(taskListVC, animated: true)
    }
    
        

    
}

extension UITextField {
    func setLeftPadding(_amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: _amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

