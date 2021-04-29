//
//  ContentView.swift
//  List
//
//  Created by Gokul Nair on 29/04/21.
//

import SwiftUI

struct videoListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            List(videos, id:\.id){ video in
                NavigationLink(
                    destination: videoDetailView(video: video),
                    label: {
                        Image(video.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .padding(.vertical, 4)
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text(video.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                            
                            Text(video.uploadDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    })
            }.navigationTitle("Tutorials")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        videoListView()
    }
}
