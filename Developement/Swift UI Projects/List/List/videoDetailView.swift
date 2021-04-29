//
//  videoDetailView.swift
//  List
//
//  Created by Gokul Nair on 29/04/21.
//

import SwiftUI

struct videoDetailView: View {
    
    var video: Video
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 12 ) {
            Spacer()
            
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width:450 ,height: 180)
                .padding(.top)
            
            Text(video.title)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 100) {
                Label(
                    title: { Text("\(video.viewCount)") },
                    icon: { Image(systemName: "eye.fill") }
                ).foregroundColor(.secondary)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding()
            
            Text(video.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: video.url, label: {
                Text("Watch Now")
                    .bold()
                    .font(.title2)
                    .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color(.systemRed))
                    .cornerRadius(10)
            })
            
        }
    }
}

struct videoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        videoDetailView(video: VideoList.topTen.first!)
    }
}







