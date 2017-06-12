//
//  NewsFeedsViewController.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 6/5/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class NewsFeedsViewController: UICollectionViewController {

    let newsFeedController = NewsFeedsController.init()
    var newsFeeds : Array<Any>?
    var headerDict : NSDictionary?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register custom cell classes
        self.collectionView?.register(UINib.init(nibName: "NewsFeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        // Set the Navigation bar title
        self.navigationItem.title = NAV_TITLE_NEWS_FEEDS
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Return 1 as there is only 1 section
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return the number of news feed items
        return newsFeeds!.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> NewsFeedCollectionViewCell {
        // Initialize the Custom cell for display the news feeds.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewsFeedCollectionViewCell
        
        // Configure the cell
        let aNewsFeed : NewsFeed = newsFeeds![indexPath.row] as! NewsFeed
        
        cell.updateCellData(newsFeed: aNewsFeed)
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Navigate the user to the News Details screen.
        // Get the Home Storyboard instance
        let homeSB = UIStoryboard.init(name: SB_HOME, bundle: nil)
        
        // Create the destination viewcontroller
        let newsFeedsVC : NewsFeedDetailsViewController = homeSB.instantiateViewController(withIdentifier: VC_NEWSFEED_DETAILS_VIEW_CONTROLLER) as! NewsFeedDetailsViewController
        
        // Assign the data array to the view controller
        newsFeedsVC.aNewsFeed = newsFeeds![indexPath.row] as? NewsFeed
        
        // Navigate to the destination view controller
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(newsFeedsVC, animated: true)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (newsFeeds?.count)! - 1 {
            // Call the API to fetch the news feeds.
            let newPageCount = self.headerDict?.value(forKey: "offset") as! Int
            newsFeedController.getNewsFeeds(page: newPageCount / 10 + 1) { (status, data, headerDict) in
                self.headerDict = headerDict                
                if status == true {
                    for i in 0 ..< data.count {
                        let aFeed : NewsFeed = data[i] as! NewsFeed
                        self.newsFeeds?.append(aFeed)
                    }
                    self.collectionView?.reloadData()
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if indexPath.row == newsFeeds?.count {
            return true
        }
        else {
            return false
        }
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
}
