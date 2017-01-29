//
//  SearchViewController.swift
//  Project
//
//  Created by xcodewarrior on 21.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import Foundation
import UIKit



class SearchViewController : UIViewController , UITableViewDataSource , UITableViewDelegate
{
    var allTours : [Tur] = [Tur]();
    var applicationLanguage : String = "Turkish";
    @IBOutlet weak var infoTableView: UITableView!
    
    struct id{
        static var cellIdentifier = "identityCell";
        static var showIdentifier = "showIdentifier";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.editNavBar()
        self.navigationController!.navigationBar.topItem!.title = "";
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTours.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(id.showIdentifier, sender: self);
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(self.applicationLanguage == "Turkish")
        {
            return "Arama Sonuçları";
        }
        else
        {
            return "Searching Results";
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCellWithIdentifier(id.cellIdentifier, forIndexPath: indexPath) as! SpecialSearchCell;
        
        let currentTour = self.allTours[indexPath.row];
    
        myCell.layer.cornerRadius = 8;
        myCell.layer.borderColor = UIColor.whiteColor().CGColor;
        myCell.layer.borderWidth = 2;
        myCell.searchImageView.image = currentTour.imageFirst;
        myCell.searchNameLabel.text = currentTour.tourName;
        
        return myCell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let aController = segue.destinationViewController as! ToursViewController
        
        let currentRow = self.infoTableView.indexPathForSelectedRow?.row;
        
        let currentTour = self.allTours[currentRow!];
        
        aController.imageOutlet = currentTour.imageFirst;
        aController.subImageOutlet1 = currentTour.imageFirst;
        aController.subImageOutlet2 = currentTour.imageSecond;
        aController.subImageOutlet3 = currentTour.imageThird;
        
        
        aController.calendar = currentTour.tourCalendarInformation;
        aController.name = currentTour.tourName;
        aController.desct = currentTour.tourGeneralDetails;
        aController.price = "$$$";
        
    }
    func editNavBar()
    {
        let sColor = UIColor(red: 201.0/255, green: 59.0/255, blue: 94.0/255, alpha: 1.0);
        self.navigationItem.title = "HARTUR";
        self.navigationController?.navigationBar.barTintColor = sColor;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont(name: "Avenir",size: 28)!];
    }
    
}
