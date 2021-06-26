//
//  PlayView.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI
import AVFoundation

struct PlayView: View {
    
    @EnvironmentObject var songStore: SongStore
    @EnvironmentObject var playStore: PlayStore
    @State var isPlaying = false
    
    
    let player = AVPlayer()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // 加载视图时便开始播放音乐
    init() {
        let fileUrl = Bundle.main.url(forResource: "起风了", withExtension: "m4a")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        
        let time = CMTime(value: 2, timescale: 1)
        player.seek(to: time)
        player.play()
    }
    
    var body: some View {
        ZStack {
            
            LinearGradient.backgroundGradient(startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .onReceive(songStore.objectWillChange) {
                    // 播放指定起始时间点的音乐
                    let time = CMTime(value: CMTimeValue(songStore.currentTime), timescale: 1)
                    player.seek(to: time)
                    player.play()
                }

            
            VStack {
                Image(systemName: "minus")
                    .scaleEffect(2)
                    .padding([.bottom], 10)
                    .padding([.top], -10)
                    .foregroundColor(.white)
                
                MusicInfoView(song: songStore.allSongs[0]).padding([.leading, .trailing], 25)
                    .onReceive(timer) { time in
                        print("time = \(time)")
                        update()
                    }

                MusicLyrics(song: playStore.allSongs[0]).padding([.leading], 10)
                
                
            }
        }
    }
    
        
    /**
     *  @update()
     *  歌词自动滚动的更新方法
     */
    func update() {
        playStore.isListChanged = false
        let currentPlayTime = player.currentTime().seconds
        print("currentPlayTime = \(currentPlayTime)")
        for i in 0..<songStore.allSongs.count {
            for j in 0..<songStore.allSongs[i].lyrics.count {
                if Int(currentPlayTime) == songStore.allSongs[i].lyrics[j].time {
                    print("j.lyric = \(songStore.allSongs[i].lyrics[j].lyric)")
                    playStore.currentPlayTime = Double(currentPlayTime)
                    playStore.noBlurCellIndex = j

                    for h in 0..<songStore.allSongs.count {
                        for k in 0..<songStore.allSongs[i].lyrics.count {
                            playStore.allSongs[h].lyrics[k].isBlur = false
                        }
                    }
                    playStore.allSongs[i].lyrics[j].isBlur = true
                    playStore.isListChanged = true
                
                    break
                }
            }
        }
    }

}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView().environmentObject(SongStore())
            .environmentObject(PlayStore())
    }
}
