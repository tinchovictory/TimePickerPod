//
//  TopSectionButton.swift
//  TimePickerPod
//
//  Created by Martin Victory on 28/02/2020.
//

import UIKit
import FontAwesome_swift

enum TopSectionType {
    case from, to
}

class TopSectionButton: UIView {
   
    var isSelected = false {
        didSet {
            toggleSelected()
        }
    }
    private var delegate: TimePickerDelegate
    private var viewContainer: UIView!
    private var icon: UILabel!
    private var title: UILabel!
    private var time: UILabel!
    private let topSectionType: TopSectionType
    private let selectedColor = UIColor(red: 0.5, green: 0.32, blue: 0.73, alpha: 1.0)
    private let secondaryColor = UIColor(red: 0.37, green: 0.37, blue: 0.37, alpha: 1.0)

    init(type: TopSectionType, delegate: TimePickerDelegate) {
        self.topSectionType = type
        self.delegate = delegate
        super.init(frame: .zero)
        
        setSubviews()
        setConstraints()
    
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(setSelected)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        self.viewContainer = UIView()
        self.addSubview(self.viewContainer)
        
        self.icon = buildIcon()
        self.addSubview(self.icon)
        
        self.title = buildTitle()
        self.addSubview(self.title)
        
        self.time = buildTime()
        self.addSubview(self.time)
    }
    
    private func setConstraints() {
        self.viewContainer.translatesAutoresizingMaskIntoConstraints = false
        self.icon.translatesAutoresizingMaskIntoConstraints = false
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.time.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.viewContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.viewContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.icon.topAnchor.constraint(equalTo: self.viewContainer.topAnchor),
            self.icon.leadingAnchor.constraint(equalTo: self.viewContainer.leadingAnchor),
            self.icon.bottomAnchor.constraint(equalTo: self.viewContainer.bottomAnchor),
            
            self.title.topAnchor.constraint(equalTo: self.viewContainer.topAnchor),
            self.title.leadingAnchor.constraint(equalTo: self.icon.trailingAnchor, constant: 15),
            self.title.trailingAnchor.constraint(equalTo: self.viewContainer.trailingAnchor),
            
            self.time.topAnchor.constraint(equalTo: self.title.bottomAnchor),
            self.time.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            self.time.trailingAnchor.constraint(equalTo: self.title.trailingAnchor),
            self.time.bottomAnchor.constraint(equalTo: self.viewContainer.bottomAnchor),
        ])
    }
    
    private func buildIcon() -> UILabel {
        let label = UILabel()
        label.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        label.text = String.fontAwesomeIcon(name: .clock)
        label.textColor = secondaryColor

        return label
    }
    
    private func buildTitle() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = secondaryColor

        switch self.topSectionType {
        case .from:
            label.text = "From:"
        case .to:
            label.text = "To:"
        }
        
        return label
    }
    
    private func buildTime() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "3:30 PM"
        return label
    }
    
    private func toggleSelected() {
        if isSelected {
            self.backgroundColor = selectedColor
            self.icon.textColor = .white
            self.title.textColor = .white
            self.time.textColor = .white
        } else {
            self.backgroundColor = .none
            self.icon.textColor = secondaryColor
            self.title.textColor = .black
            self.time.textColor = secondaryColor
        }
    }
    
    @objc private func setSelected() {
        delegate.didSelect(topSection: self.topSectionType)
        self.isSelected = true
    }
}
