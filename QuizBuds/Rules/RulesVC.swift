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
    let bottomSpacingView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        
        view.addSubview(textView)
        view.addSubview(imageView)
        view.addSubview(bottomSpacingView)
        
        setupTextView()
        setupImageView()
        setupBottomSpacingView()
        
    }
    
    func setupTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.text = "These are the rules, obey them!"
        textView.textColor = .white
        textView.isEditable = false
        
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "People")
        imageView.image = image

        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomSpacingView.topAnchor).isActive = true
    }
    
    func setupBottomSpacingView() {
        bottomSpacingView.translatesAutoresizingMaskIntoConstraints = false
        bottomSpacingView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        bottomSpacingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}
