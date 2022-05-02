//
//  DashboardView.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class DashboardSeasonView: UIView, ViewCode {
    
    let dashboardSeasonTableView: UITableView = {
        let dashboardSeasonTableView: UITableView = UITableView(frame: .zero)
        dashboardSeasonTableView.register(DashboardSeasonCell.self, forCellReuseIdentifier: "seasonCell")
        dashboardSeasonTableView.register(TeamsCell.self, forCellReuseIdentifier: "teamsCell")
        dashboardSeasonTableView.showsVerticalScrollIndicator = true
        dashboardSeasonTableView.separatorStyle = .none
        dashboardSeasonTableView.translatesAutoresizingMaskIntoConstraints = false
        return dashboardSeasonTableView
    }()
    
    func setupViewHierarchy() {
        addSubview(dashboardSeasonTableView)
    }
    
    func setupConstraints() {
        dashboardSeasonTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        dashboardSeasonTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dashboardSeasonTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dashboardSeasonTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    init(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        super.init(frame: .zero)
        self.dashboardSeasonTableView.delegate = delegate
        self.dashboardSeasonTableView.dataSource = dataSource
        self.backgroundColor = .black
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
