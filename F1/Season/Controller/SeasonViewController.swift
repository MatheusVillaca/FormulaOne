//
//  DashboardViewController.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit

final class SeasonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var api: F1API = .init()
    
    var races: [Race] = []
    
    lazy var dashboardView: DashboardSeasonView = .init(delegate: self, dataSource: self)
    
    override func loadView() {
        view = dashboardView
        view.backgroundColor = .black
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DashboardSeasonCell = tableView.dequeueReusableCell(withIdentifier: "seasonCell", for: indexPath) as? DashboardSeasonCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        let race: Race = races[indexPath.row]
        cell.setupDashboardCell(title: race.name, image: race.circuit.imageURL, date: race.date, round: "ROUND \(race.round)")
        return cell
    }
    
    init(api: F1API = F1API()) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
        self.title = "Season"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getRaces { seasonResponse in
            DispatchQueue.main.async {
                self.races = seasonResponse?.seasonData.raceTable.races ?? []
                self.dashboardView.dashboardSeasonTableView.reloadData()
            }
        }
    }
}
