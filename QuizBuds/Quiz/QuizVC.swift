//
//  QuizVC.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class QuizVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var quizCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init()) // CollectionView
    
    var selectedCategories: [Category] = []
    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
//        view.translatesAutoresizingMaskIntoConstraints = false
        selectedCategories.shuffle()
        setupNavigationBar()
        setupQuizCollectionView()
        //setupQuestionLabel()
    }
    
    //MARK: Setup Navigation Bar
    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        
        let nextQuestionButton = UIBarButtonItem(image: UIImage(named: "NextQuestion"), style: .plain, target: self, action: #selector(nextQuestionButtonTapped))
        let previousQuestionButton = UIBarButtonItem(image: UIImage(named: "PreviousQuestion"), style: .plain, target: self, action: #selector(previousQuestionButtonTapped))
        
        navigationItem.rightBarButtonItems = [nextQuestionButton, previousQuestionButton]
    }
    
    @objc func nextQuestionButtonTapped() {
        scroll(toIndex: quizCollectionView.indexPathsForVisibleItems.last!.row)
    }
    
    @objc func previousQuestionButtonTapped() {
        print("Prevoius Question Button Tapped")
//        let currentIndex = quizCollectionView.indexPathsForVisibleItems.first
//        let nextIndex = quizCollectionView.indexPathsForVisibleItems.index(before: currentIndex!.row)
        
        scroll(toIndex: quizCollectionView.indexPathsForVisibleItems.first!.row)
    }
    
    func  scroll(toIndex index: Int) { // Not currently in use
        let indexPath = IndexPath(item: index, section: 0)
        quizCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func scrollCell(inDirection direction: direction){
        let cellSize = view.frame.size
        let contentOffset = quizCollectionView.contentOffset
        var r = CGRect(x: 0, y: 0, width: 0, height: 0)
        if hasReachedEnd(of: quizCollectionView, with: cellSize) {
            r = CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
        } else {
            switch (direction) {
            case .next: r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            case .previous: r = CGRect(x: contentOffset.x - cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            }
            
        }
        quizCollectionView.scrollRectToVisible(r, animated: true)
    }
    
    func hasReachedEnd(of collectionView: UICollectionView, with cellSize: CGSize) -> Bool {
        if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width {
            return true
        } else {
            return false
        }
    }
    
    enum direction {
        case next
        case previous
    }
    
    //MARK: Collection View
    func setupQuizCollectionView() {
        let flowLayout = QuizFlowLayout()
        //let flowLayout = AltFlowLayout()
        quizCollectionView.translatesAutoresizingMaskIntoConstraints = false
        quizCollectionView = UICollectionView(frame: view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        flowLayout.minimumLineSpacing = QuizCell.cellPadding
        quizCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        quizCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        quizCollectionView.backgroundColor = .clear
        view.addSubview(quizCollectionView)
        quizCollectionView.isPagingEnabled = true
    
        quizCollectionView.register(QuizCell.self, forCellWithReuseIdentifier: QuizCell.identifier)
        
        quizCollectionView.delegate = self
        quizCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizCell.identifier, for: indexPath) as! QuizCell
        cell.populate(withCategory: selectedCategories[indexPath.row])
        cell.layoutSubviews()
        return cell
    }
}

//extension QuizVC: UIScrollViewDelegate {
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let layout = self.quizCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//        var offset = targetContentOffset.pointee
//        let index = ((offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing).rounded()
//        offset = CGPoint(x: index * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//        targetContentOffset.pointee = offset
//    }
//}
