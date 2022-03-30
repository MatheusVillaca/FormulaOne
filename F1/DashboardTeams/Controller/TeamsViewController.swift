//
//  TeamsViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 30/03/22.
//

import Foundation
import UIKit

final class TeamsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var teams: [Team] = [.init(name: "Mercedes", logo: "Mercedes"),
                         .init(name: "Red Bull", logo: "RedBull"),
                         .init(name: "Ferrari", logo: "Ferrari"),
                         .init(name: "Aston Martin", logo: "AstonMartin"),
                         .init(name: "Alpha Tauri", logo: "AlphaTauri"),
                         .init(name: "Alfa Romeo", logo: "AlfaRomeo"),
                         .init(name: "McLaren", logo: "McLaren"),
                         .init(name: "Haas", logo: "Haas"),
                         .init(name: "Williams", logo: "Williams"),
                         .init(name: "Alpine", logo: "Alpine")]
    
    lazy var teamsView: DashboardSeasonView = .init(delegate: self, dataSource: self)
    
    override func loadView() {
        view = teamsView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: TeamsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as? TeamsCell else {
            return UICollectionViewCell()
        }
        let team: Team = teams[indexPath.item]
        cell.setupCell(name: team.equipeName, logo: UIImage(named: team.equipeLogo))
        return cell
    }

}
