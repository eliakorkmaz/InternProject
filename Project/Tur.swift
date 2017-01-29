//
//  Tur.swift
//  Project
//
//  Created by xcodewarrior on 18.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import UIKit



class Tur
{
    
    // MARK: -Variables
    var tourName : String!;
    var tourDistrict : turBolgesi = turBolgesi.Undefined;
    var otherTourDistrict : turBolgesi = turBolgesi.Undefined
    var generalTourDistrict : genelTurBolgesi = genelTurBolgesi.Undefined;
    var subTourDistrict : altTurBolgesi = altTurBolgesi.Undefined;
    var photo1 : String = ""
    var photo2 : String = ""
    var photo3 : String = ""
    var tourCalendarInformation : String!;
    var tourGeneralDetails : String!;
    var imageFirst = UIImage();
    var imageSecond = UIImage();
    var imageThird = UIImage();

    
    // MARK: -Constructor
    init(tourName : String , tourDistrict : turBolgesi , generalTourDistrict : genelTurBolgesi , otherTourDistrict : turBolgesi ,  subTourDistrict : altTurBolgesi ,photo1 : String , photo2 : String , photo3 : String , tourCalendar : String , tourDetails : String)
    {
        self.tourName = tourName;
        self.tourDistrict = tourDistrict;
        self.generalTourDistrict = generalTourDistrict;
        self.otherTourDistrict = otherTourDistrict;
        self.subTourDistrict = subTourDistrict;
        self.photo1 = photo1;
        self.photo2 = photo2;
        self.photo3 = photo3;
        self.tourCalendarInformation = tourCalendar;
        self.tourGeneralDetails = tourDetails;
        self.imageFirst = UIImage();
        self.imageSecond = UIImage();
        self.imageThird = UIImage();
    }

    func printTourDatas()
    {
        print("Tour name = \(tourName) ");
        print("Tour District = \(tourDistrict) ");
        print("Tour general district = \(generalTourDistrict) ");
        print("Tour General Details = \(tourGeneralDetails) ");
    }
    
    func loadImageUsingUrlStringForFirst()
    {
        let url = NSURL(string: self.photo1);
        var imageToCache : UIImage!;
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data,response,error)in
            
            if error != nil{
                print(error);
                return;
            }
            dispatch_async(dispatch_get_main_queue(),{
                imageToCache = UIImage(data: data!);
                self.imageFirst = imageToCache;
            })
        }).resume();
    }
    func loadImageUsingUrlStringForSecond()
    {
        let url = NSURL(string: self.photo2);
        var imageToCache : UIImage!;
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data,response,error)in
            
            if error != nil{
                print(error);
                return;
            }
            dispatch_async(dispatch_get_main_queue(),{
                imageToCache = UIImage(data: data!);
                self.imageSecond = imageToCache;
            })
        }).resume();
    }
    func loadImageUsingUrlStringForThird()
    {
        let url = NSURL(string: self.photo3);
        var imageToCache : UIImage!;
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data,response,error)in
            
            if error != nil{
                print(error);
                return;
            }
            dispatch_async(dispatch_get_main_queue(),{
                imageToCache = UIImage(data: data!);
                self.imageThird = imageToCache;
            })
        }).resume();
    }


}
