//
//  ContentView.swift
//  SwiftUI-List-Starter
//
//  Created by Sean Allen on 4/23/21.
//

import SwiftUI

struct VedioListView: View {
    var videos : [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView{
            List(videos ,id: \.id) { vedio in
                
                NavigationLink(
                    destination: VedioDetailView(video: vedio),
                    label: {
                         VideoListItemView(video: vedio)
                    })
            }.navigationTitle("Shoans top ten")
        }

    }
}

struct VideoListItemView: View{
    var video: Video
    var body: some View {
        HStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:70)
                .cornerRadius(4)
                .padding(.vertical,4)
            
            VStack(alignment:.leading,spacing:5){
                
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(0.5)
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VedioListView()
    }
}
