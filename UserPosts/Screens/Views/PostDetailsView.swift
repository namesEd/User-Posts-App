//
//  PostDetailsView.swift
//  UserPosts
//
//  Created by Edward Kyles on 6/21/23.
//
//Starting point

import SwiftUI

struct PostDetailsView: View {
    let post: Posts
    
    var body: some View {
        VStack {
            Text(post.title)
                .font(.title)
                .padding()
            Text(post.body)
                .padding()
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct PostDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostDetailsView()
//    }
//}
