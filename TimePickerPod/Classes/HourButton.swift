//
//  HourButton.swift
//  TimePickerPod
//
//  Created by Martin Victory on 24/02/2020.
//

import UIKit

class HourButton: UIView {

    private let label: UILabel

    init(hour: Int) {
        self.label = UILabel()
        
        super.init(frame: .zero)
        self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.layer.borderWidth = 0.5
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.attributedText = format(hour: hour)
        self.addSubview(self.label)

        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.widthAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func format(hour: Int) -> NSAttributedString {
        let hourStr = hourString(from: hour)
        let hour = NSMutableAttributedString(string: hourStr)
       
        hour.setAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18, weight: .medium)], range: NSMakeRange(0, hourStr.count))
        hour.setAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12, weight: .light)], range: NSMakeRange(hourStr.count - 2, 2))
        
        return hour
    }
    
    private func hourString(from hour: Int) -> String {
        if hour > 12 {
            return "\(hour % 12)PM"
        }
        return "\(hour)AM"
    }
    
}
