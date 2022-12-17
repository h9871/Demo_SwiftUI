//
//  BottomView.swift
//  Demo_Walkthrough
//
//  Created by unclean on 2022/12/17.
//

import SwiftUI

struct BottomView: View {
    @Binding var currentIndex: Int
    @Binding var onboardingItems: [OnboardingItem]
    let isLastSilde: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            Text(isLastSilde ? "Login" : "Next")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, isLastSilde ? 13 : 12)
                .frame(maxWidth: .infinity)
                .background {
                    Capsule()
                        .fill(Color("Green"))
                }
                .padding(.horizontal, isLastSilde ? 30 : 100)
                .onTapGesture {
                    if currentIndex < onboardingItems.count - 1 {
                        // 다음 페이지 이동
                        currentIndex += 1
                    }
                }
        }
        
        HStack {
            Text("Terms of Service")
            Text("Privacy Policy")
        }
        .font(.caption2)
        .underline(true, color: .primary)
        .offset(y: 5)
    }
}
