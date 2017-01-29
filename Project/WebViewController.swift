//
//  WebViewController.swift
//  Project
//
//  Created by xcodewarrior on 21.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import Foundation
import UIKit


class WebViewController : UIViewController
{
    @IBOutlet weak var infoWebView: UIWebView!
    var takenURL = String()
    override func viewDidLoad() {
        let urlT = NSURL(string: takenURL);
        guard let url = urlT else {
            return;
        }
        let req = NSURLRequest(URL: url);
        infoWebView.loadRequest(req);
        
        super.viewDidLoad();
    }
   
    
    
}