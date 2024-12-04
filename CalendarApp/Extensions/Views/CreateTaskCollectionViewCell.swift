//
//  CreateTaskCollectionViewCell.swift
//  CalendarApp
//
//  Created by ming xu on 11/29/24.
//

import UIKit
import SnapKit

class CreateTaskCollectionViewCell : UICollectionViewCell {
    
    //MARK: - Properties (views)
    private let submitButton = UIButton()
    private let textField = UITextField()
    
    
    
    //MARK: - Properties (data)
    static let reuse = "CreateTaskCollectionViewCellReuse"
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor.calendarApp.white
        layer.cornerRadius = 16
        
        setUpSubmitButton()
        setUpTextField()

       
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up views
    private func setUpSubmitButton() {
        submitButton.backgroundColor = UIColor.calendarApp.transpPink
        submitButton.layer.cornerRadius = 4
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor.calendarApp.black, for: .normal)
        submitButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
       
        contentView.addSubview(submitButton)
        submitButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(134)
            make.width.equalTo(76)
            make.height.equalTo(22)
        }
        
    }
    
    
    private func setUpTextField() {
        textField.placeholder = "📝 Let's get productive!"
        textField.textColor = UIColor.calendarApp.silver
        textField.font = .systemFont(ofSize: 20, weight: .light)
        
        contentView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(25)
            
        }
        
    }
    
}
