//
//  Extensions.swift
//  Demo_MusicPlayer
//
//  Created by unclean on 2023/01/31.
//

import Foundation

extension DateComponentsFormatter {
    static let abbreviated: DateComponentsFormatter = {
        print("Initalizing DatecomponentsFormatter.abbreviated")
        let fomatter = DateComponentsFormatter()
        
        fomatter.allowedUnits = [.hour, .minute, .second]
        fomatter.unitsStyle = .abbreviated
        
        return fomatter
    }()
    
    static let positional: DateComponentsFormatter = {
        print("Initalizing DatecomponentsFormatter.positional")
        let fomatter = DateComponentsFormatter()
        
        fomatter.allowedUnits = [.minute, .second]
        fomatter.unitsStyle = .positional
        fomatter.zeroFormattingBehavior = .pad
        
        return fomatter
    }()
}
