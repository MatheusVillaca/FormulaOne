//
//  CircuitInformationsView.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 24/05/22.
//

import Kingfisher
import UIKit

final class CircuitInformationsView: UIView, ViewCode {
    
    var posterCircuit: UIImageView = {
        let posterCircuit: UIImageView = UIImageView(frame: .zero)
        posterCircuit.translatesAutoresizingMaskIntoConstraints = false
        return posterCircuit
    }()
    
    var countryFlag: UIImageView = {
        var countryFlag: UIImageView = UIImageView(frame: .zero)
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        return countryFlag
    }()
    
    var circuitName: UILabel = {
        var circuitName: UILabel = UILabel(frame: .zero)
        circuitName.translatesAutoresizingMaskIntoConstraints = false
        return circuitName
    }()
    
    var tableViewDates: UITableView = {
        var tableViewDates: UITableView = UITableView(frame: .zero)
        tableViewDates.register(CircuitInformationCell.self, forCellReuseIdentifier: "CircuitInformationCell")
        tableViewDates.translatesAutoresizingMaskIntoConstraints = false
        return tableViewDates
    }()
    
    var circuitCountry: UILabel = {
        var circuitCountry: UILabel = UILabel(frame: .zero)
        circuitCountry.translatesAutoresizingMaskIntoConstraints = false
        return circuitCountry
    }()
    
    var circuitCity: UILabel = {
        var circuitCity: UILabel = UILabel(frame: .zero)
        circuitCity.translatesAutoresizingMaskIntoConstraints = false
        return circuitCity
    }()

    var circuitMoreInformations: UILabel = {
        var circuitMoreInformations: UILabel = UILabel(frame: .zero)
        circuitMoreInformations.translatesAutoresizingMaskIntoConstraints = false
        return circuitMoreInformations
    }()
    
    init(poster: URL?, flag: URL?, name: String, country: String, city: String, informations: String, delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableViewDates.dataSource = dataSource
        self.tableViewDates.delegate = delegate
        self.posterCircuit.kf.setImage(with: poster)
        self.countryFlag.kf.setImage(with: flag)
        self.circuitName.text = name
        self.circuitCountry.text = country
        self.circuitCity.text = city
        self.circuitMoreInformations.text = informations
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        addSubview(posterCircuit)
        addSubview(countryFlag)
        addSubview(circuitName)
        addSubview(tableViewDates)
        addSubview(circuitCountry)
        addSubview(circuitCity)
        addSubview(circuitMoreInformations)
    }
    
    func setupConstraints() {
        
        posterCircuit.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        posterCircuit.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        posterCircuit.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        posterCircuit.bottomAnchor.constraint(equalTo: countryFlag.topAnchor, constant: -5).isActive = true
        
        countryFlag.topAnchor.constraint(equalTo: posterCircuit.bottomAnchor, constant: 5).isActive = true
        countryFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        countryFlag.trailingAnchor.constraint(equalTo: circuitName.leadingAnchor, constant: 8).isActive = true
        countryFlag.bottomAnchor.constraint(equalTo: tableViewDates.topAnchor, constant: -5).isActive = true
        
        circuitName.topAnchor.constraint(equalTo: posterCircuit.bottomAnchor, constant: 5).isActive = true
        circuitName.leadingAnchor.constraint(equalTo: countryFlag.trailingAnchor, constant: -8).isActive = true
        circuitName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        circuitName.bottomAnchor.constraint(equalTo: tableViewDates.topAnchor, constant: -5).isActive = true
        
        tableViewDates.topAnchor.constraint(equalTo: circuitName.bottomAnchor, constant: 5).isActive = true
        tableViewDates.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableViewDates.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableViewDates.bottomAnchor.constraint(equalTo: circuitCity.topAnchor, constant: -5).isActive = true
        
        circuitCity.topAnchor.constraint(equalTo: tableViewDates.bottomAnchor, constant: 5).isActive = true
        circuitCity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        circuitCity.trailingAnchor.constraint(equalTo: circuitCountry.leadingAnchor, constant: 8).isActive = true
        circuitCity.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        circuitCountry.topAnchor.constraint(equalTo: tableViewDates.bottomAnchor, constant: 5).isActive = true
        circuitCountry.leadingAnchor.constraint(equalTo: circuitCity.trailingAnchor, constant: -8).isActive = true
        circuitCountry.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        circuitCountry.bottomAnchor.constraint(equalTo: circuitMoreInformations.topAnchor, constant: 5).isActive = true
        
        circuitMoreInformations.topAnchor.constraint(equalTo: circuitCountry.bottomAnchor, constant: 5).isActive = true
        circuitMoreInformations.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        circuitMoreInformations.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        circuitMoreInformations.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        
    }
    
}
