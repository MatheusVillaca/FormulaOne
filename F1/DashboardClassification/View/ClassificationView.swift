//
//  ClassificationView.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 30/03/22.
//

import Foundation
import UIKit

final class ClassificationView: UIView, ViewCode {
    
    let classificationTableView: UITableView = {
        let classificationTableView: UITableView = UITableView(frame: .zero)
        classificationTableView.translatesAutoresizingMaskIntoConstraints = false
        return classificationTableView
    }()
    
    func setupViewHierarchy() {
        addSubview(classificationTableView)
    }
    
    init(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        super.init(frame: .zero)
        self.classificationTableView.dataSource = dataSource
        self.classificationTableView.delegate = delegate
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        classificationTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        classificationTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        classificationTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        classificationTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    
}
