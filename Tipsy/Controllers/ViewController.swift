//
//  ViewController.swift
//  Tipsy
//
//  Created by Никита Ясеник on 30.01.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var totalPercent = 0
    
    private lazy var topLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter bill total"
        label.textColor = .gray
        label.font = label.font.withSize(25)
        label.alpha = 0.7
        
        return label
    }()
    
    private lazy var midLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select tip"
        label.textColor = .gray
        label.alpha = 0.7
        label.font = label.font.withSize(25)
        
        return label
    }()
    
    private lazy var topTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "e.g. 123.456"
        textField.font = UIFont.init(name: ("TimesNewRomanPSMT"), size: 40.0)
        textField.textAlignment = .center
        textField.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        textField.keyboardType = .numberPad
        
        return textField
    }()
    
    private lazy var topView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(topLabel)
        view.addSubview(topTextField)
        
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            topTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 30),
            topTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 60),
            topTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            topTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
        
        
        return view
    }()
    
    private lazy var zeroButton: UIButton = {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 30)
            return outgoing
        }
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "0%"
        buttonConfig.baseForegroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        buttonConfig.titleTextAttributesTransformer = transformer
        
        var button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.buttonToDefault()
            self.zeroButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            self.zeroButton.configuration?.baseForegroundColor = .white
            self.totalPercent = 0
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func buttonToDefault() {
        self.tenButton.backgroundColor = .none
        self.tenButton.configuration?.baseForegroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        self.zeroButton.backgroundColor = .none
        self.zeroButton.configuration?.baseForegroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        self.twentyButton.backgroundColor = .none
        self.twentyButton.configuration?.baseForegroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    private lazy var tenButton: UIButton = {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 30)
            return outgoing
        }
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "10%"
        buttonConfig.baseForegroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        buttonConfig.titleTextAttributesTransformer = transformer
        
        var button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.buttonToDefault()
            self.tenButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            self.tenButton.configuration?.baseForegroundColor = .white
            self.totalPercent = 10
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var twentyButton: UIButton = {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 30)
            return outgoing
        }
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "20%"
        buttonConfig.baseForegroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        buttonConfig.titleTextAttributesTransformer = transformer
        
        var button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.buttonToDefault()
            self.twentyButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            self.twentyButton.configuration?.baseForegroundColor = .white
            self.totalPercent = 20
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var buttonStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [
            zeroButton,
            tenButton,
            twentyButton
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            tenButton.leftAnchor.constraint(equalTo: zeroButton.rightAnchor, constant: 30),
            twentyButton.leftAnchor.constraint(equalTo: tenButton.rightAnchor, constant: 30)
        ])
        
        return stack
    }()
    
    private lazy var lowLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose split"
        label.textColor = .gray
        label.alpha = 0.7
        label.font = label.font.withSize(25)
        
        return label
    }()
    
    private lazy var stapper: UIStepper = {
        var stapper = UIStepper()
        stapper.translatesAutoresizingMaskIntoConstraints = false
        stapper.minimumValue = 1
        stapper.maximumValue = 5
        stapper.value = 2
        stapper.addTarget(self, action: #selector(changeStepper), for: .valueChanged)
        
        return stapper
    }()
    
    @objc
    func changeStepper() {
        self.countLabel.text = String(format: "%.0f", stapper.value)
    }
    
    private lazy var countLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String(format: "%.0f", stapper.value)
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.font = label.font.withSize(30)
        
        return label
    }()
    
    private lazy var calculateButton: UIButton = {
        let transformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.boldSystemFont(ofSize: 30)
            return outgoing
        }
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.title = "Calculate"
        buttonConfig.baseForegroundColor = .white
        buttonConfig.titleTextAttributesTransformer = transformer
        
        
        var button = UIButton(configuration: buttonConfig, primaryAction: UIAction(){ _ in
            self.calculate()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        button.layer.cornerRadius = 10
        
        return button
        
    }()
    
    func calculate() {
        let bill = topTextField.text!
        let numberOfPeople = stapper.value
        let tip = Double(totalPercent)
        if bill != "" {
            let billTotal = Double(bill)!
            let result = billTotal * (1 + tip / 100) / Double(numberOfPeople)
            let secondVC = SecondViewController()
            secondVC.totalScore = result
            secondVC.totalPercent = totalPercent
            secondVC.totalPeople = Int(numberOfPeople)
            self.present(secondVC, animated: true)
        }
    }
    
    private lazy var botView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        view.addSubview(midLabel)
        view.addSubview(buttonStack)
        view.addSubview(lowLabel)
        view.addSubview(stapper)
        view.addSubview(countLabel)
        view.addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            midLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            midLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            buttonStack.topAnchor.constraint(equalTo: midLabel.bottomAnchor, constant: 20),
            buttonStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            buttonStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            lowLabel.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 20),
            lowLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            countLabel.topAnchor.constraint(equalTo: lowLabel.bottomAnchor, constant: 20),
            countLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            stapper.topAnchor.constraint(equalTo: lowLabel.bottomAnchor, constant: 20),
            stapper.leftAnchor.constraint(equalTo: countLabel.rightAnchor, constant: 120),
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
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
        stack.distribution = .fillEqually
    
        NSLayoutConstraint.activate([
            topView.heightAnchor.constraint(equalTo: stack.heightAnchor, multiplier: 0.7)
        ])
        
        return stack
    }()
    

    func setupView() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }


}


struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return ViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
