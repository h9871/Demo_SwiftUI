//
//  ResizeableView.swift
//  Demo_Walkthrough
//
//  Created by unclean on 2022/12/17.
//

import SwiftUI

// MARK: Resizable View Without Background
struct ResizableView: UIViewRepresentable {
    @Binding var onboardingItem: OnboardingItem
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        setupView(view)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func setupView(_ to: UIView) {
        let view = UIView()
        view.backgroundColor = UIColor(onboardingItem.color)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            view.widthAnchor.constraint(equalTo: to.widthAnchor),
            view.heightAnchor.constraint(equalTo: to.heightAnchor)
        ]
        to.addSubview(view)
        to.addConstraints(constraints)
    }
}
