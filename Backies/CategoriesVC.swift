//
//  CategoriesVC.swift
//  Backies
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private let categories = CategoryData.getCategories() // Model
    let categoriesTableView = UITableView() // TableView
    let categoryCellID = "categoryCellId"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        setupNavigationBar()
        setupViewHierachy()
        setupCategoriesTableView()
    }
    
    // Setup view hierachy in correct order
    private func setupViewHierachy() {
        view.addSubview(categoriesTableView) // Table view must be first to make large title shrink when scrolling
    }
    
    //MARK: Table View
    func setupCategoriesTableView() {
        categoriesTableView.register(CategoryCell.self, forCellReuseIdentifier: categoryCellID)
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoriesTableView.backgroundColor = .clear
//        categoriesTableView.contentInset.top = CategoryCell.cellPadding * 0.5

        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false // Enables AutoLayout
        categoriesTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        categoriesTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        categoriesTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        categoriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CategoryCell = CategoryCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: categoryCellID, category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    //MARK: Setup Navigation Bar
    func setupNavigationBar() {
        
        // Title
        self.title = "Categories"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Buttons
        let settingsButton = UIBarButtonItem(image: UIImage(named: "Settings"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        let editButton = UIBarButtonItem(image: UIImage(named: "Edit"), style: .plain, target: self, action: #selector(editButtonTapped))
        let helpButton = UIBarButtonItem(image: UIImage(named: "Help"), style: .plain, target: self, action: #selector(helpButtonTapped))
        let playButton = UIBarButtonItem(image: UIImage(named: "Play"), style: .plain, target: self, action: #selector(playButtonTapped))

        navigationItem.leftBarButtonItems = [settingsButton, editButton]
        navigationItem.rightBarButtonItems = [playButton, helpButton]
    }
    
    @objc func settingsButtonTapped() {
        print("Settings Tapped")
    }
    
    @objc func editButtonTapped() {
        print("Edit Tapped")
    }
    
    @objc func playButtonTapped() {
        print("Play Tapped")
        let nextVC = QuizVC()
        nextVC.title = "Quiz 🎉"
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func helpButtonTapped() {
        print("Help Tapped")
    }
    
}
