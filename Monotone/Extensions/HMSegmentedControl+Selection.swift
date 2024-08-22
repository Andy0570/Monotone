//
//  HMSegmentedControl+Selection.swift
//  Monotone
//
//  Created by Qilin Hu on 2024/8/12.
//

import HMSegmentedControl

extension HMSegmentedControl {

    func equalToSelectedSegmentIndex(index: Int) -> Bool {
        return NSDecimalNumber(value: index) ==  NSDecimalNumber(value: self.selectedSegmentIndex)
    }

    func setSelectedSegmentIndex(index: Int, animated: Bool) {
        if (index < 0 || self.sectionTitles == nil || index > self.sectionTitles!.count) {
            self.setSelectedSegmentIndex(HMSegmentedControlNoSegment, animated: animated)
        } else {
            self.setSelectedSegmentIndex(UInt(index), animated: animated)
        }
    }
}
