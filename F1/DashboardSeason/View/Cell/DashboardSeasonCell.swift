//
//  DashboardCell.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class DashboardSeasonCell: UICollectionViewCell, ViewCode {
    
    var backgroundCell: UIImageView = {
        var backgroundCell: UIImageView = UIImageView(frame: .zero)
        backgroundCell.translatesAutoresizingMaskIntoConstraints = false
        return backgroundCell
    }()
    
    var circuitName: UILabel = {
        var circuitName: UILabel = UILabel(frame: .zero)
        circuitName.translatesAutoresizingMaskIntoConstraints = false
        circuitName.font = circuitName.font.withSize(30)
        return circuitName
    }()
    
    var raceDate: UILabel = {
        var raceDate: UILabel = UILabel(frame: .zero)
        raceDate.font = raceDate.font.withSize(20)
        raceDate.translatesAutoresizingMaskIntoConstraints = false
        return raceDate
    }()
    
    func setupDashboardCell(title: String, image: UIImage?, date: String) {
        self.backgroundCell.image = image
        self.circuitName.text = title
        self.raceDate.text = date
        setupViews()
    }
    
    func setupViewHierarchy() {
        addSubview(backgroundCell)
        backgroundCell.addSubview(circuitName)
        backgroundCell.addSubview(raceDate)
    }
    
    func setupConstraints() {
        
        backgroundCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        raceDate.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor).isActive = true
        raceDate.bottomAnchor.constraint(equalTo: circuitName.topAnchor, constant: -4).isActive = true
        
        circuitName.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 4).isActive = true
        circuitName.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -4).isActive = true
        circuitName.bottomAnchor.constraint(equalTo: backgroundCell.bottomAnchor, constant: -4).isActive = true
    }
}
