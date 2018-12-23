//
//  CategoryCell.swift
//  Backies
//
//  Created by Michael Buss Andersen on 16/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    var category: Category!
    
    var cellView : UIView = {
        let view = UIView()
        return view
    }()
    
    var cellLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, category: Category) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.category = category
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
//        self.backgroundColor = .clear
//        self.layer.cornerRadius = 20
//        self.layer.masksToBounds = true
        setupCellView()
        setupCellLabel()
        self.contentView.addSubview(cellView)
        self.contentView.addSubview(cellLabel)
    }
    
    func setupCellLabel() {
        cellLabel.text = category.name ?? "Name not found"
        cellLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cellLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        translatesAutoresizingMaskIntoConstraints = false
        cellLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: self.contentView.frame.width,
            height: self.contentView.frame.height
        )

    }
    
    func setupCellView() {
        let cellPadding: CGFloat = 16
        
        // Smoothly rounded corners
        let roundPath = UIBezierPath(roundedRect: bounds, cornerRadius: cellPadding)
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        self.layer.mask = maskLayer
        self.layer.masksToBounds = true
        
        self.backgroundColor = category.color.first ?? #colorLiteral(red: 0.8754016757, green: 0, blue: 0.8273025155, alpha: 1)
        // second gradient color here
        
//        translatesAutoresizingMaskIntoConstraints = false
//        self.frame = CGRect(
//            x: cellPadding,
//            y: cellPadding * 0.5,
//            width: self.contentView.frame.width-cellPadding*2,
//            height: self.contentView.frame.height-cellPadding
//        )
    
    }
    
    
}
