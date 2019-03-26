//
//  CategoriesVC.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private let categories = CategoryData.getCategories()
    private var categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init()) // CollectionView

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Categories", style: .plain, target: nil, action: nil)
        setupNavigationBar()
        setupCategoriesCollectionView()
        registerSettingsBundle()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.defaultsChanged),
            name: UserDefaults.didChangeNotification,
            object: nil)
        
    }
    
    @objc func defaultsChanged(){
        if UserDefaults.standard.bool(forKey: SettingsBundleHelper.SettingsBundleKeys.darkAppearance){
            print("Change to Dark Apperance")
        } else {
            print("Change to Light Apperance")
        }
    }
    
    //MARK: Table View
    func setupCategoriesCollectionView() {
        let flowLayout = ColumnFlowLayout()
        categoriesCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout) // CollectionView
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        categoriesCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        categoriesCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        categoriesCollectionView.backgroundColor = .clear
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
        self.title = "Choose Categories"
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
        
        // Goes through categories and checks if they are active. If so, appends to nextVC's selectedCategories
        for category in categories {
//            print("category is \(String(describing: category.isActive))")
            if category.isActive == true {
                nextVC.selectedCategories.append(category)
            }
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func helpButtonTapped() {
        print("Help Button Tapped")
        let nextVC = RulesVC()
        nextVC.title = "How to play"
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        categoriesCollectionView.collectionViewLayout.invalidateLayout()
    }
    
}
