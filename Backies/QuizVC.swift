//
//  QuizVC.swift
//  Backies
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupNavigationBar()
    }
    
    //MARK: Setup Navigation Bar
    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
}

