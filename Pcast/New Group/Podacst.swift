//
//  Podcast.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/17/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl100: String?
    var trackCount: Int?
    var feedUrl: String?
}


