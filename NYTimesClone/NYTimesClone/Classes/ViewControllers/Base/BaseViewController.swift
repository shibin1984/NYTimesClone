//
//  BaseViewController.swift
//  NYTimesClone
//
//  Created by Shibin Moideen on 6/5/17.
//  Copyright © 2017 Shibin Moideen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var bgView : UIView?
    var activityIndicator : UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Used to show an alert message with a single cancel button with no specific action.
    func showAlertMessage(message: String, title: String) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: TITLE_CANCEL, style: .cancel) { (UIAlertAction) in
            alertController.dismiss(animated: true, completion: { 
                
            })
        }
        
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true) { 
            
        }
    }
    
    // To show the progress view while making an network call or loading.
    func showProgress() {
        DispatchQueue.main.async {
            self.bgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
            self.bgView?.alpha = 0.50
            self.bgView?.backgroundColor = UIColor.lightGray
            self.activityIndicator = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
            self.activityIndicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
            self.activityIndicator?.startAnimating()
            self.activityIndicator?.center = (self.bgView?.center)!
            self.activityIndicator?.center.y = ((self.bgView?.center)?.y)! + 50
            self.bgView?.addSubview(self.activityIndicator!)
            
            if (self.bgView?.superview == nil) {
                self.view.addSubview(self.bgView!)
            }
        }
    }

    // To hide the progress view if its already showing.
    func hideProgress() {
        DispatchQueue.main.async {
            if (self.bgView?.superview != nil) {
                self.activityIndicator?.stopAnimating()
                self.bgView?.removeFromSuperview()
            }
        }
    }
}
