//
//  TimePickerDelegate.swift
//  FBSnapshotTestCase
//
//  Created by Martin Victory on 26/02/2020.
//

import Foundation

public protocol TimePickerDelegate: class {
    func didSelect(hour: Date)
}
