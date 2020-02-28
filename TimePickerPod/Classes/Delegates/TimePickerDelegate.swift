//
//  TimePickerDelegate.swift
//  FBSnapshotTestCase
//
//  Created by Martin Victory on 26/02/2020.
//

import Foundation

protocol TimePickerDelegate: class {
    func didSelect(hour: Date)
    
    func didSelect(minute: Date)
    
    func didSelect(topSection: TopSectionType)
}
