//
//  Podcast.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/17/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import Foundation

class Podcast: NSObject, Decodable, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        print("Tryin to transform Podcast into Data")
        aCoder.encode(trackName ?? "", forKey: "trackNameKey")
        aCoder.encode(artistName ?? "", forKey: "artistNameKey")
        aCoder.encode(artworkUrl100 ?? "", forKey: "artworkKey")
        aCoder.encode(feedUrl ?? "", forKey: "feedUrlKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("Trying to tun Data into Podcast")
        self.trackName = aDecoder.decodeObject(forKey: "trackNameKey") as? String
        self.artistName = aDecoder.decodeObject(forKey: "artistNameKey") as? String
        self.artworkUrl100 = aDecoder.decodeObject(forKey: "artworkKey") as? String
        self.feedUrl = aDecoder.decodeObject(forKey: "feedUrlKey") as? String
    }
    
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
    var trackCount: Int?
    var feedUrl: String?
}


