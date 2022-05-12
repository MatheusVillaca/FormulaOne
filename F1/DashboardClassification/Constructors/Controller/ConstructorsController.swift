//
//  ConstructorsController.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 11/05/22.
//

import Foundation
import UIKit

final class ConstructorsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    lazy var constructorsView: ClassificationView = .init(tableDataSource: self, tableDelegate: self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
