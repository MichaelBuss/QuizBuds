//
//  CategoriesVC.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private let categories = CategoryData.getCategories() // Model
    private var categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init()) // CollectionView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        setupNavigationBar()
        setupCategoriesCollectionView()
    }
    
    //MARK: Table View
    func setupCategoriesCollectionView() {
        let flowLayout = ColumnFlowLayout()
        categoriesCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout) // CollectionView
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        categoriesCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        categoriesCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        categoriesCollectionView.backgroundColor = .clear
        categoriesCollectionView.alwaysBounceVertical = true
        view.addSubview(categoriesCollectionView)
        
        categoriesCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.populate(withCategory: categories[indexPath.row])
        return cell
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
        print("Settings Button Tapped")
    }
    
    @objc func editButtonTapped() {
        print("Edit Button Tapped")
    }
    
    @objc func playButtonTapped() {
        print("Play Button Tapped")
        let nextVC = QuizVC()
        nextVC.title = "Quiz 🎉"
        nextVC.selectedCategories = categories //Needs be narrowed by selection. Corruntly not
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func helpButtonTapped() {
        print("Help Button Tapped")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        categoriesCollectionView.collectionViewLayout.invalidateLayout()
    }
    
}
