//
//  EpisodeCell.swift
//  Pcast
//
//  Created by Serhii Kushnir on 7/21/18.
//  Copyright © 2018 Serhii Kushnir. All rights reserved.
//

import UIKit

class EpisodeCell: UITableViewCell {

    var episode: Episode! {
        didSet {
            titleLabel.text = episode.title
            descriptionLabel.text  = episode.description
            
            let dataFormatter = DateFormatter()
            dataFormatter.dateFormat = "dd MMM, yyyy"
            pubDataLabel.text = dataFormatter.string(from: episode.pubDate)
            
            let url = URL(string: episode.imageUrl ?? "" )
            
            episodeImageView.sd_setImage(with: url)
            
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 2
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var pubDataLabel: UILabel!
    @IBOutlet weak var episodeImageView: UIImageView!
}
