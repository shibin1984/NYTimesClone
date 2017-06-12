//
//  HomeViewController.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 6/5/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    let homeController = HomeController.init()
    var newsFeedsData : Array<Any>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Fetch the news feeds
        self.showProgress()
        
        // Call the API to fetch the news feeds.
        homeController.getNewsFeeds(page: INITIAL_PAGE_VALUE) { (status, data, headerDict) in
            if status == true {
                
                // Get the Home Storyboard instance
                let homeSB = UIStoryboard.init(name: SB_HOME, bundle: nil)
                
                // Create the destination viewcontroller
                let newsFeedsVC : NewsFeedsViewController = homeSB.instantiateViewController(withIdentifier: VC_NEWSFEEDS_VIEW_CONTROLLER) as! NewsFeedsViewController
                
                // Assign the data array to the view controller
                newsFeedsVC.newsFeeds = data
                newsFeedsVC.headerDict = headerDict
                
                // Navigate to the destination view controller
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(newsFeedsVC, animated: true)
                }
            }
            else {
                // Show message in case of error.
                self.showAlertMessage(message: ALERT_MESSAGE_TRY_AGAIN, title: ALERT_TITLE_MAIN)
            }
            self.hideProgress()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
