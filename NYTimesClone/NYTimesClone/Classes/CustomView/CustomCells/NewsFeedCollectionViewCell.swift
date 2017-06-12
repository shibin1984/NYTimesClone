//
//  NewsFeedCollectionViewCell.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 5/31/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class NewsFeedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsSnippetLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCellData(newsFeed : NewsFeed) {
        // Set the title as the Feeds head line
        newsTitleLabel.text = newsFeed.headline?["main"] as? String
        newsSnippetLabel.text = newsFeed.snippet
        newsDateLabel.text = newsFeed.pub_date
    }
}
