//
//  ClassificationView.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 30/03/22.
//

import Foundation
import UIKit

final class ClassificationView: UIView, ViewCode {
    
    let titleLabel: UILabel = {
        let titleLabel: UILabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = titleLabel.font.withSize(20)
        titleLabel.text = "ROUNDS"
        return titleLabel
    }()
    
    let positionLabel: UILabel = {
        let positionLabel: UILabel = UILabel(frame: .zero)
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = positionLabel.font.withSize(20)
        positionLabel.text = "Position"
        return positionLabel
    }()
    
    let driverLaber: UILabel = {
        let driverLaber: UILabel = UILabel(frame: .zero)
        driverLaber.translatesAutoresizingMaskIntoConstraints = false
        driverLaber.font = driverLaber.font.withSize(20)
        driverLaber.text = "Driver"
        return driverLaber
    }()
    
    let pointsLabel: UILabel = {
        let pointsLabel: UILabel = UILabel(frame: .zero)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = pointsLabel.font.withSize(20)
        pointsLabel.text = "Points"
        return pointsLabel
    }()
    
    let roundsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let roundsCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        roundsCollectionView.register(RoundCell.self, forCellWithReuseIdentifier: "roundCell")
        roundsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return roundsCollectionView
    }()
    
    let classificationTableView: UITableView = {
        let classificationTableView: UITableView = UITableView(frame: .zero)
        classificationTableView.register(ClassificationCell.self, forCellReuseIdentifier: "classificationCell")
        classificationTableView.translatesAutoresizingMaskIntoConstraints = false
        return classificationTableView
    }()
    
    func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(roundsCollectionView)
        addSubview(classificationTableView)
        addSubview(positionLabel)
        addSubview(driverLaber)
        addSubview(pointsLabel)
    }
    
    init(tableDataSource: UITableViewDataSource, tableDelegate: UITableViewDelegate, collectionDelegate: UICollectionViewDelegate, collectionDataSource: UICollectionViewDataSource) {
        super.init(frame: .zero)
        self.classificationTableView.dataSource = tableDataSource
        self.classificationTableView.delegate = tableDelegate
        self.roundsCollectionView.dataSource = collectionDataSource
        self.roundsCollectionView.delegate = collectionDelegate
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: roundsCollectionView.topAnchor, constant: -8).isActive = true
        
        positionLabel.topAnchor.constraint(equalTo: roundsCollectionView.bottomAnchor, constant: 5).isActive = true
        positionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        positionLabel.trailingAnchor.constraint(equalTo: driverLaber.leadingAnchor, constant: -10).isActive = true
        positionLabel.bottomAnchor.constraint(equalTo: classificationTableView.topAnchor, constant: -5).isActive = true
        
        driverLaber.topAnchor.constraint(equalTo: roundsCollectionView.bottomAnchor, constant: 5).isActive = true
        driverLaber.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        driverLaber.bottomAnchor.constraint(equalTo: classificationTableView.topAnchor, constant: -5).isActive = true
        
        pointsLabel.topAnchor.constraint(equalTo: roundsCollectionView.bottomAnchor, constant: 5).isActive = true
        pointsLabel.leadingAnchor.constraint(equalTo: driverLaber.trailingAnchor, constant: -5).isActive = true
        pointsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        pointsLabel.bottomAnchor.constraint(equalTo: classificationTableView.topAnchor, constant: -5).isActive = true
        
//        roundsCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        roundsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        roundsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        roundsCollectionView.bottomAnchor.constraint(equalTo: classificationTableView.topAnchor, constant: 10).isActive = true
        roundsCollectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        classificationTableView.topAnchor.constraint(equalTo: roundsCollectionView.bottomAnchor, constant: -10).isActive = true
        classificationTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        classificationTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        classificationTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    
}
