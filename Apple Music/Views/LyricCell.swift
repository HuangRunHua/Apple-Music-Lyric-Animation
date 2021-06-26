//
//  LyricCell.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI

struct LyricCell: View {
    
    @State var lyric: Lyric
    
    @EnvironmentObject var songStore: SongStore
    @EnvironmentObject var playStore: PlayStore
    
    
    var lyricIndex: Int {
        songStore.allSongs[0].lyrics.firstIndex(where: { $0.id == lyric.id })!
    }
    
    
    var body: some View {
        Text(lyric.lyric)
            .foregroundColor(.white)
            .font(.system(size: !lyric.isBlur ? 25: 30, weight: .bold, design: .rounded))
            .multilineTextAlignment(.leading)
            .padding([.top, .bottom], 10)
            .blur(radius: !lyric.isBlur ? 2: 0)
            .onTapGesture {
                updateSelectedLyric(at: self.lyricIndex)
            }
    }
    
    
    func updateSelectedLyric(at index: Int) {
        print("selected lyric = \(self.lyric.lyric)")
        print("selected lyric = \(self.songStore.allSongs[0].lyrics[index].lyric)")
        for lyric in songStore.allSongs[0].lyrics {
            lyric.isBlur = false
        }
        songStore.allSongs[0].lyrics[index].isBlur = true
        songStore.isListChanged = true
        
        songStore.noBlurCellIndex = index
        songStore.currentTime = songStore.allSongs[0].lyrics[index].time
        print(songStore.noBlurCellIndex)
    }
}

struct LyricCell_Previews: PreviewProvider {
    static var previews: some View {
        LyricCell(lyric: songs[0].lyrics[0]).preferredColorScheme(.dark)
    }
}
