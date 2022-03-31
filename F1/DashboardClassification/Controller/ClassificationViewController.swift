//
//  ClassificationViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 31/03/22.
//

import Foundation
import UIKit

final class ClassificationViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var driversStandings: [DriversNumbers] = []
    
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
//        let round: DriverStandings = driversStandings[indexPath.item]
//        cell.setupCell(round: round.round)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driversStandings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ClassificationCell = tableView.dequeueReusableCell(withIdentifier: "classificationCell", for: indexPath) as? ClassificationCell else {
            return UITableViewCell()
        }
        let driverStanding: DriversNumbers = driversStandings[indexPath.item]
        cell.setupCell(position: driverStanding.position, name: "\(driverStanding.firstName) \(driverStanding.lastName ?? "")" , points: driverStanding.points)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getStandings { classificationResponse in
            DispatchQueue.main.async {
                self.driversStandings = classificationResponse?.standingsData.standingsTable.standingsLists.driverStandings ?? []
                self.classificationView.classificationTableView.reloadData()
            }
        }
    }
    
    
}
