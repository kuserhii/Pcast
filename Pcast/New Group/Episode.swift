//
//  Episode.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/21/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    let title: String
    let pubDate: Date
    let description: String
    var imageUrl: String?
    let author: String
    let streamUrl: String
    
    init(feedItem: RSSFeedItem) {
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        
        self.description = feedItem.iTunes?.iTunesSubtitle ??
            feedItem.description ?? ""
        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
        self.imageUrl =  feedItem.iTunes?.iTunesImage?.attributes?.href
    }
}
