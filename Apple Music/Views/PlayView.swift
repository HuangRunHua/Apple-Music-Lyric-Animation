//
//  PlayView.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI

struct PlayView: View {
    
    @EnvironmentObject var songStore: SongStore
    
    var body: some View {
        ZStack {
            
            LinearGradient.backgroundGradient(startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            
            VStack {
                Image(systemName: "minus")
                    .scaleEffect(2)
                    .padding([.bottom], 10)
                    .padding([.top], -10)
                    .foregroundColor(.white)
                
                MusicInfoView(song: songStore.allSongs[0]).padding([.leading, .trailing], 25)
                MusicLyrics(song: songStore.allSongs[0]).padding([.leading], 10)
                
                SongProgressView().padding([.leading, .trailing], 25)
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView().environmentObject(SongStore())
    }
}
