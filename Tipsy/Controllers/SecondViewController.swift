//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Никита Ясеник on 31.01.2023.
//

import Foundation
import SwiftUI


class SecondViewController: UIViewController {
    
    var totalScore: Double = 12.12
    var totalPercent: Int = 10
    var totalPeople: Int = 3
    
    private lazy var topUpLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total per person"
        label.font = label.font.withSize(30)
        label.textColor = .gray.withAlphaComponent(0.7)
        
        return label
    }()
    
    private lazy var topDownLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String(format: "%.2f", totalScore)
        label.font = label.font.withSize(55)
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        return label
    }()
    
    private lazy var botUpLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between \(totalPeople) people, with \n \(totalPercent)% tip."
        label.textColor = .gray.withAlphaComponent(0.7)
        label.font = label.font.withSize(30)
        label.contentMode = .center
        label.numberOfLines = 2
        label.lineBreakStrategy = .pushOut
        
        return label
    }()
    
    private lazy var topView: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topUpLabel)
        view.addSubview(topDownLabel)
        
        NSLayoutConstraint.activate([
            topUpLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            topUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topDownLabel.topAnchor.constraint(equalTo: topUpLabel.bottomAnchor, constant: 20),
            topDownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }()
    
    private lazy var recalculateButton: UIButton = {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 30)
            return outgoing
        }
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "Recalculate"
        buttonConfig.baseForegroundColor = .white
        buttonConfig.titleTextAttributesTransformer = transformer
        
        
        var button = UIButton(configuration: buttonConfig, primaryAction:   UIAction(){ _ in
            self.dismiss(animated: true)
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.layer.cornerRadius = 10
        
        return button
        
    }()
    
    private lazy var botView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(botUpLabel)
        view.addSubview(recalculateButton)
        
        NSLayoutConstraint.activate([
            botUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            botUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [
            topView,
            botView
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalTo: stack.heightAnchor, multiplier: 0.6)
        ])
        
        return stack
    }()
    
    func setupView() {
//        view.backgroundColor = .yellow
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    
    
}


struct MyProvider1: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return SecondViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
