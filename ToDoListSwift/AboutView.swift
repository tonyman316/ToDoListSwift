//
//  AboutView.swift
//  ToDoListSwift
//
//  Created by Tony's Mac on 10/22/14.
//  Copyright (c) 2014 DeAnza. All rights reserved.
//

import Foundation
import UIKit

class AboutView: UIViewController {

    @IBOutlet var aboutView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let myURL = NSURL(string: "http:/worldflags.com")
        let request = NSURLRequest(URL: myURL!)
        aboutView.loadRequest(request)
    }


}
