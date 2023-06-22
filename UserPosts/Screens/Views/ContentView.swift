//
//  ContentView.swift
//  UserPosts
//
//  Created by Edward Kyles on 6/21/23.
//
//This is the starting point


import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: PostDetailsView(post: post)) {
                    VStack(alignment: .leading) {
                        Text("A post from user \(post.userId)")
                        Text(post.title)
                            .font(.headline)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("User Posts")
            .onAppear {
                viewModel.getPosts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
