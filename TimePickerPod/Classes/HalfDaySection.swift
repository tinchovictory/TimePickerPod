//
//  HalfDaySection.swift
//  TimePickerPod
//
//  Created by Martin Victory on 24/02/2020.
//

import UIKit

enum HalfDayType {
    case day, night
}

public class HalfDaySection: UIView {
    
    private let initialHour = 8, finalHour = 19
    private let hoursPerRow = 6
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setSubviews() {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        
        let hourRangeIcon = UILabel()
        hourRangeIcon.text = "S"
        hourRangeIcon.textAlignment = .center
        hourRangeIcon.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        hourRangeIcon.layer.borderWidth = 0.5
        horizontalStackView.addArrangedSubview(hourRangeIcon)
        
        for i in initialHour..<(initialHour + hoursPerRow) {
            let verticalStackView = UIStackView()
            verticalStackView.axis = .vertical
            verticalStackView.distribution = .fillEqually

            verticalStackView.addArrangedSubview(HourButton(hour: i))

            if i + hoursPerRow <= finalHour {
                verticalStackView.addArrangedSubview(HourButton(hour: i + hoursPerRow))
            }
            
            horizontalStackView.addArrangedSubview(verticalStackView)
        }
        
        self.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
        ])
    }

    
}
