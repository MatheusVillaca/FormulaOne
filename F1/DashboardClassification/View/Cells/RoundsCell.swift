//
//  RoundsCell.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 31/03/22.
//

import Foundation
import UIKit

final class RoundCell: UICollectionViewCell, ViewCode {
    
    let containerRoundView: UIView = {
        let containerRoundView: UIView = UIView(frame: .zero)
        containerRoundView.translatesAutoresizingMaskIntoConstraints = false
        containerRoundView.backgroundColor = .orange
        containerRoundView.layer.borderWidth = 2
        return containerRoundView
    }()
    
    let roundLabel: UILabel = {
        let roundLabel: UILabel = UILabel(frame: .zero)
        roundLabel.translatesAutoresizingMaskIntoConstraints = false
        roundLabel.font = roundLabel.font.withSize(15)
        return roundLabel
    }()
    
    func setupCell(round: String) {
        self.roundLabel.text = round
        setupViews()
    }
    
    func configureViews() {
        self.containerRoundView.clipsToBounds = true
        self.containerRoundView.layer.cornerRadius = 5
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(containerRoundView)
        contentView.addSubview(roundLabel)
    }
    
    func setupConstraints() {
        
        containerRoundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        containerRoundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        containerRoundView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        containerRoundView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        roundLabel.centerXAnchor.constraint(equalTo: containerRoundView.centerXAnchor).isActive = true
        roundLabel.centerYAnchor.constraint(equalTo: containerRoundView.centerYAnchor).isActive = true
    }
    
}
