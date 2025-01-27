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
    static let cellPadding: CGFloat = 16
    let cellCornerRadius: CGFloat = 24
    
    var question: Question! {
        didSet{
            layoutSubviews()
            setupCellView()
            setupCellLabel()
            setupCategoryLabel()
        }
    }
    var questionIndex: Int!
    
    let cellView = UIView()
    let textView = UILabel()
    let categoryLabel = UILabel()
    
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
        self.contentView.addSubview(textView)
        self.contentView.addSubview(categoryLabel)
    }
    
    func setupCategoryLabel() {
        // Properties
        categoryLabel.text = "— \(question.category.name!) —"
        categoryLabel.font = UIFont.italicSystemFont(ofSize: 15)
        categoryLabel.textColor = UIColor(named: "Silent Category Label Color") ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        categoryLabel.textAlignment = .center
        categoryLabel.numberOfLines = 0
        
        // Layout
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.clipsToBounds = true
        categoryLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: QuizCell.cellPadding).isActive = true
        categoryLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -QuizCell.cellPadding).isActive = true
        categoryLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: QuizCell.cellPadding).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupCellLabel() {
        // Properties
        textView.text = question.question ?? "Question not found"
        textView.backgroundColor = .clear
        textView.font = UIFont.boldSystemFont(ofSize: 30)
        //textView.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        textView.textColor = UIColor(named: "Category Label Color") ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textView.textAlignment = .center
        textView.numberOfLines = 0
        
        // Layout
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.clipsToBounds = true
        textView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: QuizCell.cellPadding).isActive = true
        textView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -QuizCell.cellPadding).isActive = true
        textView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: QuizCell.cellPadding).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -QuizCell.cellPadding).isActive = true
    }
    
    func setupCellView() {
        // Gradient layer
        gradientLayer.mask = cornerRadiusSmoothMask(onLayer: gradientLayer.mask as? CAShapeLayer, withRadius: cellCornerRadius)
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x:0, y:0)
        gradientLayer.endPoint = CGPoint(x:1, y:0)
        gradientLayer.colors = [question.category.gradient.color1?.cgColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), question.category.gradient.color2?.cgColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
        // Shadow layer
        shadowLayer = cornerRadiusSmoothMask(onLayer: shadowLayer, withRadius: cellCornerRadius)
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.4
        shadowLayer.shadowOffset = CGSize.init(width: 0, height: 1) //Offsets shadow one point in y direction
        shadowLayer.shadowRadius = 4
        
        // Insert layers
        shadowLayer.insertSublayer(gradientLayer, at: 0)
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
