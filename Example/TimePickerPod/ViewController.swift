//
//  ViewController.swift
//  TimePickerPod
//
//  Created by tinchovictory on 02/19/2020.
//  Copyright (c) 2020 tinchovictory. All rights reserved.
//

import UIKit
import TimePickerPod

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Show TimePicker", for: .normal)
//        button.addTarget(self, action: #selector(showTimePicker(sender:)), for: .touchUpInside)
//
//        self.view.addSubview(button)
        
        let halfDaySection = HalfDaySection()
        halfDaySection.translatesAutoresizingMaskIntoConstraints = false
//        halfDaySection.backgroundColor = .cyan
        self.view.addSubview(halfDaySection)
        
        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            halfDaySection.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            halfDaySection.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
//            halfDaySection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
            halfDaySection.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
        ])
    }
    
//    @objc private func showTimePicker(sender: UIButton) {
//        let timePickerController = TimePickerController()
//        present(timePickerController, animated: true, completion: nil)
//    }
    

}

