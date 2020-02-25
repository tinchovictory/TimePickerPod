//
//  TimePickerView.swift
//  TimePickerPod
//
//  Created by Martin Victory on 24/02/2020.
//

import UIKit

class TimePickerView: UIView {
    
    private let hoursView: UIView

    override init(frame: CGRect) {
        hoursView = UIView()
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        hoursView = UIView()
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
    }
    
}
