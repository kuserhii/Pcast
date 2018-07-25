//
//  APIService.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/21/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import Foundation
import Alamofire
import FeedKit

class APIService  {

    static let shared = APIService()
    private init() {}
    
    
    func fetchEpisodes(feedUrl: String, completionHandler: @escaping
         ([Episode]) -> ()) {

        guard let url = URL(string: feedUrl) else { return }
        
        DispatchQueue.global(qos: .background).async {
            
            let parser = FeedParser(URL: url)
            
            parser.parseAsync (result: { (result) in
                print("Successfully parse feed: ", result.isSuccess)
                
                if let err = result.error {
                    print("Failed to parse XML feed:", err)
                    return
                }
                
                guard let feed = result.rssFeed else { return }
                let episodes = feed.toEpisodes()
                completionHandler(episodes)     
            })
        }
    }
    
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {

        let baseiTunesSearchURL = "https://itunes.apple.com/search?"
        let parameters = ["term": searchText, "media": "podcast"]
        
        Alamofire.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            
            if let err = dataResponse.error {
                print("Failed to contact ", err)
            }
            
            guard let data = dataResponse.data else { return }
            do {
                let searchResult = try
                    JSONDecoder().decode(PodcastSearchResult.self, from: data)
                completionHandler(searchResult.results)
        
            } catch let decodeErr {
                print("Failed to decode:" , decodeErr)
            }  
        }
    }
    
    struct PodcastSearchResult: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
  
    
}
