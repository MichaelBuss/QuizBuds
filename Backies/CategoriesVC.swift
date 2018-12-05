//
//  CategoriesVC.swift
//  Backies
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    let nextButton = UIButton()
    private let categories = CategoryData.getCategoreis() // Model
    let categoriesTableView = UITableView() // TableView
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViewHierachy()
        setupNextButton()
        setupCategoreisTableView()
        
    }
    
    // Setup view hierachy in correct order
    private func setupViewHierachy() {
        view.addSubview(categoriesTableView) // Table view must be first to make large title shrink when scrolling
        view.addSubview(nextButton)
    }
    
    //MARK: Table View
    func setupCategoreisTableView() {
        categoriesTableView.backgroundColor = UIColor(named: "Background")
        
        setCategoriesTableViewConstraints()
    }
    
    func setCategoriesTableViewConstraints(){
        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false // Enables AutoLayout
        categoriesTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        categoriesTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        categoriesTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        categoriesTableView.bottomAnchor.constraint(equalTo:nextButton.topAnchor).isActive = true
    }
    
    //MARK: Next Button
    // Properties
    func setupNextButton() {
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setTitle("Start", for: .normal)
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        setNextButtonConstraints()
    }
    
    // Action
    @objc func nextButtonTapped() {
        let nextVC = QuizVC()
        nextVC.title = "Quiz 🎉"
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // Constraints
    func setNextButtonConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false // Enables AutoLayout
        nextButton.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 72).isActive = true
    }

    //MARK: Setup Navigation Bar
    func setupNavigationBar() {
        
        // Title
        self.title = "Categoreis"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Search Controller
//        let searchController = UISearchController(searchResultsController: nil)
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = true
        
        // Buttons
        let settingsButton = UIBarButtonItem(image: UIImage(named: "Settings"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
        navigationItem.leftBarButtonItem = settingsButton
        navigationItem.rightBarButtonItem = editButton
    }
    
    @objc func settingsButtonTapped() {
        print("Settings Tapped")
    }
    
    @objc func editButtonTapped() {
        print("Edit Tapped")
    }
}
