//
//  HalfDaySection.swift
//  TimePickerPod
//
//  Created by Martin Victory on 24/02/2020.
//

import UIKit
import FontAwesome_swift

enum HalfDayType {
    case day, night
}

class HalfDaySection: UIView {
    
    private var initialHour: Int!
    private let hoursPerRow = 6
    private let halfDayType: HalfDayType
    
    init(halfDayType: HalfDayType) {
        self.halfDayType = halfDayType
        super.init(frame: .zero)

        setRangeHours(for: halfDayType)
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func setRangeHours(for halfDayType: HalfDayType) {
        switch halfDayType {
        case .day:
            self.initialHour = 8
        case .night:
            self.initialHour = 20
        }
    }
    
    private func setSubviews() {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        
        horizontalStackView.addArrangedSubview(getHourRangeIcon())
        
        for i in 0 ..< hoursPerRow {
            let verticalStackView = buildVerticalStackView()
            verticalStackView.addArrangedSubview(HourButton(hour: (initialHour + i) % 24))
            verticalStackView.addArrangedSubview(HourButton(hour: (initialHour + i + hoursPerRow) % 24))
            horizontalStackView.addArrangedSubview(verticalStackView)
        }
        
        self.addSubview(horizontalStackView)
        addConstraints(to: horizontalStackView)
    }

    private func getHourRangeIcon() -> UIView {
        let hourRangeIcon = UILabel()
        hourRangeIcon.font = UIFont.fontAwesome(ofSize: 25, style: .solid)
        hourRangeIcon.textAlignment = .center
        hourRangeIcon.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        hourRangeIcon.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        hourRangeIcon.layer.borderWidth = 0.5

        switch self.halfDayType {
        case .day:
            hourRangeIcon.text = String.fontAwesomeIcon(name: .sun)
        case .night:
            hourRangeIcon.text = String.fontAwesomeIcon(name: .moon)
        }

        return hourRangeIcon
    }
    
    private func addConstraints(to view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
    private func buildVerticalStackView() -> UIStackView {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        return verticalStackView
    }

}
