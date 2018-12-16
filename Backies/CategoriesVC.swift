//
//  CategoriesVC.swift
//  Backies
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController {
    
    
    private let categories = CategoryData.getCategories() // Model
    let categoriesTableView = UITableView() // TableView
    

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
        categoriesTableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) //Clear
        setCategoriesTableViewConstraints()
    }
    
    func setCategoriesTableViewConstraints(){
        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false // Enables AutoLayout
        categoriesTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        categoriesTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        categoriesTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        categoriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    //MARK: Setup Navigation Bar
    func setupNavigationBar() {
        
        // Title
        self.title = "Categories"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // Search Controller
//        let searchController = UISearchController(searchResultsController: nil)
//        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = true
        
        // Buttons
        let settingsButton = UIBarButtonItem(image: UIImage(named: "Settings"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        let editButton = UIBarButtonItem(image: UIImage(named: "Edit"), style: .plain, target: self, action: #selector(editButtonTapped))
        let helpButton = UIBarButtonItem(image: UIImage(named: "Help"), style: .plain, target: self, action: #selector(helpButtonTapped))
        let playButton = UIBarButtonItem(image: UIImage(named: "Play"), style: .plain, target: self, action: #selector(playButtonTapped))

        navigationItem.leftBarButtonItems = [settingsButton, editButton]
        navigationItem.rightBarButtonItems = [helpButton, playButton]
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

extension UIViewController {
    // Convinience method for adding child view controllers
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    // Convinience method for removing child view controllers
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
