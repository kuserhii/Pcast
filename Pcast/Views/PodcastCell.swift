//
//  Podcast.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/21/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import UIKit
import SDWebImage

class PodcastCell: UITableViewCell {
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
              
            guard let url = URL(string: podcast.artworkUrl100 ?? "" ) else { return }
            /*
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    self.podcastImageView.image = UIImage(data: data)
                }
                
            }.resume()
            */
            
            
            
            podcastImageView.sd_setImage(with: url, completed: nil)
            
        }
    }
    
}
