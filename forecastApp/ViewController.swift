//
//  ViewController.swift
//  forecastApp
//
//  Created by GhaffarEtt on 07/12/2015.
//  Copyright © 2015 GhaffarEtt. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var m: LocationManager!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       m = LocationManager.init()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

