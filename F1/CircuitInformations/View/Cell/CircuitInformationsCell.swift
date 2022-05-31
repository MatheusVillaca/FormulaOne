//
//  CircuitInformationsCell.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 24/05/22.
//

import UIKit

final class CircuitInformationCell: UITableViewCell, ViewCode {
    
    var titleDate: UILabel = {
        var titleDate: UILabel = UILabel(frame: .zero)
        titleDate.font = titleDate.font.withSize(20)
        titleDate.translatesAutoresizingMaskIntoConstraints = false
        return titleDate
    }()
    
    var date: UILabel = {
        var date: UILabel = UILabel(frame: .zero)
        date.font = date.font.withSize(12)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    var time: UILabel = {
        var time: UILabel = UILabel(frame: .zero)
        time.font = time.font.withSize(12)
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    func setupCell(title: String, date: String, time: String) {
        self.titleDate.text = title
        self.date.text = date
        self.time.text = time
        setupViews()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(titleDate)
        contentView.addSubview(date)
        contentView.addSubview(time)
    }
    
    func setupConstraints() {
        
        date.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        date.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        date.trailingAnchor.constraint(equalTo: titleDate.leadingAnchor, constant: -5).isActive = true
        date.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        titleDate.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        titleDate.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 5).isActive = true
        titleDate.bottomAnchor.constraint(equalTo: time.topAnchor, constant: -5).isActive = true
        
        time.topAnchor.constraint(equalTo: titleDate.bottomAnchor, constant: 5).isActive = true
        time.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 5).isActive = true
        time.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
}
