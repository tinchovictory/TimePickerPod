//
//  TimePickerView.swift
//  TimePickerPod
//
//  Created by Martin Victory on 24/02/2020.
//

import UIKit

public class TimePickerView: UIView {
   
    public var delegate: TimePickerDelegate?
    private var halfDaySectionSun: HalfDaySection!
    private var halfDaySectionNight: HalfDaySection!
    private var minutesSection: MinutesSection!

    override public init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        setSubviews()
        setConstraints()
    }
    
    private func setSubviews() {
        self.halfDaySectionSun = HalfDaySection(halfDayType: .day, delegate: self)
        self.addSubview(self.halfDaySectionSun)
        
        self.halfDaySectionNight = HalfDaySection(halfDayType: .night, delegate: self)
        self.addSubview(self.halfDaySectionNight)
        
        self.minutesSection = MinutesSection(delegate: self)
        self.addSubview(self.minutesSection)
    }
    
    private func setConstraints() {
        self.halfDaySectionSun.translatesAutoresizingMaskIntoConstraints = false
        self.halfDaySectionNight.translatesAutoresizingMaskIntoConstraints = false
        self.minutesSection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.halfDaySectionSun.topAnchor.constraint(equalTo: self.topAnchor),
            self.halfDaySectionSun.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.halfDaySectionSun.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            self.halfDaySectionNight.topAnchor.constraint(equalTo: self.halfDaySectionSun.bottomAnchor),
            self.halfDaySectionNight.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.halfDaySectionNight.leadingAnchor.constraint(equalTo: self.leadingAnchor),

            self.minutesSection.topAnchor.constraint(equalTo: self.halfDaySectionNight.bottomAnchor, constant: 5),
            self.minutesSection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.minutesSection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.minutesSection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.minutesSection.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
}

extension TimePickerView: TimePickerDelegate {
    public func didSelect(hour: Date) {
        self.halfDaySectionSun.deselectHours()
        self.halfDaySectionNight.deselectHours()
        self.delegate?.didSelect(hour: hour)
    }
    
    public func didSelect(minute: Date) {
        self.minutesSection.deselectMinutes()
        self.delegate?.didSelect(minute: minute)
    }
}
