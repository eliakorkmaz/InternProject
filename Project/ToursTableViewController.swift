//
//  ToursTableViewController.swift
//  Project
//
//  Created by xcodewarrior on 20.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import Foundation
import UIKit



class ToursTableViewController : UIViewController , UITableViewDelegate , UITableViewDataSource
{
    
    @IBOutlet weak var toursTableView: UITableView!
    
    var tourDatas : [Tur]!;
    var tourTitle : String = "";
    var programLanguage : String = "Turkish";
    
    
    struct id{
        static var cellIdentifier = "identityCell";
        static var cellSegueIdentifier = "detailIdentifier";
    }
    
    // MARK : - viewDidLoad 
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.editNavBar()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tourDatas.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(id.cellIdentifier, forIndexPath: indexPath) as! SpecialTourCell;
        
        let currentTour = self.tourDatas[indexPath.row];
        
        cell.layer.cornerRadius = 12;
        cell.layer.borderColor = UIColor.whiteColor().CGColor;
        cell.layer.borderWidth = 5;
 
        cell.turImage.image = currentTour.imageFirst;
        cell.tourNameLabel.text = currentTour.tourGeneralDetails;
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier(id.cellSegueIdentifier, sender: self);
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.tourTitle;
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == id.cellSegueIdentifier)
        {
            let aController = segue.destinationViewController as! ToursViewController;
            
            let currentIndex = toursTableView.indexPathForSelectedRow?.row
            
            let currentTour = self.tourDatas[currentIndex!];
            
            aController.imageOutlet = currentTour.imageFirst;
            aController.subImageOutlet1 = currentTour.imageFirst;
            aController.subImageOutlet2 = currentTour.imageSecond;
            aController.subImageOutlet3 = currentTour.imageThird;
            aController.calendar = currentTour.tourCalendarInformation;
            aController.desct = currentTour.tourGeneralDetails;
            aController.name = currentTour.tourName;
            aController.price = "$$$"
        
        }
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
