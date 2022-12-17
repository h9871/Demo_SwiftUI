//
//  OnBoardingScreen.swift
//  Demo_Walkthrough
//
//  Created by unclean on 2022/12/17.
//

import SwiftUI

struct OnBoardingScreen: View {
    // MARK: 슬라이드 아이템
    @State var onboardingItems: [OnboardingItem] = [
        OnboardingItem(title: "First Title",
                       subTitle: "first description first description first description first description first description first description",
                       color: .red),
        OnboardingItem(title: "Second Title",
                       subTitle: "second description second description second description second description second description second description",
                       color: .blue),
        OnboardingItem(title: "Third Title",
                       subTitle: "third description third description third description third description third description third description",
                       color: .yellow)
    ]
    
    // MARK: 슬라이더 인덱스
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            HStack(spacing: 0) {
                // 아이템 수 대로 반복 진행
                ForEach($onboardingItems) { $item in
                    let isLastSilde = (currentIndex == onboardingItems.count - 1)
                    
                    VStack {
                        // MARK: 탑 뷰
                        TopView(currentIndex: $currentIndex,
                                onboardingItems: $onboardingItems,
                                isLastSilde: isLastSilde)
                        
                        // MARK: 컨텐츠 뷰
                        CenterView(currentIndex: $currentIndex,
                                      onboardingItems: $onboardingItems,
                                      item: $item,
                                      size: size)
                        
                        Spacer(minLength: 0)
                        
                        // MARK: 바텀 뷰
                        BottomView(currentIndex: $currentIndex,
                                   onboardingItems: $onboardingItems,
                                   isLastSilde: isLastSilde)
                    }
                    .animation(.easeOut, value: isLastSilde)
                    .padding(15)
                    .frame(width: size.width, height: size.height)
                }
            }
        }
    }
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
