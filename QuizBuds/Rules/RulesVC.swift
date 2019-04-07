//
//  RulesVC.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 26/03/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import UIKit

class RulesVC: UIViewController {
    
    let textView = UITextView()
    let imageView = UIImageView()
    
//    var imageViewHeightConstraint: NSLayoutConstraint?
    
    var calculatedImageViewHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        
        view.addSubview(textView)
        view.addSubview(imageView)
        
        setupTextView()
        setupImageView()
        
        layoutTextView()
        layoutImageView()
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
//        self.imageViewHeightConstraint?.constant = view.frame.height/5
//        self.view.layoutIfNeeded()
        updateImageViewHeight()
        self.view.layoutIfNeeded()
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        print("Device Orientation Changed")
//        updateImageViewHeight()
//        self.view.layoutIfNeeded()
//    }

    
    func setupTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.text = "These are the rules, obey them!"
        textView.textColor = .white
    }
    
    func layoutTextView() {
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "People")
        imageView.image = image
    }
    
    func layoutImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        
//        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: view.frame.height/5)
//        imageViewHeightConstraint?.isActive = true
        updateImageViewHeight()
//        imageView.heightAnchor.constraint(equalToConstant: calculatedImageViewHeight).isActive = true
        
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1)
        
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height/14).isActive = true
    }
    
    func updateImageViewHeight() {
        calculatedImageViewHeight = view.frame.height/5
        print("New imageView height: \(calculatedImageViewHeight)")
        self.view.layoutIfNeeded()
    }
    
    
}
