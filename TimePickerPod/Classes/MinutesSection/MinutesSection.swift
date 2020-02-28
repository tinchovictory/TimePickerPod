//
//  MinutesSection.swift
//  TimePickerPod
//
//  Created by Martin Victory on 27/02/2020.
//

import UIKit

class MinutesSection: UIView {
   
    private var minuteButtons: [MinuteButton]!
    private var stackView: UIStackView!
    private let delegate: TimePickerDelegate
    
    init(delegate: TimePickerDelegate) {
        self.delegate = delegate
        
        super.init(frame: .zero)
        
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        self.stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.distribution = .fillEqually
        
        for minuteButton in buildMinutesButtons() {
            self.stackView.addArrangedSubview(minuteButton)
        }
        
        self.addSubview(self.stackView)
    }
    
    private func setConstraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    private func buildMinutesButtons() -> [MinuteButton] {
        var buttons = [MinuteButton]()
        
        for minute in stride(from: 0, to: 60, by: 5) {
            if minute % 15 == 0 {
                buttons.append(MinuteButton(minute: minute, buttonType: .big, delegate: self.delegate))
            } else {
                buttons.append(MinuteButton(minute: minute, buttonType: .small, delegate: self.delegate))
            }
        }
        
        self.minuteButtons = buttons
        return buttons
    }
    
    func deselectMinutes() {
        for minuteButton in minuteButtons {
            minuteButton.isSelected = false
        }
    }
}
