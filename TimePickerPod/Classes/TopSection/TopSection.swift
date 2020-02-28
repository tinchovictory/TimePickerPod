//
//  TopSection.swift
//  TimePickerPod
//
//  Created by Martin Victory on 28/02/2020.
//

import UIKit

class TopSection: UIView {

    private let delegate: TimePickerDelegate
    private var fromTopSection: TopSectionButton!
    private var toTopSection: TopSectionButton!
    
    init(delegate: TimePickerDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        self.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.layer.borderWidth = 0.5
        
        setSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        self.fromTopSection = TopSectionButton(type: .from, delegate: self.delegate)
        self.addSubview(self.fromTopSection)
        
        self.toTopSection = TopSectionButton(type: .to, delegate: self.delegate)
        self.addSubview(self.toTopSection)
    }
    
    private func setConstraints() {
        self.fromTopSection.translatesAutoresizingMaskIntoConstraints = false
        self.toTopSection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.fromTopSection.topAnchor.constraint(equalTo: self.topAnchor),
            self.fromTopSection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.fromTopSection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.toTopSection.topAnchor.constraint(equalTo: self.topAnchor),
            self.toTopSection.leadingAnchor.constraint(equalTo: self.fromTopSection.trailingAnchor),
            self.toTopSection.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.toTopSection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.toTopSection.widthAnchor.constraint(equalTo: self.fromTopSection.widthAnchor),
            self.toTopSection.heightAnchor.constraint(equalTo: self.fromTopSection.heightAnchor),
            self.fromTopSection.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func deselectTopSection() {
        fromTopSection.isSelected = false
        toTopSection.isSelected = false
    }
    
}
