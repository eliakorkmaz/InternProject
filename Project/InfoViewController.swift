//
//  InfoViewController.swift
//  Project
//
//  Created by xcodewarrior on 16.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import UIKit

class InfoViewController : UIViewController
{
    var applicationLanguage : String = "";
    var version : String = "v 0.1";
    
    // MARK: - Outlets
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.itemEdit();
        self.labelEdit();
        self.backgroundWorks();
        //self.navigationController!.navigationBar.topItem!.title = "";
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    func backgroundWorks()
    {
        self.view.backgroundColor = UIColor.whiteColor();
    }
    
    func labelEdit()
    {
        if(self.applicationLanguage == "Turkish")
        {
            self.label1.text = "HARTUR Mobil Uygulaması \(self.version)";
            self.label1.font = UIFont(name: "Avenir", size: 22);
            self.label1.textColor = UIColor.blueColor();
            self.label2.text = "Hartur Yüzlerce Yurtiçi ve Yurtdışı Turlarını\n Mobil Telefonunuz aracılığı ile ayağınıza getiriyor";
            self.label2.font = UIFont.boldSystemFontOfSize(16);
            self.label2.textColor = UIColor.blackColor();
            self.label3.text = "En İyi Turlar \nYurtiçi ve Yurtdışı Turları \nHızlı ve Kolay Arama";
            self.label3.font = UIFont(name: "Avenir", size: 16);
            self.label3.textColor = UIColor.blackColor();
            
            
            self.label4.text =  "® Hartur Information - 2016";
            self.label4.font = UIFont(name: "Avenir", size: 18);
            
        }else
        {
            self.label1.text = "HARTUR Mobile Application \(self.version)";
            self.label1.font = UIFont(name: "Avenir", size: 22);
            self.label1.textColor = UIColor.blueColor();
            self.label2.text = "Hartur , meets you Domestic and Abroad Tours\n via Your Phone ";
            self.label2.font = UIFont.boldSystemFontOfSize(16);
            self.label2.textColor = UIColor.blackColor();
            self.label3.text = "- Best Tours \n- Domestic and Abroad Tours \n- Smart Searching ";
            self.label3.font = UIFont(name: "Avenir", size: 16);
            self.label3.textColor = UIColor.blackColor();
            
            self.label4.text =  "® Hartur Information - 2016";
            self.label4.font = UIFont(name: "Avenir", size: 18);
        
        }
    }
    
    func itemEdit()
    {
        let sColor = UIColor(red: 201.0/255, green: 59.0/255, blue: 94.0/255, alpha: 1.0);
        self.navigationItem.title = "INFO";
        self.navigationController?.navigationBar.barTintColor = sColor;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont(name: "Avenir",size: 34)!];
    }
    
    
    
    
}
