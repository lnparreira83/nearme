//
//  PlaceViewList.swift
//  NearMe
//
//  Created by Lucas Parreira on 21/05/21.
//

import SwiftUI
import MapKit

struct PlaceViewList: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack{
                EmptyView()
            }.frame(width:UIScreen.main.bounds.size.width, height: 20)
            .background(Color(.systemGray6))
            .gesture(TapGesture()
            .onEnded(self.onTap)
            )
            
            List {
                ForEach(self.landmarks, id: \.id){ landmark in
                    
                    VStack(alignment: .leading){
                        Text(landmark.name)
                            .fontWeight(.bold)
                        Text(landmark.title)
                    }
                }
            }.animation(nil)
        }.cornerRadius(10)
    }
}

struct PlaceViewList_Previews: PreviewProvider {
    static var previews: some View {
        PlaceViewList(landmarks: [Landmark(placemark: MKPlacemark())], onTap: {})
    }
}
