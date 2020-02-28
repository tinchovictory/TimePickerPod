//
//  MinuteButton.swift
//  TimePickerPod
//
//  Created by Martin Victory on 27/02/2020.
//

import UIKit

enum MinuteButtonType {
    case small, big
}

class MinuteButton: UIView {
   
    var isSelected = false {
        didSet {
            toggleSelected()
        }
    }
    private let delegate: TimePickerDelegate
    private let selectedColor = UIColor(red: 0.5, green: 0.32, blue: 0.73, alpha: 1.0)
    private let smallLabelColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    
    private let minuteButtonType: MinuteButtonType
    private var label: UILabel!

    init(minute: Int, buttonType: MinuteButtonType, delegate: TimePickerDelegate) {
        self.minuteButtonType = buttonType
        self.delegate = delegate
            
        super.init(frame: .zero)
        
        self.label = buildLabel(minute: minute, type: minuteButtonType)
        self.addSubview(self.label)
        setConstraints()
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setSelected)))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildLabel(minute: Int, type: MinuteButtonType) -> UILabel {
        let label = UILabel()
        
        if type == .big {
            label.text = ":\(minute)"
            label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        } else {
            label.text = String(minute)
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = smallLabelColor
        }
        
        return label
    }
    
    private func setConstraints() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    private func toggleSelected() {
        if self.isSelected {
            self.backgroundColor = selectedColor
            self.label.textColor = .white
        } else {
            self.backgroundColor = .none
            
            if self.minuteButtonType == .small {
                self.label.textColor = smallLabelColor
            } else {
                self.label.textColor = .black
            }
        }
    }
    
    @objc private func setSelected() {
        delegate.didSelect(minute: Date())
        self.isSelected = true
    }
}
