//
//  ProgressView.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI

struct SongProgressView: View {
    
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            ProgressView(value: 0.3)
                .tint(.white)
            HStack {
                Text("1:25").foregroundColor(.white)
                Spacer()
                Text("-4:02").foregroundColor(.white)
            }
            
            HStack(alignment: .center, spacing: 80) {
                Image(systemName: "backward.fill").scaleEffect(2).foregroundColor(.white)
                Image(systemName: "play.fill").scaleEffect(3).foregroundColor(.white)
                Image(systemName: "forward.fill").scaleEffect(2).foregroundColor(.white)
            }.padding([.top, .bottom], 30)
            
            HStack {
                Image(systemName: "speaker.fill").foregroundColor(.white)
                Slider(
                    value: $speed,
                    in: 0...100,
                    onEditingChanged:{ editing in isEditing = editing}
                )
                Image(systemName: "speaker.wave.3.fill").foregroundColor(.white)
            }.padding([.top, .bottom], 30)
            
            HStack(alignment: .center, spacing: 100) {
                Image(systemName: "quote.bubble").scaleEffect(1.5).foregroundColor(.white)
                Image(systemName: "airplayaudio").scaleEffect(1.5).foregroundColor(.white)
                ZStack {
                    Image(systemName: "repeat.circle.fill").foregroundColor(.white).offset(x: 10, y: -10)
                    Image(systemName: "list.bullet").foregroundColor(.white).scaleEffect(1.5)
                }
            }
        }
    }
}

struct SongProgressView_Previews: PreviewProvider {
    static var previews: some View {
        SongProgressView().preferredColorScheme(.dark)
    }
}
