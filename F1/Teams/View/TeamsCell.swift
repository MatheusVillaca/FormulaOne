//
//  TeamsCell.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 30/03/22.
//

import Foundation
import UIKit

final class TeamsCell: UITableViewCell, ViewCode {
    
    var equipeName: UILabel = {
        var equipeName: UILabel = UILabel(frame: .zero)
        equipeName.font = equipeName.font.withSize(20)
        equipeName.textColor = .white
        equipeName.translatesAutoresizingMaskIntoConstraints = false
        return equipeName
    }()
    
    var equipeLogo: UIImageView = {
        var equipeLogo: UIImageView = UIImageView(frame: .zero)
        equipeLogo.translatesAutoresizingMaskIntoConstraints = false
        return equipeLogo
    }()
    
    func setupCell(name: String, logo: UIImage?) {
        self.equipeName.text = name
        self.equipeLogo.image = logo
        setupViews()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(equipeLogo)
        contentView.addSubview(equipeName)
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
    
    func setupConstraints() {
        
        equipeLogo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        equipeLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        equipeLogo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        equipeLogo.widthAnchor.constraint(equalToConstant: 80).isActive = true
        equipeLogo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        equipeName.leadingAnchor.constraint(equalTo: equipeLogo.trailingAnchor, constant: 40).isActive = true
        equipeName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        equipeName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    
}
