//
//  UserService.swift
//  UserPosts
//
//  Created by Edward Kyles on 6/21/23.
//

import Foundation
import Combine

class UserService {
    var cancellable = Set<AnyCancellable>()
    
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    //TODO: fix the memory leak

    func fetchPosts() -> Future<[Posts], Error> {
        return Future { promise in
            let finalUrlString = self.urlString // leaking memory
            let url = URL(string: finalUrlString)!
            
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data } //Data
            //[Contact].self
                .decode(type: [Posts].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let err):
                        promise(.failure(err))
                    }
                } receiveValue: {response in
                    promise(.success(response))
                }
                .store(in: &self.cancellable)
        }
    }
}
