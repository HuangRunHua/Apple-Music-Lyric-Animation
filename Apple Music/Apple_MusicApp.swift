//
//  Apple_MusicApp.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI

@main
struct Apple_MusicApp: App {
    var body: some Scene {
        
        let songStore = SongStore()
        let playStore = PlayStore()
        
        WindowGroup {
            PlayView().environmentObject(songStore)
                .environmentObject(playStore)
        }
    }
}
