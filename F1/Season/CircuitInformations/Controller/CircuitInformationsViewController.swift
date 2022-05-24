//
//  CircuitInformationsViewController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 24/05/22.
//

import UIKit

final class CircuitInformationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var circuitInformations: [Race] = []
    
    let api: F1API = .init()
    
    lazy var circuitInformationsView: CircuitInformationsView = .init(poster: circuitInformations.first?.circuit.imageURL, flag: <#T##URL?#>, name: circuitInformations.first?.name ?? "", country: circuitInformations.first?.circuit.location.lat ?? "", city: circuitInformations.first?.circuit.location.lat ?? "", informations: "", delegate: self, dataSource: self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    override func viewDidLoad() {
        api.getRaces { season in
            DispatchQueue.main.async {
                self.circuitInformations = season?.seasonData.raceTable.races ?? []
            }
        }
    }
}
