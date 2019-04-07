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
    let questionLabel = UILabel()
    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        selectedCategories.shuffle()
        setupNavigationBar()
        setupQuizCollectionView()
        //setupQuestionLabel()
    }
    
    
    func setupQuestionLabel(){
        questionLabel.text = selectedCategories.first?.name ?? "No questions found"
    
        view.addSubview(questionLabel)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.clipsToBounds = true
        questionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func changeCurrentQuestionIndex(inDirection direction: direction){
        switch direction {
        case .increment:
            if currentQuestionIndex < selectedCategories.count-1{
                currentQuestionIndex += 1
            }
        case .decrement:
            if currentQuestionIndex > 1{
                currentQuestionIndex -= 1
            }
        }
    }
    
    func updateQuestionLabel(){
        if !selectedCategories.isEmpty{
            questionLabel.text = selectedCategories[currentQuestionIndex].name
        } else {
            questionLabel.text = "No more questions here"
        }
    }
    
    //MARK: Setup Navigation Bar
    func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        
        let nextQuestionButton = UIBarButtonItem(image: UIImage(named: "NextQuestion"), style: .plain, target: self, action: #selector(nextQuestionButtonTapped))
        let previousQuestionButton = UIBarButtonItem(image: UIImage(named: "PreviousQuestion"), style: .plain, target: self, action: #selector(previousQuestionButtonTapped))
        
        navigationItem.rightBarButtonItems = [nextQuestionButton, previousQuestionButton]
    }
    
    @objc func nextQuestionButtonTapped() {
        print("Next Question Button Tapped")
        changeCurrentQuestionIndex(inDirection: .increment)
        updateQuestionLabel()
    }
    
    @objc func previousQuestionButtonTapped() {
        print("Prevoius Question Button Tapped")
        changeCurrentQuestionIndex(inDirection: .decrement)
        updateQuestionLabel()
    }
    
    //MARK: Collection View
    func setupQuizCollectionView() {
        let flowLayout = QuizFlowLayout()
        quizCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout) // CollectionView
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        quizCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        quizCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        quizCollectionView.backgroundColor = .clear
        view.addSubview(quizCollectionView)
        
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


enum direction {
    case increment
    case decrement
}
