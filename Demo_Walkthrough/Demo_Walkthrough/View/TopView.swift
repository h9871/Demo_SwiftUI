//
//  TopView.swift
//  Demo_Walkthrough
//
//  Created by unclean on 2022/12/17.
//

import SwiftUI

struct TopView: View {
    @Binding var currentIndex: Int
    @Binding var onboardingItems: [OnboardingItem]
    let isLastSilde: Bool
    
    var body: some View {
        HStack {
            Button("Back") {
                if currentIndex > 0 {
                    currentIndex -= 1
                }
            }
            .opacity(currentIndex > 0 ? 1 : 0)
            
            Spacer(minLength: 0)
            
            Button("Skip") {
                currentIndex = onboardingItems.count - 1
            }
            .opacity(isLastSilde ? 0 : 1)
            
        }
        .animation(.easeInOut, value: currentIndex)
        .tint(Color("Green"))
        .fontWeight(.bold)
    }
}
