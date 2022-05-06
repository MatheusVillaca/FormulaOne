//
//  ClassificationCell.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 31/03/22.
//

import Foundation
import UIKit

final class ClassificationCell: UITableViewCell, ViewCode {
    
    let containerPosition: UIView = {
        let containerPosition: UIView = UIView(frame: .zero)
        containerPosition.backgroundColor = .lightGray
        containerPosition.translatesAutoresizingMaskIntoConstraints = false
        return containerPosition
    }()
    
    let containerName: UIView = {
        let containerName: UIView = UIView(frame: .zero)
        containerName.backgroundColor = .white
        containerName.translatesAutoresizingMaskIntoConstraints = false
        return containerName
    }()
    
    let containerPoints: UIView = {
        let containerPoints: UIView = UIView(frame: .zero)
        containerPoints.backgroundColor = .lightGray
        containerPoints.translatesAutoresizingMaskIntoConstraints = false
        return containerPoints
    }()
    
    let positionLabel: UILabel = {
        let positionLabel: UILabel = UILabel(frame: .zero)
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = positionLabel.font.withSize(15)
        positionLabel.textColor = .white
        return positionLabel
    }()
    
    let nameLabel: UILabel = {
        let nameLabel: UILabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = nameLabel.font.withSize(15)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    let pointsLabel: UILabel = {
        let pointsLabel: UILabel = UILabel(frame: .zero)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = pointsLabel.font.withSize(15)
        pointsLabel.textColor = .white
        return pointsLabel
    }()
    
    func setupViewHierarchy() {
        contentView.addSubview(containerPosition)
        contentView.addSubview(containerName)
        contentView.addSubview(containerPoints)
        contentView.addSubview(positionLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(pointsLabel)
    }
    
    func setupCell(position: String, name: String, points: String) {
        self.positionLabel.text = position
        self.nameLabel.text = name
        self.pointsLabel.text = points
        setupViews()
    }
    
    func setupConstraints() {
        
        containerPosition.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerPosition.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        containerPosition.trailingAnchor.constraint(equalTo: containerName.leadingAnchor).isActive = true
        containerPosition.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerPosition.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        containerName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerName.leadingAnchor.constraint(equalTo: containerPosition.trailingAnchor).isActive = true
        containerName.trailingAnchor.constraint(equalTo: containerPoints.leadingAnchor).isActive = true
        containerName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerName.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        containerPoints.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerPoints.leadingAnchor.constraint(equalTo: containerName.trailingAnchor).isActive = true
        containerPoints.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        containerPoints.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        containerPoints.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        positionLabel.centerXAnchor.constraint(equalTo: containerPosition.centerXAnchor).isActive = true
        positionLabel.centerYAnchor.constraint(equalTo: containerPosition.centerYAnchor).isActive = true
        
        nameLabel.centerXAnchor.constraint(equalTo: containerName.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: containerName.centerYAnchor).isActive = true
        
        pointsLabel.centerXAnchor.constraint(equalTo: containerPoints.centerXAnchor).isActive = true
        pointsLabel.centerYAnchor.constraint(equalTo: containerPoints.centerYAnchor).isActive = true
    }
    
    
}
