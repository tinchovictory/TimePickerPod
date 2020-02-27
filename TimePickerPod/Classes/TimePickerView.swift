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
    }
    
    private func setConstraints() {
        self.halfDaySectionSun.translatesAutoresizingMaskIntoConstraints = false
        self.halfDaySectionNight.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.halfDaySectionSun.topAnchor.constraint(equalTo: self.topAnchor),
            self.halfDaySectionSun.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.halfDaySectionSun.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            self.halfDaySectionNight.topAnchor.constraint(equalTo: self.halfDaySectionSun.bottomAnchor),
            self.halfDaySectionNight.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.halfDaySectionNight.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.halfDaySectionNight.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }
    
}

extension TimePickerView: TimePickerDelegate {
    public func didSelect(hour: Date) {
        self.halfDaySectionSun.deselectHours()
        self.halfDaySectionNight.deselectHours()
        self.delegate?.didSelect(hour: hour)
    }
}
