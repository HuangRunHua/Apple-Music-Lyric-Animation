//
//  MusicInfoView.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI

struct MusicInfoView: View {
    
    @State var song: Song
    
    var body: some View {
        HStack {
            
            Image(song.cover)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(5)
                .shadow(color: .gray, radius: 5, y: 2)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(song.name)
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold, design: .default))
                Text(song.singer)
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .bold, design: .default))
            }
            
            Spacer()
            
            Image(systemName: "ellipsis.circle.fill")
                .foregroundColor(.white)
                .opacity(0.8)
                .scaleEffect(1.6)
        }
    }
}

struct MusicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MusicInfoView(song: songs[0]).preferredColorScheme(.dark)
    }
}
