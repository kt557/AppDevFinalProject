//
//  MonthCollectionViewCell.swift
//  CalendarApp
//
//  Created by ming xu on 11/29/24.
//

import UIKit
import SnapKit
import Foundation

protocol MonthCollectionViewCellDelegate: AnyObject {
    func selectedMonth(index:Int)
}
class MonthCollectionViewCell : UICollectionViewCell {
    
    //MARK: - Properties (views)
    private let monthLabel = UILabel()
    
    //MARK: - Properties (data)
    static let reuse = "MonthCollectionViewCellReuse"
    weak var delegate: MonthCollectionViewCellDelegate?
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setUpMonthLabel()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Configure
    func configure(month: String, isSelected: Bool) {
        monthLabel.text = month
        self.isSelected = isSelected
        monthTapped()
        
        
    }
    
    //MARK: - Set up views
    private func setUpMonthLabel() {
        monthLabel.backgroundColor = UIColor.calendarApp.silver
        monthLabel.font = .systemFont(ofSize: 12, weight: .semibold)
        monthLabel.textColor = UIColor.calendarApp.black
        monthLabel.layer.cornerRadius = 8
        monthLabel.layer.masksToBounds = true
        
        monthLabel.textAlignment = .center
        let tap = UITapGestureRecognizer(target: self, action: #selector(isTapped))
        
        contentView.addSubview(monthLabel)
        monthLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview().inset(4)
            make.height.equalTo(32)
            make.width.equalTo(116)

        }
        
        
    }
    private func monthTapped() {
        if isSelected {
            monthLabel.backgroundColor = UIColor.calendarApp.darkPink
            monthLabel.textColor = UIColor.calendarApp.white
        }
        else {
            monthLabel.backgroundColor = UIColor.calendarApp.silver
            monthLabel.textColor = UIColor.calendarApp.black
        }
    }
    
    @objc private func isTapped() {
        isSelected.toggle()
        monthTapped()
        delegate?.selectedMonth(index: tag)
    }
    
    
    
}
