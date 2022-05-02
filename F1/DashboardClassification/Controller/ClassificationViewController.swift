//
//  ClassificationViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 31/03/22.
//

import Foundation
import UIKit

final class ClassificationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var drivers: [Driver] = []
    
    var rounds: [StandingsList] = []
    
    var driverStandings: [DriverStanding] = []
    
    var api: F1API = .init()
   
    lazy var classificationView: ClassificationView = .init(tableDataSource: self, tableDelegate: self, collectionDelegate: self, collectionDataSource: self)
    
    override func loadView() {
        view = classificationView
        view.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: RoundCell = collectionView.dequeueReusableCell(withReuseIdentifier: "roundCell", for: indexPath) as? RoundCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(round: "1")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ClassificationCell = tableView.dequeueReusableCell(withIdentifier: "classificationCell", for: indexPath) as? ClassificationCell else {
            return UITableViewCell()
        }
//        let driver: Driver = drivers[indexPath.item]
//        let driverStanding: DriverStanding = driverStandings[indexPath.item]
//        cell.setupCell(position: driverStanding.position, name: "\(driver.givenName) + \(driver.familyName)", points: driverStanding.points)
        cell.setupCell(position: "1", name: "jao", points: "10")
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getStandings { classificationResponse in
            DispatchQueue.main.async {
                self.drivers = classificationResponse?.mrData.standingsTable.standingsLists.driverStandings.driver ?? []
                self.classificationView.classificationTableView.reloadData()
            }
        }
    }
    
    
}
