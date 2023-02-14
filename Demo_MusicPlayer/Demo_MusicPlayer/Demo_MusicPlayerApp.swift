//
//  Demo_MusicPlayerApp.swift
//  Demo_MusicPlayer
//
//  Created by unclean on 2023/01/31.
//

import SwiftUI

@main
struct Demo_MusicPlayerApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(audioManager)
        }
    }
}
