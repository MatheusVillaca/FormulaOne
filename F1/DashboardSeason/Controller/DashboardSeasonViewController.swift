//
//  DashboardViewController.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class DashboardSeasonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var api: F1API = .init()
    
    var races: [Race] = []
    
    lazy var dashboardView: DashboardSeasonView = .init(delegate: self, dataSource: self)
    
    override func loadView() {
        view = dashboardView
        view.backgroundColor = .white
    }
    
    init(api: F1API = F1API()) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
        self.title = "Season"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return races.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: DashboardSeasonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dashboardCell", for: indexPath) as? DashboardSeasonCell else {
            return UICollectionViewCell()
        }
        let race: Race = races[indexPath.item]
        cell.setupDashboardCell(title: race.name, image: UIImage(named: ""), date: race.date)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getRaces { seasonResponse in
            DispatchQueue.main.async {
                self.races = seasonResponse?.seasonData.raceTable.races ?? []
                self.dashboardView.dashboardSeasonCollectionView.reloadData()
            }
        }
    }
}
