//
//  ViewCode.swift
//  Formula1
//
//  Created by Matheus Villaça on 09/02/22.
//

import UIKit

protocol ViewCode {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func configureViews()
}
extension ViewCode {
    func configureViews() {}
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
