//
//  ContentView.swift
//  Demo_MusicPlayer
//
//  Created by unclean on 2023/01/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MusicPlayerView(musicVM: MusicViewModel(music: Music.data))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}
