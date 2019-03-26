//
//  RulesVC.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 26/03/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import UIKit

class RulesVC: UIViewController {
    
    let rulesTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        setupRulesTextView()
    }
    
    func setupRulesTextView() {
        rulesTextView.backgroundColor = .clear
        rulesTextView.text = "These are the rules, obey them!"
        rulesTextView.textColor = .white
        
        view.addSubview(rulesTextView)
        
        rulesTextView.translatesAutoresizingMaskIntoConstraints = false
        rulesTextView.frame = view.frame
    }
}
