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
    let bottomAreaVC = BottomAreaVC()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        setupNavigationBar()
        setupViewHierachy()
        setupBottomArea()
        setupCategoriesTableView()
        
    }
    
    // Setup view hierachy in correct order
    private func setupViewHierachy() {
        view.addSubview(categoriesTableView) // Table view must be first to make large title shrink when scrolling
        add(bottomAreaVC) // Adds bottomAreaVC as a child. The add(child:) method is an extention on UIViewController
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
    
    
    //MARK: - Bottom Area
    func setupBottomArea() {
//        bottomAreaVC.view.backgroundColor = .blue
        setupBottomAreaViewConstraints()
    }
    
    func setupBottomAreaViewConstraints() {
        bottomAreaVC.view.translatesAutoresizingMaskIntoConstraints = false // Enables AutoLayout
        bottomAreaVC.view.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        bottomAreaVC.view.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        bottomAreaVC.view.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        bottomAreaVC.view.heightAnchor.constraint(equalToConstant: 72).isActive = true
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
