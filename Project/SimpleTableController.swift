//
//  SimpleTableController.swift
//  Project
//
//  Created by xcodewarrior on 9.09.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import UIKit

var generalLanguage : String = "";

class SimpleTableController : UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var datas : [String] = ["Hartur","Ayarlar","Hartur Information , 2016"];
    var datasImages : [String] = ["logo","settingsIcon","null"];
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SlideCell;
        
        
        
        cell.cellView.layer.masksToBounds = true;
        cell.cellView.backgroundColor = UIColor.whiteColor()
        
        
        let imageName = datasImages[indexPath.row];
        
        if (imageName !=  "null" )
        {
            cell.cellTextLabel.text = datas[indexPath.row];
            cell.cellTextLabel.textColor = UIColor.darkGrayColor();
            cell.cellImageView.layer.masksToBounds = true;
            cell.cellImageView.layer.cornerRadius = 22 ;
            cell.cellImageView.image = UIImage(named: imageName);
            cell.cellImageView.contentMode = .ScaleAspectFit
        }else{
            cell.cellTextLabel.text = "Hartur Inc , 2016";
            cell.cellTextLabel.font = UIFont.boldSystemFontOfSize(12);
        }
        
        
        return cell;
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false);
        
        let string = datas[indexPath.row];
        
        
        
        
        if(string == "Hartur"){
            self.performSegueWithIdentifier("ididid", sender: self);
        }else if(string == "Ayarlar"){
            alertsController()
        }else{
            harturController()
        }
        
         
    }
    
    func harturController(){
        let alert = UIAlertController(title: "Hartur General Company ®", message: "2016", preferredStyle: .Alert);
        let okOpt = UIAlertAction(title: "Great", style: .Default, handler: nil);
        alert.addAction(okOpt);
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func alertsController(){
        let alert = UIAlertController(title: "Uygulamanın Dilini Değiştir", message: "Uygulamayı Hangi Dilde Kullanıcaksınız ?", preferredStyle: .Alert);
        let engOpt = UIAlertAction(title: "English", style: .Default, handler: langHandler);
        let turkishOpt = UIAlertAction(title: "Turkish", style: .Default, handler: langHandler);
        alert.addAction(engOpt);
        alert.addAction(turkishOpt);
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func langHandler(sender : UIAlertAction){
        if(sender.title == "English"){
            generalLanguage = "English";
        }else{
            generalLanguage = "Turkish";
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ididid"){
            let aController = segue.destinationViewController as! InfoViewController
            
            aController.applicationLanguage = "Turkish";
            
        }
    }
   
    
}
