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
    
    lazy var dashboardView: SeasonView = .init(delegate: self, dataSource: self)
    
    override func loadView() {
        view = dashboardView
        self.title = "Season"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SeasonCell = tableView.dequeueReusableCell(withIdentifier: "seasonCell", for: indexPath) as? SeasonCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        let race: Race = races[indexPath.row]
        cell.setupDashboardCell(title: race.name, image: race.circuit.imageURL, date: race.date, round: "ROUND \(race.round)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCircuit: Race = races[indexPath.row]
        let circuitInformations: CircuitInformationsViewController = .init(selectedCircuit)
        navigationController?.pushViewController(circuitInformations, animated: true)
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
                self.dashboardView.seasonTableView.reloadData()
            }
        }
    }
}
