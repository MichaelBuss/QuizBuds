//
//  QuizVC.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 03/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class QuizVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var pagesIndices = 0..<1 // Initiated with wrong size because it can't be empty?
    
    let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light) 
    
    var cIndex = 0 {
        didSet {
            switch cIndex {
            case pagesIndices.min(): navigationItem.rightBarButtonItems?.last?.isEnabled = false
            case pagesIndices.max(): navigationItem.rightBarButtonItems?.first?.isEnabled = false
            default:
                navigationItem.rightBarButtonItems?.first?.isEnabled = true
                navigationItem.rightBarButtonItems?.last?.isEnabled = true
            }
        }
    }
    
    private var quizCollectionView = UICollectionView(frame: .zero, collectionViewLayout: AltFlowLayout.init()) // CollectionView init
    
    var centerFlowLayout: AltFlowLayout {
        return quizCollectionView.collectionViewLayout as! AltFlowLayout
    }
    
    var selectedCategories: [Category] = [] {
        didSet {
            makeQuestinosArray()
        }
    }
    var questions: [Question] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        selectedCategories.shuffle()
        setupNavigationBar()
        setupFlowLayout()
        setupQuizCollectionView()
        updateCurrentIndex()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) { // When device is rotated
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: {
            _ in
            // Code that animates:
            self.centerFlowLayout.itemSize = CGSize(
                width: size.width * 0.8,
                height:  size.height * 0.6
            )
            self.centerFlowLayout.minimumLineSpacing = QuizCell.cellPadding
        })
    }
    
    func makeQuestinosArray() {
        questions = []
        for index in 0..<selectedCategories.count {
            questions.append(contentsOf: selectedCategories[index].questions)
        }
        questions.shuffle()
    }
    
    //MARK: - Setup Navigation Bar
    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        let nextQuestionButton = UIBarButtonItem(image: UIImage(named: "NextQuestion"), style: .plain, target: self, action: #selector(nextQuestionButtonTapped))
        let previousQuestionButton = UIBarButtonItem(image: UIImage(named: "PreviousQuestion"), style: .plain, target: self, action: #selector(previousQuestionButtonTapped))
        navigationItem.rightBarButtonItems = [nextQuestionButton, previousQuestionButton]
    }
    
    //MARK: - Buttons
    @objc func nextQuestionButtonTapped() {
        print("Next Question Button Tapped")
        scrollPages(amount: 1)
    }
    
    @objc func previousQuestionButtonTapped() {
        print("Prevoius Question Button Tapped")
        scrollPages(amount: -1)
    }
    
    func scrollPages(amount: Int) {
        guard let currentIndexPath = centerFlowLayout.currentCenteredIndexPath else {return}
        cIndex = currentIndexPath.row
        if pagesIndices.contains(cIndex + amount) {
            centerFlowLayout.scrollToPage(atIndex: cIndex + amount)
            impactFeedbackgenerator.prepare()
        }
    }
    
    func setupFlowLayout() {
        centerFlowLayout.itemSize = CGSize(
            width: view.bounds.width * 0.8,
            height:  view.bounds.height * 0.6
        )
        centerFlowLayout.animationMode = AltFlowLayoutAnimation.scale(sideItemScale: 0.6, sideItemAlpha: 0.6, sideItemShift: 0.0)
        centerFlowLayout.scrollDirection = .horizontal
    }
    
    func setupQuizCollectionView() {
        quizCollectionView.translatesAutoresizingMaskIntoConstraints = false
        quizCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: centerFlowLayout)
        quizCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        centerFlowLayout.minimumLineSpacing = QuizCell.cellPadding
        quizCollectionView.backgroundColor = .clear
        view.addSubview(quizCollectionView)
        
        quizCollectionView.register(QuizCell.self, forCellWithReuseIdentifier: QuizCell.identifier)
        
        quizCollectionView.delegate = self
        quizCollectionView.dataSource = self
        
        pagesIndices = 0..<quizCollectionView.numberOfItems(inSection: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizCell.identifier, for: indexPath) as! QuizCell
        cell.question = questions[indexPath.row]
        cell.layoutSubviews()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cIndexPath = centerFlowLayout.currentCenteredIndexPath, cIndexPath != indexPath {
            centerFlowLayout.scrollToPage(atIndex: indexPath.row)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        impactFeedbackgenerator.impactOccurred()
        updateCurrentIndex()
    }
    
    func updateCurrentIndex(){
        guard let index = centerFlowLayout.currentCenteredIndexPath?.row else {print("could not find currently centered page index"); return}
        print("Index changed to \(index)")
        cIndex = index
    }
}
