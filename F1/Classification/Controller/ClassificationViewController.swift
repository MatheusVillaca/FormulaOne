//
//  ClassificationViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 13/05/22.
//

import Foundation
import UIKit

final class ClassificationViewController: UIViewController, UITableViewDelegate, DelegateSegmentAction {
    
    var api: F1API = .init()
    
    var driverDataSource = DriversDataSource()
    
    var constructorDataSource = ConstructorsDataSource()
    
    lazy var standingView: StandingsNavigationView = .init(delegate: self, tableDelegate: self, tableDataSource: driverDataSource)
    
    override func loadView() {
        view = standingView
        view.backgroundColor = .white
        self.title = "Standings"
    }
    
    func didTapedButton() {
        switch standingView.segmentedControl.selectedSegmentIndex {
        case 0:
            standingView.classificationTableView.dataSource = driverDataSource
            standingView.driverLaber.text = "DRIVER"
        default:
            standingView.classificationTableView.dataSource = constructorDataSource
            standingView.driverLaber.text = "CONSTRUCTOR"
        } 
        standingView.classificationTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getStandings { classificationResponse in
            DispatchQueue.main.async {
                self.driverDataSource.driverStandings = classificationResponse?.mrData.standingsTable.standingsLists.first?.driverStandings ?? []
                self.standingView.classificationTableView.reloadData()
            }
        }
        api.getConstructorsStandings { classificationResponse in
            DispatchQueue.main.async {
                self.constructorDataSource.constructorsStandings = classificationResponse?.mrData.standingsTable.standingsLists.first?.constructorStandings ?? []
                self.standingView.classificationTableView.reloadData()
            }
        }
    }
}
