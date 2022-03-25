//
//  DashboardView.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class DashboardSeasonView: UIView, ViewCode {
    
    let dashboardSeasonCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 5, height: UIScreen.main.bounds.width / 2 * 1.6)
        flowLayout.scrollDirection = .vertical
        let dashboardSeasonCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        dashboardSeasonCollectionView.register(DashboardSeasonCell.self, forCellWithReuseIdentifier: "dashboardCell")
        dashboardSeasonCollectionView.contentInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        dashboardSeasonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return dashboardSeasonCollectionView
    }()
    
    func setupViewHierarchy() {
        addSubview(dashboardSeasonCollectionView)
    }
    
    func setupConstraints() {
        dashboardSeasonCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        dashboardSeasonCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        dashboardSeasonCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        dashboardSeasonCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    init(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource){
        super.init(frame: .zero)
        self.dashboardSeasonCollectionView.delegate = delegate
        self.dashboardSeasonCollectionView.dataSource = dataSource
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
