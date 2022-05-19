//
//  ClassificationDataSource.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 16/05/22.
//

import Foundation
import UIKit

class DriversDataSource: NSObject, UITableViewDataSource {
  
    var driverStandings: [DriverStandings] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverStandings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ClassificationCell = tableView.dequeueReusableCell(withIdentifier: "classificationCell", for: indexPath) as? ClassificationCell else {
            return UITableViewCell()
        }
        let standing: DriverStandings = driverStandings[indexPath.item]
        cell.setupCell(position: standing.position, name: "\(standing.driver.givenName) \(standing.driver.familyName)", points: standing.points)
        return cell
    }
}

class ConstructorsDataSource: NSObject, UITableViewDataSource {
    
    var constructorsStandings: [ConstructorStanding] = []
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return constructorsStandings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ClassificationCell = tableView.dequeueReusableCell(withIdentifier: "classificationCell", for: indexPath) as? ClassificationCell else {
            return UITableViewCell()
        }
        let standing: ConstructorStanding = constructorsStandings[indexPath.item]
        cell.setupCell(position: standing.position, name: standing.constructor.name, points: standing.points)
        return cell
    }
}


