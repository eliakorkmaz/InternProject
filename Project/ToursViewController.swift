//
//  ToursViewController.swift
//  Project
//
//  Created by xcodewarrior on 19.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ToursViewController : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad();
        styleImageViews();
        tapGestures();
        self.topImage.image = imageOutlet;
        self.subImage1.image = subImageOutlet1;
        self.subImage2.image = subImageOutlet2;
        self.subImage3.image = subImageOutlet3;
        self.tourName.text = name;
        self.tourCalendar.text = calendar;
        self.tourDescriptionLabel.text = desct;
        self.tourPrice.text = price;
        self.editNavBar();
    }
    var imageOutlet : UIImage!;
    var subImageOutlet1 : UIImage!;
    var subImageOutlet2 : UIImage!;
    var subImageOutlet3 : UIImage!;
    
    var name: String!;
    var calendar : String!;
    var desct : String!;
    var price : String!;
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var subImage1: UIImageView!
    @IBOutlet weak var subImage2: UIImageView!
    @IBOutlet weak var subImage3: UIImageView!
    
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var tourCalendar: UILabel!
    @IBOutlet weak var tourDescriptionLabel: UILabel!
    @IBOutlet weak var tourPrice: UILabel!
    
    func styleImageViews()
    {
        self.topImage.layer.cornerRadius = self.topImage.frame.width / 16.0;
        self.topImage.layer.masksToBounds = true;
        self.topImage.layer.borderColor = UIColor.blueColor().CGColor
        
        self.subImage1.layer.cornerRadius = self.subImage1.frame.width / 16.0;
        self.subImage1.layer.masksToBounds = true;
        self.topImage.layer.borderColor = UIColor.blueColor().CGColor
        
        self.subImage2.layer.cornerRadius = self.subImage2.frame.width / 16.0;
        self.subImage2.layer.masksToBounds = true;
        self.topImage.layer.borderColor = UIColor.blueColor().CGColor
        
        self.subImage3.layer.cornerRadius = self.subImage3.frame.width / 16.0;
        self.subImage3.layer.masksToBounds = true;
        self.topImage.layer.borderColor = UIColor.blueColor().CGColor
        
        self.subImage1.userInteractionEnabled = true;
        self.subImage2.userInteractionEnabled = true;
        self.subImage3.userInteractionEnabled = true;
        
    }
    
    func tapGestures()
    {
        let firstGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstGestureHandler));
        let secondGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(secondGestureHandler));
        let thirdGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(thirdGestureHandler));
        
        firstGesture.numberOfTapsRequired = 1;
        secondGesture.numberOfTapsRequired = 1;
        thirdGesture.numberOfTapsRequired = 1;
        
        self.subImage1.addGestureRecognizer(firstGesture);
        self.subImage2.addGestureRecognizer(secondGesture);
        self.subImage3.addGestureRecognizer(thirdGesture);
    }
    
    func firstGestureHandler(sender : UITapGestureRecognizer)
    {
        self.topImage.image = self.subImage1.image;
    }
    func secondGestureHandler(sender : UITapGestureRecognizer)
    {
        self.topImage.image = self.subImage2.image;
    }
    func thirdGestureHandler(sender : UITapGestureRecognizer)
    {
        self.topImage.image = self.subImage3.image;
    }
    func editNavBar()
    {
        let sColor = UIColor(red: 201.0/255, green: 59.0/255, blue: 94.0/255, alpha: 1.0);
        self.navigationItem.title = "HARTUR";
        self.navigationController?.navigationBar.barTintColor = sColor;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont(name: "Avenir",size: 28)!];
        self.navigationController!.navigationBar.topItem!.title = "";
    }
    
    
}
