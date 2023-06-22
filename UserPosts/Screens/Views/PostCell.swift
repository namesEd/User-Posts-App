//
//  PostCell.swift
//  UserPosts
//
//  Created by Edward Kyles on 6/21/23.
//

import SwiftUI

struct PostCell: View {
    let post: Posts
    
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                Text("\(post.userId)")
                    .foregroundColor(.primary)
                    .frame(alignment: .leading)
                VStack (alignment: .leading) {
                    Text("Post number: \(post.id)")
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    Text(post.title)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    Text(post.body)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(20)
            Rectangle()
                .fill(Color.cyan.opacity(0.2))
                .cornerRadius(15)
                .frame(height: 100)
                .padding(10)
        }
    }
}


struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Posts.mock)
    }
}
