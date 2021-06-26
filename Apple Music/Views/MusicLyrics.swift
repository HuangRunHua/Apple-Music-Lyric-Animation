//
//  MusicLyrics.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI

struct MusicLyrics: View {
    
    @State var song: Song
    @EnvironmentObject var songStore: SongStore
    
    
    init(song: Song) {
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        self.song = song
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(song.lyrics, id: \.id) { lyric in
                    LyricCell(lyric: lyric)
                        .id(lyric.id)
                }
                .listRowBackground(Color.clear.ignoresSafeArea())
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .onReceive(songStore.objectWillChange) {
                withAnimation(.linear) {
                    print(songStore.noBlurCellIndex)
                    if songStore.noBlurCellIndex != 0 {
                        proxy.scrollTo(songs[0].lyrics[songStore.noBlurCellIndex-1].id, anchor: .top)
                    } else {
                        proxy.scrollTo(songs[0].lyrics[songStore.noBlurCellIndex].id, anchor: .top)
                    }
                }
            }
        }
    }
}

struct MusicLyrics_Previews: PreviewProvider {
    static var previews: some View {
        MusicLyrics(song: songs[0])
            .preferredColorScheme(.dark)
    }
}
