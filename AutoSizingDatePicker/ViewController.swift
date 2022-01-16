//
//  ViewController.swift
//  AutoSizingDatePicker
//
//  Created by Harry PAN on 15/1/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        var newDatePicker: AutoSizingDatePicker {
            let datePicker = AutoSizingDatePicker()
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            return datePicker
        }
        var newLabel: UILabel {
            let label = UILabel()
            label.font = .preferredFont(forTextStyle: .title1)
            label.adjustsFontForContentSizeCategory = true
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        // Wheels
        let wheelsLabel = newLabel
        wheelsLabel.text = "Wheels"
        scrollView.addSubview(wheelsLabel)
        let wheelsDatePicker = newDatePicker
        if #available(iOS 13.4, *) {
            wheelsDatePicker.preferredDatePickerStyle = .wheels
        }
        scrollView.addSubview(wheelsDatePicker)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        
        let margin: CGFloat = 8
        constraints.append(wheelsLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                                              constant: -2 * margin))
        constraints.append(wheelsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,
                                                                constant: margin))
        constraints.append(wheelsLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,
                                                                constant: margin))
        constraints.append(wheelsLabel.topAnchor.constraint(equalTo: scrollView.topAnchor))
        constraints.append(wheelsLabel.bottomAnchor.constraint(equalTo: wheelsDatePicker.topAnchor))
        constraints.append(wheelsDatePicker.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.leadingAnchor,
                                                                     constant: margin))
        constraints.append(wheelsDatePicker.trailingAnchor.constraint(greaterThanOrEqualTo: scrollView.trailingAnchor,
                                                                      constant: margin))
        constraints.append(wheelsDatePicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
        
        if #available(iOS 14, *) {
            // Inline
            let inlineLabel = newLabel
            inlineLabel.text = "Inline"
            scrollView.addSubview(inlineLabel)
            let inlineDatePicker = newDatePicker
            inlineDatePicker.preferredDatePickerStyle = .inline
            inlineDatePicker.datePickerMode = .date
            scrollView.addSubview(inlineDatePicker)
            
            constraints.append(inlineLabel.leadingAnchor.constraint(equalTo: wheelsLabel.leadingAnchor))
            constraints.append(inlineLabel.trailingAnchor.constraint(equalTo: wheelsLabel.trailingAnchor))
            constraints.append(inlineLabel.topAnchor.constraint(equalTo: wheelsDatePicker.bottomAnchor))
            constraints.append(inlineLabel.bottomAnchor.constraint(equalTo: inlineDatePicker.topAnchor))
            constraints.append(inlineDatePicker.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.leadingAnchor,
                                                                         constant: margin))
            constraints.append(inlineDatePicker.trailingAnchor.constraint(greaterThanOrEqualTo: scrollView.trailingAnchor,
                                                                          constant: margin))
            constraints.append(inlineDatePicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
            
            // Compact
            let compactLabel = newLabel
            compactLabel.text = "Compact"
            scrollView.addSubview(compactLabel)
            let compactDatePicker = newDatePicker
            compactDatePicker.preferredDatePickerStyle = .compact
            scrollView.addSubview(compactDatePicker)
            
            constraints.append(compactLabel.leadingAnchor.constraint(equalTo: wheelsLabel.leadingAnchor))
            constraints.append(compactLabel.trailingAnchor.constraint(equalTo: wheelsLabel.trailingAnchor))
            constraints.append(compactLabel.topAnchor.constraint(equalTo: inlineDatePicker.bottomAnchor))
            constraints.append(compactLabel.bottomAnchor.constraint(equalTo: compactDatePicker.topAnchor))
            constraints.append(compactDatePicker.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.leadingAnchor,
                                                                         constant: margin))
            constraints.append(compactDatePicker.trailingAnchor.constraint(greaterThanOrEqualTo: scrollView.trailingAnchor,
                                                                          constant: margin))
            constraints.append(compactDatePicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
            constraints.append(compactDatePicker.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,
                                                                         constant: -margin))
            
        } else if #available(iOS 13.4, *) {
            // Compact
            let compactLabel = newLabel
            compactLabel.text = "Compact"
            scrollView.addSubview(compactLabel)
            let compactDatePicker = newDatePicker
            compactDatePicker.preferredDatePickerStyle = .compact
            scrollView.addSubview(compactDatePicker)
            
            constraints.append(compactLabel.leadingAnchor.constraint(equalTo: wheelsLabel.leadingAnchor))
            constraints.append(compactLabel.trailingAnchor.constraint(equalTo: wheelsLabel.trailingAnchor))
            constraints.append(compactLabel.topAnchor.constraint(equalTo: wheelsDatePicker.bottomAnchor))
            constraints.append(compactLabel.bottomAnchor.constraint(equalTo: compactDatePicker.topAnchor))
            constraints.append(compactDatePicker.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.leadingAnchor,
                                                                         constant: margin))
            constraints.append(compactDatePicker.trailingAnchor.constraint(greaterThanOrEqualTo: scrollView.trailingAnchor,
                                                                          constant: margin))
            constraints.append(compactDatePicker.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor))
            constraints.append(compactDatePicker.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,
                                                                         constant: -margin))
        } else {
            constraints.append(wheelsDatePicker.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,
                                                                        constant: -margin))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}

