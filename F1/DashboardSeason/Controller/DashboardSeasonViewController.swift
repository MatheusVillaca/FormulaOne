//
//  DashboardViewController.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class DashboardSeasonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var api: F1API = .init()
    
    var season: [Race] = []
    
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
        return season.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: DashboardSeasonCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dashboardCell", for: indexPath) as? DashboardSeasonCell else {
            return UICollectionViewCell()
        }
        let race: Race = season[indexPath.item]
        cell.setupDashboardCell(title: race.circuitName, image: UIImage(named: race.circuitImageName), date: race.raceDate)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getRaces { RaceInfo in
            DispatchQueue.main.async {
                self.season = RaceInfo?.Races ?? []
                self.dashboardView.dashboardSeasonCollectionView.reloadData()
            }
        }
    }
}
