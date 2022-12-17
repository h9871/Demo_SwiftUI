//
//  CenterView.swift
//  Demo_Walkthrough
//
//  Created by unclean on 2022/12/17.
//

import SwiftUI

struct CenterView: View {
    @Binding var currentIndex: Int
    @Binding var onboardingItems: [OnboardingItem]
    @Binding var item: OnboardingItem
    let size: CGSize
    
    var body: some View {
        VStack {
            let offset = -CGFloat(currentIndex) * size.width
            
            // MARK: UIKit 뷰
            ResizableView(onboardingItem: $item)
                .frame(height: size.width)
                .onAppear {
                    if currentIndex == indexOf(item) {
                        // lottieView animation
                    }
                }
                .offset(x: offset)
                .animation(.easeOut(duration: 0.5), value: currentIndex)
            
            Text(item.title)
                .font(.title.bold())
                .offset(x: offset)
                .animation(.easeOut(duration: 0.5).delay(0.1), value: currentIndex)
            
            Text(item.subTitle)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .offset(x: offset)
                .foregroundColor(.gray)
                .animation(.easeOut(duration: 0.5).delay(0.2), value: currentIndex)
        }
    }
    
    func indexOf(_ item: OnboardingItem) -> Int {
        guard let index = onboardingItems.firstIndex(of: item) else {
            return 0
        }
        return index
    }
}
