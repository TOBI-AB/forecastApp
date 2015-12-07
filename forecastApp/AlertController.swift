//
//  AlertController.swift
//  forecastApp
//
//  Created by GhaffarEtt on 07/12/2015.
//  Copyright © 2015 GhaffarEtt. All rights reserved.
//

import UIKit

class AlertHandling {

    let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController
   
    func showAlertWith(message: String) {
       
        guard let rootViewController = rootViewController as UIViewController? else {
            return
        }
        
        if (rootViewController.presentedViewController != nil) {
            return
        } else {
            
            let alert = UIAlertController(title: "Error getting current location!", message: "\(message)", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
           
            rootViewController.loadViewIfNeeded()
            rootViewController.presentViewController(alert, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

   }
