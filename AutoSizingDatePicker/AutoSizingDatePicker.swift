//
//  AutoSizingDatePicker.swift
//  AutoSizingDatePicker
//
//  Created by Harry PAN on 15/1/2022.
//

import UIKit

class AutoSizingDatePicker: UIDatePicker {
    // Apple did NOT implement intrinsicContentSize for UIDatePicker.
    // Using systemLayoutSizeFitting to calculate the size.
    override var intrinsicContentSize: CGSize {
        let contentView = UIView()
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = preferredDatePickerStyle
        }
        datePicker.datePickerMode = datePickerMode
        
        let topConstraint =
        NSLayoutConstraint(item: contentView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: datePicker,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0)
        let bottomConstraint =
        NSLayoutConstraint(item: contentView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: datePicker,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: 0)
        let leadingConstraint =
        NSLayoutConstraint(item: contentView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: datePicker,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 0)
        let trailingConstraint =
        NSLayoutConstraint(item: contentView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: datePicker,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 0)
        
        contentView.addSubview(datePicker)
        contentView.addConstraints([topConstraint,
                                    bottomConstraint,
                                    leadingConstraint,
                                    trailingConstraint])
        
        return contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
