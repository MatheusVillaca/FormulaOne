//
//  TeamsCell.swift
//  FormulaOne
//
//  Created by Matheus Villaça on 30/03/22.
//

import Foundation
import UIKit

final class TeamsCell: UICollectionViewCell, ViewCode {
    
    var equipeName: UILabel = {
        var equipeName: UILabel = UILabel(frame: .zero)
        equipeName.font = equipeName.font.withSize(35)
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
        addSubview(equipeLogo)
        addSubview(equipeName)
    }
    
    func setupConstraints() {
        
        equipeLogo.topAnchor.constraint(equalTo: topAnchor).isActive = true
        equipeLogo.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        equipeLogo.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        equipeLogo.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        equipeName.leadingAnchor.constraint(equalTo: equipeLogo.leadingAnchor, constant: 5).isActive = true
        equipeName.trailingAnchor.constraint(equalTo: equipeLogo.trailingAnchor, constant: -5).isActive = true
        equipeName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
    }
    
    
}
