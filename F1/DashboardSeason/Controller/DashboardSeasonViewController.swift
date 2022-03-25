//
//  DashboardViewController.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class DashboardSeasonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var api: F1API = .init()
    
    var season: [Race] = [.init(circuitName: "Jehdda", date: "27-03-2022", circuitImage: "jehdda")]
    
    lazy var dashboardView: DashboardSeasonView = .init(delegate: self, dataSource: self)
    
    override func loadView() {
        view = dashboardView
        view.backgroundColor = .white
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
        api.getRaces { RaceResponse in
            DispatchQueue.main.async {
                self.season = RaceResponse?.Races ?? []
                self.dashboardView.dashboardSeasonCollectionView.reloadData()
            }
        }
    }
}
