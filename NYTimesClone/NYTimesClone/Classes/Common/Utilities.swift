//
//  Utilities.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 6/7/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class Utilities: NSObject {

    class func formatDate(fromDate: Date) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = "yyyy-MM-dd" // HH:mm:ss
        
        let myString = formatter.string(from: Date())
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        
        return myStringafd
    }
}
