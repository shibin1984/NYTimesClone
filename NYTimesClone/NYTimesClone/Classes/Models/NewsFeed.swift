//
//  NeesFeed.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 5/31/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class NewsFeed: NSObject {
    var web_url : String?
    var snippet : String?
    var lead_paragraph : String?
    var abstract : String?
    var print_page : Int?
    var blog : Array<Any>?
    var source : String?
    var multimedia : Array<Any>?
    var headline : [String:Any]?
    var keywords : Array<Any>?
    var pub_date : Date?
    var document_type : String?
    var news_desk : String?
    var section_name : String?
    var subsection_name : String?
    var byline : [String:Any]?
    var type_of_material : String?
    var _id : String?
    var word_count : String?
    var slideshow_credits : String?
    
    
    init(dataDict : NSDictionary) {
        self.web_url = dataDict.value(forKey: "web_url") as? String
        self.snippet = dataDict.value(forKey: "snippet") as? String
        self.lead_paragraph = dataDict.value(forKey: "lead_paragraph") as? String
        if ((dataDict.value(forKey: "abstract") as? String) != nil) {
            self.abstract = dataDict.value(forKey: "abstract") as? String
        }
        self.print_page = dataDict.value(forKey: "print_page") as? Int
        self.blog = dataDict.value(forKey: "blog") as? Array<Any>
        self.source = dataDict.value(forKey: "source") as? String
        self.multimedia = dataDict.value(forKey: "multimedia") as? Array<Any>
        self.headline = dataDict.value(forKey: "headline") as? [String : Any]
        self.keywords = dataDict.value(forKey: "keywords") as? Array<Any>
        self.pub_date = dataDict.value(forKey: "pub_date") as? Date
        self.document_type = dataDict.value(forKey: "document_type") as? String
        self.news_desk = dataDict.value(forKey: "news_desk") as? String
        self.section_name = dataDict.value(forKey: "section_name") as? String
        self.subsection_name = dataDict.value(forKey: "subsection_name") as? String
        self.byline = dataDict.value(forKey: "byline") as? [String : Any]
        self.type_of_material = dataDict.value(forKey: "type_of_material") as? String
        self._id = dataDict.value(forKey: "_id") as? String
        self.word_count = dataDict.value(forKey: "word_count") as? String
        self.slideshow_credits = dataDict.value(forKey: "slideshow_credits") as? String
        
        super.init()
    }
}
