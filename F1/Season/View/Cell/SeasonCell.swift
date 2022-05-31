//
//  DashboardCell.swift
//  Formula1
//
//  Created by Matheus Villaça on 25/03/22.
//

import UIKit
import Kingfisher

final class SeasonCell: UITableViewCell, ViewCode {
    
    var circuitImage: UIImageView = {
        var circuitImage: UIImageView = UIImageView(frame: .zero)
        circuitImage.translatesAutoresizingMaskIntoConstraints = false
        return circuitImage
    }()
    
    var round: UILabel = {
        var round: UILabel = UILabel(frame: .zero)
        round.font = round.font.withSize(15)
        round.textColor = .white
        round.backgroundColor = .clear
        round.translatesAutoresizingMaskIntoConstraints = false
        return round
    }()
    
    var circuitName: UILabel = {
        var circuitName: UILabel = UILabel(frame: .zero)
        circuitName.translatesAutoresizingMaskIntoConstraints = false
        circuitName.font = circuitName.font.withSize(15)
        circuitName.backgroundColor = .clear
        circuitName.numberOfLines = 0
        circuitName.textAlignment = .left
        circuitName.textColor = .white
        return circuitName
    }()
    
    var raceDate: UILabel = {
        var raceDate: UILabel = UILabel(frame: .zero)
        raceDate.font = raceDate.font.withSize(20)
        raceDate.textAlignment = .left
        raceDate.textColor = .white
        raceDate.backgroundColor = .clear
        raceDate.translatesAutoresizingMaskIntoConstraints = false
        return raceDate
    }()
    
    func setupDashboardCell(title: String, image: URL?, date: String, round: String) {
        self.circuitImage.kf.setImage(with: image)
        self.circuitName.text = title
        self.raceDate.text = date
        self.round.text = round
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: -10, bottom: 5, right: 8)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.red.cgColor
        backgroundColor = .clear
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(circuitImage)
        contentView.addSubview(round)
        contentView.addSubview(circuitName)
        contentView.addSubview(raceDate)
    }
    
    func setupConstraints() {
        
        circuitImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        circuitImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        circuitImage.heightAnchor.constraint(equalToConstant: 65).isActive = true
        circuitImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        round.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4).isActive = true
        round.leadingAnchor.constraint(equalTo: circuitImage.trailingAnchor, constant: 40).isActive = true
        round.bottomAnchor.constraint(equalTo: raceDate.topAnchor, constant: -5).isActive = true
        
        raceDate.leadingAnchor.constraint(equalTo: circuitImage.trailingAnchor, constant: 40).isActive = true
        raceDate.bottomAnchor.constraint(equalTo: circuitName.topAnchor, constant: -5).isActive = true

        circuitName.leadingAnchor.constraint(equalTo: circuitImage.trailingAnchor, constant: 40).isActive = true
        circuitName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
    }
}
