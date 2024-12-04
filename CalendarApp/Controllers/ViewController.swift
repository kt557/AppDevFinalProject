//
//  ViewController.swift
//  CalendarApp
//
//  Created by ming xu on 11/25/24.
//

import UIKit
import SnapKit



class ViewController: UIViewController {
    
    //MARK: - Properties (views)
    private let addTaskLabel = UILabel()
    private let goodMorningLabel = UILabel()
    private let monthlyTaskLabel = UILabel()
    private var createCollectionView: UICollectionView!
    private var monthCollectionView: UICollectionView!
    private var taskCollectionView: UICollectionView!
    
    
    //MARK: - Properties (data)
    private var tasks: [Task] = [Task( message: "Submit internship applications"), Task( message: "Submit A7"), Task( message: "Fill out Ivy meal forms"), Task(message: "Finish project team applications")]
    private var users: [User] = [User(id: "shjdksdjskd", username: "mingnaxu3", password: "helloWorld")]
    private var currentUser: User?
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.calendarApp.offPink
        
        currentUser = users.first

        setUpTaskCollectionView()
        setUpCollectionView()
        setUpAddTaskLabel()
        setUpGoodMorningLabel()
        setUpMonthlyTaskTabel()


    
    }
    
    //MARK: - Set up Views
   
    private func setUpAddTaskLabel() {
        addTaskLabel.text = "Add a task:"
        addTaskLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        addTaskLabel.textColor = UIColor.calendarApp.black
        
        view.addSubview(addTaskLabel)
        
        addTaskLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().inset(600)
        }
    }
    
    private func setUpGoodMorningLabel() {
      
        goodMorningLabel.text = "Good Morning, \n \( currentUser?.username ?? "User")"
        goodMorningLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        goodMorningLabel.textColor = UIColor.calendarApp.black
        goodMorningLabel.numberOfLines = 2
        goodMorningLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(goodMorningLabel)
        
        goodMorningLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(30)
            make.top.equalToSuperview().offset(60)
            
        }
        
    }
    
    private func setUpMonthlyTaskTabel() {
        monthlyTaskLabel.text = "Tasks:"
        monthlyTaskLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        monthlyTaskLabel.textColor = UIColor.black
        
        view.addSubview(monthlyTaskLabel)
        monthlyTaskLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(18)
            make.top.equalToSuperview().offset(160)}
        
    }
    
    private func setUpTaskCollectionView() {
        let tLayout = UICollectionViewFlowLayout()
        tLayout.scrollDirection = .vertical
        
        
        taskCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tLayout)
        taskCollectionView.register(TaskCollectionViewCell.self, forCellWithReuseIdentifier: TaskCollectionViewCell.reuse)
        taskCollectionView.dataSource = self
        taskCollectionView.delegate = self
        taskCollectionView.backgroundColor = UIColor.calendarApp.offPink
        
        taskCollectionView.alwaysBounceVertical = true
        view.addSubview(taskCollectionView)
        
        taskCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(400)
           
        }
    }
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 24
        
        createCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        createCollectionView.register(CreateTaskCollectionViewCell.self, forCellWithReuseIdentifier: CreateTaskCollectionViewCell.reuse)
        createCollectionView.delegate = self
        createCollectionView.dataSource = self
        
        createCollectionView.backgroundColor = UIColor.calendarApp.offPink
        
        view.addSubview(createCollectionView)
        createCollectionView.snp.makeConstraints { make in
            make.top.equalTo(taskCollectionView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(400)
            
        }
        
    }

    


}

//MARK: - UICollectionView Delegate
extension ViewController: UICollectionViewDelegate {}

//MARK: - UICollectionView Data Source

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == createCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTaskCollectionViewCell.reuse, for: indexPath) as? CreateTaskCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
        
        else if collectionView == taskCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCollectionViewCell.reuse, for: indexPath) as? TaskCollectionViewCell else { return UICollectionViewCell()}
            cell.configure(tasks: tasks[indexPath.row])
            return cell
        }
        else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == createCollectionView {
            return 1
        }
        
        else if collectionView == taskCollectionView {
            return tasks.count
        }
        else {
            return 0
        }
    }
    
   
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 24, left: 24, bottom: 16, right: 24)
//    }
    
}

//MARK: - UICollectionView Delegate Flow Layout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == createCollectionView {
            return CGSize(width: 300, height: 168)
        }
        else if  (collectionView == taskCollectionView){
            return CGSize(width: 300, height: 168)
        }
        
        else {
            return CGSize(width: 0, height: 0)
        }
    }
}

