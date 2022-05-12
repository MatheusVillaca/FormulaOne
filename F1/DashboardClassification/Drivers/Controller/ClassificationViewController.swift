//
//  ClassificationViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 31/03/22.
//

import Foundation
import UIKit

final class ClassificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var drivers: [Driver] = []
    
    var driverStandings: [DriverStanding] = []
    
    var api: F1API = .init()
   
    lazy var classificationView: ClassificationView = .init(tableDataSource: self, tableDelegate: self)
    
    override func loadView() {
        view = classificationView
        view.backgroundColor = .white
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ClassificationCell = tableView.dequeueReusableCell(withIdentifier: "classificationCell", for: indexPath) as? ClassificationCell else {
            return UITableViewCell()
        }
        let driver: Driver = drivers[indexPath.item]
        let position: DriverStanding = driverStandings[indexPath.item]
        cell.setupCell(position: position.position, name: "\(driver.givenName) \(driver.familyName)", points: position.points)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getStandings { classificationResponse in
            DispatchQueue.main.async {
                self.drivers = classificationResponse?.mrData.standingsTable.standingsLists.first?.driverStandings.map({$0.driver}) ?? []
                self.driverStandings = classificationResponse?.mrData.standingsTable.standingsLists.first?.driverStandings ?? []
                self.classificationView.classificationTableView.reloadData()
            }
        }
    }
    
    
}
