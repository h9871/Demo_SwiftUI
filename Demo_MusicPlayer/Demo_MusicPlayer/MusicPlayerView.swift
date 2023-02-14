//
//  MusicPlayerView.swift
//  Demo_MusicPlayer
//
//  Created by unclean on 2023/01/31.
//

import SwiftUI

struct MusicPlayerView: View {
    @StateObject var musicVM: MusicViewModel
    @State private var showPlayer = false
    
    var body: some View {
        VStack {
            // MARK: - Image
            Image(musicVM.music.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
                .background(.yellow)
            
            // MARK: - Detail
            
            ZStack {
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Music")
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: musicVM.music.duration) ?? musicVM.music.duration.formatted() + "S")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    // MARK: - Title
                    Text(musicVM.music.title)
                        .font(.title)
                    
                    // MARK: - Button
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                    // MARK: - Description
                    Text(musicVM.music.description)
                    
                    Spacer()
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(musicVM: musicVM)
        }
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static let musicVM = MusicViewModel(music: Music.data)
    
    static var previews: some View {
        MusicPlayerView(musicVM: musicVM)
            .environmentObject(AudioManager())
    }
}
