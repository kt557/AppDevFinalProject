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
    private var tasks: [Task] = [Task(name: "Ming", month: "January", message: "Submit internship applications", dueDate: "January 1st, 2025"), Task(name: "Ming", month: "January", message: "Submit A7", dueDate: "January 9th, 2025"), Task(name: "Ming", month: "February", message: "Fill out Ivy meal forms", dueDate: "Febrary 7th, 2025"), Task(name: "Ming", month: "March", message: "Finish project team applications", dueDate: "March 7th, 2025")]
   let months: [String] = ["All","January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "Decemeber"]
    var selectedMonth:String? = nil
    var filtered: [Task] = []
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.calendarApp.offPink

        setUpTaskCollectionView()
        setUpCollectionView()
        setUpAddTaskLabel()
        setUpGoodMorningLabel()
//        setUpMonthlyTaskTabel()
        setUpMonthCollectionView()
        
    
    }
    
    //MARK: - Set up Views
    private func setUpMonthCollectionView() {
        let mLayout = UICollectionViewFlowLayout()
        mLayout.scrollDirection = .horizontal
      
        monthCollectionView = UICollectionView(frame: .zero, collectionViewLayout: mLayout)
        monthCollectionView.register(MonthCollectionViewCell.self, forCellWithReuseIdentifier: MonthCollectionViewCell.reuse)
        monthCollectionView.delegate = self
        monthCollectionView.dataSource = self
        monthCollectionView.showsHorizontalScrollIndicator = false
        monthCollectionView.alwaysBounceHorizontal = true
        monthCollectionView.backgroundColor = UIColor.calendarApp.offPink
        
    
        view.addSubview(monthCollectionView)
        monthCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview()
            make.height.equalTo(32)
            make.width.equalTo(116)
        }
        
    }
   
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
        goodMorningLabel.text = "Good Morning, \n Ming"
        goodMorningLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        goodMorningLabel.textColor = UIColor.calendarApp.black
        goodMorningLabel.numberOfLines = 2
        goodMorningLabel.lineBreakMode = .byWordWrapping
        
        view.addSubview(goodMorningLabel)
        
        goodMorningLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(60)
            
        }
        
    }
    
    private func setUpMonthlyTaskTabel() {
        monthlyTaskLabel.text = "Tasks for this month:"
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
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == monthCollectionView {
            selectedMonth = months[indexPath.item]
            print("Tapped on month: \(months[indexPath.item])")
            if selectedMonth == "All" {
                filtered = tasks
            } else {
                if let month = selectedMonth {
                    filtered = tasks.filter { $0.month == month }
                }
            }

        }
        monthCollectionView.reloadData()
    }
}

//MARK: - UICollectionView Data Source

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == createCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTaskCollectionViewCell.reuse, for: indexPath) as? CreateTaskCollectionViewCell else { return UICollectionViewCell() }
            return cell
        }
        else if collectionView == monthCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MonthCollectionViewCell.reuse, for: indexPath) as? MonthCollectionViewCell else { return UICollectionViewCell()}
            cell.configure(month: months[indexPath.row], isSelected: months[indexPath.item] == selectedMonth)
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
        else if collectionView == monthCollectionView {
            return months.count
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
        else if collectionView == monthCollectionView {
            return CGSize(width: 116, height: 32)
        }
        else {
            return CGSize(width: 0, height: 0)
        }
    }
}

