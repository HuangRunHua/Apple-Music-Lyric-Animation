//
//  Song.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import Foundation

class Song: ObservableObject {
    
    var name: String
    var singer: String
    var cover: String
    var lyrics: [Lyric]
    
    init(name: String, singer: String, cover: String, lyrics: [Lyric]) {
        self.lyrics = lyrics
        self.name = name
        self.singer = singer
        self.cover = cover
    }
}



class Lyric {
    var id: UUID = UUID()
    var isBlur: Bool
    var lyric: String
    var time: Int

    
    init(lyric: String, isBlur: Bool, time: Int) {
        self.lyric = lyric
        self.isBlur = isBlur
        self.time = time
    }
    
}
