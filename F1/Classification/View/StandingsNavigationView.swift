//
//  StandingsNavigationView.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 13/05/22.
//

import UIKit

protocol DelegateSegmentAction {
    func didTapedButton()
}

final class StandingsNavigationView: UIView, ViewCode {
    
    let titleLabel: UILabel = {
        let titleLabel: UILabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = titleLabel.font.withSize(20)
        titleLabel.textColor = .white
        titleLabel.text = "CLASSIFICATION"
        return titleLabel
    }()
    
    let positionLabel: UILabel = {
        let positionLabel: UILabel = UILabel(frame: .zero)
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        positionLabel.font = positionLabel.font.withSize(10)
        positionLabel.textColor = .black
        positionLabel.text = "POSITION"
        return positionLabel
    }()
    
    let driverLaber: UILabel = {
        let driverLaber: UILabel = UILabel(frame: .zero)
        driverLaber.translatesAutoresizingMaskIntoConstraints = false
        driverLaber.font = driverLaber.font.withSize(10)
        driverLaber.textColor = .black
        driverLaber.text = "DRIVER"
        return driverLaber
    }()
    
    let pointsLabel: UILabel = {
        let pointsLabel: UILabel = UILabel(frame: .zero)
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = pointsLabel.font.withSize(10)
        pointsLabel.textColor = .black
        pointsLabel.text = "POINTS"
        return pointsLabel
    }()
    
    
    let classificationTableView: UITableView = {
        let classificationTableView: UITableView = UITableView(frame: .zero)
        classificationTableView.register(ClassificationCell.self, forCellReuseIdentifier: "classificationCell")
        classificationTableView.backgroundView = UIImageView(image: UIImage(named: "backgroundf1carbon"))
        classificationTableView.translatesAutoresizingMaskIntoConstraints = false
        return classificationTableView
    }()
    
    var titles: [String] = ["Drivers", "Constructors"]
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: titles)
        segmentedControl.addTarget(self, action: #selector(didTapedButton), for: .valueChanged)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = UIColor.black.cgColor
        segmentedControl.layer.masksToBounds = true
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .systemRed
        segmentedControl.tintColor = .systemRed
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    var delegate: DelegateSegmentAction?
    
    init(delegate: DelegateSegmentAction, tableDelegate: UITableViewDelegate, tableDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.classificationTableView.delegate = tableDelegate
        self.classificationTableView.dataSource = tableDataSource
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        addSubview(segmentedControl)
        addSubview(titleLabel)
        addSubview(classificationTableView)
        addSubview(positionLabel)
        addSubview(driverLaber)
        addSubview(pointsLabel)
    }
    
    func setupConstraints() {
        
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        positionLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8).isActive = true
        positionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        positionLabel.trailingAnchor.constraint(equalTo: driverLaber.leadingAnchor, constant: -10).isActive = true
        positionLabel.bottomAnchor.constraint(equalTo: classificationTableView.topAnchor, constant: -5).isActive = true
        
        driverLaber.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8).isActive = true
        driverLaber.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        driverLaber.bottomAnchor.constraint(equalTo: classificationTableView.topAnchor, constant: -5).isActive = true
        
        pointsLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8).isActive = true
        pointsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        pointsLabel.bottomAnchor.constraint(equalTo: classificationTableView.topAnchor, constant: -5).isActive = true
        
        classificationTableView.topAnchor.constraint(equalTo: driverLaber.bottomAnchor, constant: 2).isActive = true
        classificationTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        classificationTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        classificationTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    @objc func didTapedButton() {
        delegate?.didTapedButton()
    }
}
