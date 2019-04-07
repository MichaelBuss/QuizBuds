//
//  QuizCell.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 28/01/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import UIKit

class QuizCell: UICollectionViewCell {
    static let identifier = "quizCellId"
    let cellPadding: CGFloat = 16
    let cellCornerRadius: CGFloat = 24
    
    var category: Category!
    
    let cellView = UIView()
    let cellLabel = UILabel()
    
    let gradientLayer = CAGradientLayer()
    var shadowLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.layer.insertSublayer(shadowLayer, at: 0)

    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        
        self.contentView.addSubview(cellView)
        self.contentView.addSubview(cellLabel)
        
        setupCellView()
        setupCellLabel()
    }
    
    func setupCellLabel() {
        cellLabel.text = category.name ?? "Name not found"
//        print(category.name!)
        cellLabel.font = UIFont.boldSystemFont(ofSize: 40)
        cellLabel.textColor = UIColor(named: "Category Label Color") ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cellLabel.textAlignment = .center
        //cellLabel.adjustsFontSizeToFitWidth = true //Activate to fit text in available space
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.clipsToBounds = true
        cellLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: cellPadding).isActive = true
        cellLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -cellPadding).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    func setupCellView() {
        // Smoothly rounded corners
        
        // Gradient layer
        
        gradientLayer.mask = cornerRadiusSmoothMask(onLayer: gradientLayer.mask as? CAShapeLayer, withRadius: cellCornerRadius)
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x:0, y:0)
        gradientLayer.endPoint = CGPoint(x:1, y:0)
        gradientLayer.colors = [category.gradient.color1?.cgColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), category.gradient.color2?.cgColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
        // Shadow layer
       
        shadowLayer = cornerRadiusSmoothMask(onLayer: shadowLayer, withRadius: cellCornerRadius)
        
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.4
        shadowLayer.shadowOffset = CGSize.init(width: 0, height: 1) //Offsets shadow one point in y direction
        shadowLayer.shadowRadius = 4
        
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
