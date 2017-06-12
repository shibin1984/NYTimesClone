//
//  NewsFeedsController.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 6/5/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class NewsFeedsController: NSObject {

    let apiRouter : APIRouter = APIRouter()
    
    func getNewsFeeds(page: Int, completion: @escaping (_ success: Bool, _ data: Array<Any>, _ headerDict : NSDictionary) -> ()) {
        
        var newsFeedList : Array<Any> = Array.init()
        var headerDict : NSDictionary = NSDictionary()
        
        apiRouter.getNewsFeeds (page: page) { (success, error, data) in
            if let error = error{
                print(error.localizedDescription)
                completion(false, newsFeedList, headerDict)
            }
            else {
                let feeds = data.value(forKeyPath: "response.docs") as! NSArray
                headerDict = data.value(forKeyPath: "response.meta") as! NSDictionary
                for i in 0 ..< feeds.count {
                    let aFeed = feeds[i] as! NSDictionary
                    let aNewsFeed = NewsFeed.init(dataDict: aFeed)
                    newsFeedList.insert(aNewsFeed, at: i)
                }
                
                completion (true, newsFeedList, headerDict)
            }
        }
    }
}
