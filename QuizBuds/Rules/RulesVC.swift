//
//  RulesVC.swift
//  QuizBuds
//
//  Created by Michael Buss Andersen on 26/03/2019.
//  Copyright © 2019 NoobLabs. All rights reserved.
//

import UIKit

class RulesVC: UIViewController {
    
    let textView = UITextView()
    let imageView = UIImageView()
    let bottomSpacingView = UIView()
    
    let rules = """
    1: Gather three or more good friends. 👩🏼‍🎤🧕🏾👨🏻‍🎨

    2: A team of two players sit back to back so they can't spy on each other. 👀

    3: A third person reads questions aloud from this dingus. 💬

    4: If a player believs that the question applies more to them than their opponent they raise a hand ✋, take a sip of their drink 🍸, or however else they wish to indicate.

    5: If both players agree (e.g. only one raises a hand or sips) they get to continue and the audience takes a penalty, for example a sip of beer 🍻. If they disagree, they loose a point — once three are lost the next team of players takes their place.

    Have fun! 🎉 And remember that it is alwasy OK to wish to skip a question. Be nice to each other. 🙏
    Love you, bye! ✨
    """
    
    let privacyPolicy = """
    QuizBuds never collects any of your personal information. It never stores or transfers any information to the developer or any third party.

    No trackers, no ads, no nothing. Just a nice little app for your enjoyment. Made solely for practicing app building. 👨‍💻
    """

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        view.backgroundColor = UIColor(named: "Background")
        
        view.addSubview(textView)
        view.addSubview(imageView)
        view.addSubview(bottomSpacingView)
        
        setupTextView()
        setupImageView()
        setupBottomSpacingView()
    }
    
    func formatRules(toTextStyle textStyle: TextStyle) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor.white,
        ]
        let attributedRules = NSAttributedString(string: rules, attributes: attributes)
        return attributedRules
    }
    
    func setupTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.attributedText = formatRules(toTextStyle: .bread)
        textView.showsVerticalScrollIndicator = true
        textView.isEditable = false
        
        // Should align with the navigationcontroller text's leading edge
        textView.textContainerInset.top = 16
        textView.textContainerInset.bottom = 16
        textView.textContainerInset.left = 12
        textView.textContainerInset.right = 12
        
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true // Can't be safe area like the others
        textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
    }
    
    func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let image = #imageLiteral(resourceName: "People")
        imageView.image = image

        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomSpacingView.topAnchor).isActive = true
    }
    
    func setupBottomSpacingView() {
        bottomSpacingView.translatesAutoresizingMaskIntoConstraints = false
        bottomSpacingView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05).isActive = true
        bottomSpacingView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomSpacingView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomSpacingView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    enum TextStyle {
        case number
        case bread
    }
    
    //MARK: - Setup Navigation Bar
    var toggleTextButton = UIBarButtonItem()
    func setupNavigationBar() {
        toggleTextButton = UIBarButtonItem(title: "Privacy", style: .plain, target: self, action: #selector(toggleTextTapped))
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItems = [toggleTextButton]
    }
    
    //MARK: - Buttons
    @objc func toggleTextTapped() {
        print("Toggeling Privacy/Rules")
        
        switch textView.text {
        case rules:
            toggleTextButton.title = "Rules"
            textView.text = privacyPolicy
        case privacyPolicy:
            toggleTextButton.title = "Privacy"
            textView.text = rules
        default:
            fatalError()
        }
    }
    
}


