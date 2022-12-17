//
//  OnBoardingItem.swift
//  Demo_Walkthrough
//
//  Created by unclean on 2022/12/17.
//

import SwiftUI

// MARK: OnBoarding Item Model
struct OnboardingItem: Identifiable, Equatable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var color: Color = .clear
}
