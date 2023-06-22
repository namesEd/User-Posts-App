//
//  PostViewModel.swift
//  UserPosts
//
//  Created by Edward Kyles on 6/21/23.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    @Published var posts = [Posts]()
    @Published var postsByUserID = [Int: [Posts]]()
    
    var cancellable = Set<AnyCancellable>()
    let service = UserService()
    
    func getPosts() {
        service.fetchPosts()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { posts in
                self.posts = posts
                self.postsByUserID = Dictionary(grouping: posts, by: { $0.userId })
            }
            .store(in: &cancellable)
    }
}
