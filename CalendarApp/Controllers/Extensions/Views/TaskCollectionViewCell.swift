//
//  TaskCollectionViewCell.swift
//  CalendarApp
//
//  Created by ming xu on 11/29/24.
//
import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties (views)
    
    private let taskText = UILabel()
    private let greenBar = UIView()
    private let trashCan = UIButton()
    private var task: Task?
    
    //MARK: Properties (data)
    static let reuse = "TaskCollectionViewCellReuse"
    
    //MARK: - Init


    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.calendarApp.transpPink
        layer.cornerRadius = 16
        
        setUpTaskText()
        setUpGreenBar()
        setUpTrashCan()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Configure
    func configure(tasks: Task) {
        taskText.text = tasks.message
   
        
    }
    
    //MARK: - Set up views
    private func setUpTaskText() {
        taskText.font = .systemFont(ofSize: 24, weight: .semibold)
        taskText.textColor = UIColor.black
        taskText.numberOfLines = 2
        taskText.lineBreakMode = .byWordWrapping
        
        contentView.addSubview(taskText)
        taskText.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(23)
            make.top.equalToSuperview().offset(22)
           

        }
        
    }
    
    private func setUpTrashCan() {
        trashCan.setImage(UIImage(named:"wastebasket"), for: .normal)
        
        contentView.addSubview(trashCan)
        trashCan.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(14)
            make.bottom.equalToSuperview().inset(14)
            make.height.width.equalTo(28)
            
        }
    }
    
    
    private func setUpGreenBar() {
        greenBar.backgroundColor = UIColor.calendarApp.green
        greenBar.layer.cornerRadius = 4
        greenBar.frame = CGRect(x: 0, y: 0, width: 4, height: 71)

        
        contentView.addSubview(greenBar)
        greenBar.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(18)
            make.width.equalTo(4)
            make.height.equalTo(71)
        }
    }
    
    
}
