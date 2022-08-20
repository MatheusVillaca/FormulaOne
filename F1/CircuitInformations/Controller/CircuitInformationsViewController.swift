//
//  CircuitInformationsViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 24/05/22.
//

import UIKit

final class CircuitInformationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DelegateMoreInformationsLink {
    
    var circuitInformations: Race
    
    let api: F1API = .init()

    lazy var circuitInformationsView: CircuitInformationsView = .init(poster: circuitInformations.circuit.imageURL, name: circuitInformations.circuit.circuitName, country: circuitInformations.circuit.location.country, city: circuitInformations.circuit.location.locality, delegateMoreInformations: self, delegate: self, dataSource: self)
    
    override func loadView() {
        view = circuitInformationsView
        self.title = "\(circuitInformationsView.circuitName)"
    }
    
    func openUrl(_ url: String) {
        if let url = URL(string: url) {
            UIApplication.shared.canOpenURL(url)
        }
    }
    
    init(_ race: Race) {
        self.circuitInformations = race
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circuitInformations.date.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CircuitInformationCell = tableView.dequeueReusableCell(withIdentifier: "circuitInformationCell", for: indexPath) as? CircuitInformationCell else {
            return UITableViewCell()
        }
        let circuit = circuitInformations
        cell.setupCell(title: circuit.raceName, date: circuit.date, time: circuit.time)
        return cell
    }
}
