//
//  DashboardView.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class SeasonView: UIView, ViewCode {
    
    let seasonTableView: UITableView = {
        let seasonTableView: UITableView = UITableView(frame: .zero)
        seasonTableView.register(SeasonCell.self, forCellReuseIdentifier: "seasonCell")
        seasonTableView.register(TeamsCell.self, forCellReuseIdentifier: "teamsCell")
        seasonTableView.showsVerticalScrollIndicator = true
        seasonTableView.separatorStyle = .none
        seasonTableView.backgroundView = UIImageView(image: UIImage(named: "backgroundf1carbon"))
        seasonTableView.translatesAutoresizingMaskIntoConstraints = false
        return seasonTableView
    }()
    
    func setupViewHierarchy() {
        addSubview(seasonTableView)
    }
    
    func setupConstraints() {
        seasonTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        seasonTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        seasonTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        seasonTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        super.init(frame: .zero)
        self.seasonTableView.delegate = delegate
        self.seasonTableView.dataSource = dataSource
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
