//
//  APIRouter.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 5/31/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class APIRouter: NSObject {
    
    func getNewsFeeds(page: Int, completion: @escaping (_ success: Bool, _ error: Error?, _ data: NSDictionary) -> ()) {
        let url : URL = URL(string: BASE_URL+String(page))!
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(NYT_APIKEY, forHTTPHeaderField: "api-key")
        request.setValue(String(page), forHTTPHeaderField: "page")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            
            var responseDict : NSDictionary?
            
            if let error = error{
                completion (false, error, responseDict!)
            }
            else {
                if let data = data {
                    
                    let jsonResponse : String = String.init(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
                    if !jsonResponse.isEmpty  {
                        responseDict = self.convertToDictionary(text: jsonResponse)! as NSDictionary
                        completion (true, nil, responseDict!)
                    }
                    else {
                        completion (false, nil, responseDict!)
                    }
                }
            }
        }
        
        task.resume()
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
