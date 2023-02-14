//
//  MusicViewModel.swift
//  Demo_MusicPlayer
//
//  Created by unclean on 2023/01/31.
//

import Foundation

final class MusicViewModel: ObservableObject {
    private(set) var music: Music
    
    init(music: Music) {
        self.music = music
    }
}

struct Music {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Music(title: "1 Minute Relaxing Music",
                            description: "Music in my life",
                            duration: 70,
                            track: "music1",
                            image: "")
}
