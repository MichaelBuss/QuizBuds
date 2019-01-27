//
//  CategoryCell.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 26/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "categoryCellId"
    let cellPadding: CGFloat = 16
    let cellCornerRadius: CGFloat = 24
    
    var category: Category!
    
    let cellView = UIView()
    let cellLabel = UILabel()
    let cellSwitch = UISwitch()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        
        self.contentView.addSubview(cellView)
        self.contentView.addSubview(cellSwitch)
        self.contentView.addSubview(cellLabel)
        
        setupCellView()
        setupCellSwitch()
        setupCellLabel()
    }
    
    func setupCellSwitch() {
        cellSwitch.translatesAutoresizingMaskIntoConstraints = false
        cellSwitch.isOn = category.isActive!
        cellSwitch.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: cellPadding).isActive = true
        cellSwitch.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        cellSwitch.addTarget(self, action: #selector(switchAction), for: .valueChanged)
    }
    
    @objc func switchAction(sender: UISwitch!){
        print("Value of switch changed, now switch is \(sender.isOn)")
        category.isActive = sender.isOn
    }
    
    func setupCellLabel() {
        cellLabel.text = category.name ?? "Name not found"
        cellLabel.font = UIFont.boldSystemFont(ofSize: 50)
        cellLabel.textColor = UIColor(named: "Category Label Color") ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //cellLabel.adjustsFontSizeToFitWidth = true //Activate to fit text in available space
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.clipsToBounds = true
        cellLabel.leftAnchor.constraint(equalTo: cellSwitch.rightAnchor, constant: cellPadding).isActive = true
        cellLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -cellPadding).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    func setupCellView() {
        // Smoothly rounded corners
        
        // Gradient layer
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.mask = cornerRadiusSmoothMask(radius: cellCornerRadius)
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x:0, y:0)
        gradientLayer.endPoint = CGPoint(x:1, y:0)
        gradientLayer.colors = [category.gradient.color1?.cgColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), category.gradient.color2?.cgColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
        // Shadow layer
        let shadowLayer = cornerRadiusSmoothMask(radius: cellCornerRadius)
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowOffset = CGSize.zero
        shadowLayer.shadowRadius = 10
        shadowLayer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        
        shadowLayer.insertSublayer(gradientLayer, at: 0)
        
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func populate(withCategory category: Category){
        self.category = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
