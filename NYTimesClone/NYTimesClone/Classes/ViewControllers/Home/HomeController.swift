//
//  HomeController.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 6/5/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class HomeController: NSObject {

    let apiRouter : APIRouter = APIRouter()
    
    func getNewsFeeds(page: Int, completion: @escaping (_ success: Bool, _ data: Array<Any>) -> ()) {
        
        apiRouter.getNewsFeeds (page: page) { (success, error, data) in
            if (error != nil) {
                completion(false, data)
            }
            else{
                completion(true, data)
            }
        }
    }
}
    
