//
//  TeamsViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 30/03/22.
//

import Foundation
import UIKit

final class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TeamsCell = tableView.dequeueReusableCell(withIdentifier: "teamsCell", for: indexPath) as? TeamsCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        let team: Team = teams[indexPath.row]
        cell.setupCell(name: team.equipeName, logo: UIImage(named: team.equipeLogo))
        return cell
    }
}
