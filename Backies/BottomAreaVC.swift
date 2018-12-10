//
//  BottomAreaVC.swift
//  Backies
//
//  Created by Michael Buss Andersen on 08/12/2018.
//  Copyright © 2018 NoobLabs. All rights reserved.
//

import UIKit

class BottomAreaVC: UIViewController {

    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9761723876, green: 0.9761723876, blue: 0.9761723876, alpha: 0.8)
        setupVisualEffect()
        view.addSubview(nextButton)
        setupNextButton()

        // Do any additional setup after loading the view.
    }
    
    // Functions
    private func setupVisualEffect(){
        let blurEffect = UIBlurEffect(style: .regular)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        blurredEffectView.frame = view.bounds
        vibrancyEffectView.frame = view.bounds
        view.addSubview(blurredEffectView)
        blurredEffectView.contentView.addSubview(vibrancyEffectView)
    }
    
    private func setupNextButton() {
        let label = "Start"
        let font = UIFont.systemFont(ofSize: 30)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: view.tintColor,
            ]
        let attributedLabel = NSAttributedString(string: label, attributes: attributes)
        
        nextButton.backgroundColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 0)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setAttributedTitle(attributedLabel, for: .normal)
        
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
    private func setNextButtonConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false // Enables AutoLayout
        nextButton.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

}
