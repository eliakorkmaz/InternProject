//
//  ViewController.swift
//  Project
//
//  Created by xcodewarrior on 15.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage



class ViewController: UIViewController , UITextFieldDelegate , UIPickerViewDelegate , UIPickerViewDataSource {
    
    // MARK: - Tur Variables and Cache
    var generalPhoto : UIImage!;
    var photoCaches : NSCache = NSCache();
    var photosArray : [UIImage] = [UIImage]();
    var selectionSegue : String = "";
    
    
    
    // MARK: - DATAS
    var pickerViewTestDatas : [String] = [
    "Marmara Bölgesi",
    "Akdeniz Bölgesi",
    "Karadeniz Bölgesi",
    "Ege Bölgesi",
    "İç Anadolu Bölgesi",
    "Doğu Anadolu Bölgesi",
    "Güneydoğu Anadolu Bölgesi"];
    
    var ownPickerView = UIPickerView();
    var applicationLanguage : String = "Turkish";
    var sendURLDatas : String = "";
    
    
    // MARK: - Tour Datas
    
    var allToursDatas : [Tur] = [Tur]();
    let acceptableContentTypes : Set<String> = [
    "image/tiff",
    "image/jpeg",
    "image/jpg",
    "image/png",
    "image/gif",
    "image/ico",
    "image/x-icon",
    "image/bmp",
    "image/x-bmp",
    "image/x-xbitmap",
    "image/x-win-bitmap"
    ]
    
    
    var allJsonDatas : jsonContents = jsonContents();
    var str : String!;
    var jsonFetchTrying : Int = 0;
    
    @IBOutlet weak var openButton: UIBarButtonItem!
    
    func checkSlide()
    {
        if(revealViewController() != nil)
        {
            openButton.target = self.revealViewController();
            openButton.action = "revealToggle:"
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer());
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.Request.addAcceptableImageContentTypes(acceptableContentTypes);
        
        self.style();
        self.styleFirstTextField();
        self.buttonShape("ARA");
        self.tourDistrictViewEdit();
        self.tourDistrictLabelEdit();
        self.ownPickerView.delegate = self;
        self.ownPickerView.dataSource = self;
        self.konumTextField.inputView = self.ownPickerView;
        self.menuBarView.hidden = true;
        self.navigationBarEdit();
        self.imageViewsAndLabels();
        self.underView()
        self.tapGestureVariables();
        self.getAllDataFromURLWrapper();
        self.checkSlide()
        
    }
    
    
 
    func navigationBarEdit()
    {
        let sColor = UIColor(red: 201.0/255, green: 59.0/255, blue: 94.0/255, alpha: 1.0);
        self.navigationItem.title = "HARTUR";
        self.navigationController?.navigationBar.barTintColor = sColor;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont(name: "Avenir",size: 34)!];
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent;
    }

    
    // MARK: - IBOutlets and Variables
    
    @IBOutlet weak var bigSearchLabel: UILabel!
    @IBOutlet weak var tourNameLabel: UILabel!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var projectView: UIView!
    @IBOutlet weak var menuBarView: UIView!
    @IBOutlet weak var konumTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tourDistrictsLabel: UILabel!
    @IBOutlet weak var districtTourView: UIView!
    @IBOutlet weak var changeLanguageImage: UIImageView!
    // MARK: - Special View Outlets
    
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var viewLabel: UILabel!
    
    // MARK: - Special View Functions
    func underView()
    {
        self.viewLabel.text = "® Hartur Information - 2016";
        self.viewLabel.font = UIFont(name: "Avenir", size: 16);
        self.barView.layer.cornerRadius = 12;
        self.barView.layer.backgroundColor = UIColor.cyanColor().CGColor;
    }
    
    
    // MARK: - Image View Outlets and Its Labels
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var selfImageView3 : UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    // MARK: - Share ImageViews and its Outlets
    
    @IBOutlet weak var facebookImage: UIImageView!
    @IBOutlet weak var instagramImage: UIImageView!
    @IBOutlet weak var twitterImage: UIImageView!
    
    
    // MARK: - FUNCTİONS
    
    func imageViewsAndLabels()
    {
        self.label1.textColor = UIColor.whiteColor();
        self.label2.textColor = UIColor.whiteColor();
        self.label3.textColor = UIColor.whiteColor();
        self.label4.textColor = UIColor.whiteColor();
        self.label5.textColor = UIColor.whiteColor();

        
        self.imageView1.layer.cornerRadius = self.imageView1.frame.width/16.0
        self.imageView1.layer.masksToBounds = true;
        self.imageView1.image = UIImage(named: "kapadokyaPhotos");
        self.imageView2.layer.cornerRadius = self.imageView2.frame.width/16.0;
        self.imageView2.layer.masksToBounds = true;
        self.imageView2.image = UIImage(named: "venicePhotos");
        self.selfImageView3.layer.cornerRadius = self.selfImageView3.frame.width/16.0;
        self.selfImageView3.layer.masksToBounds = true;
        self.selfImageView3.image = UIImage(named: "egeBolgesiPhotos2");
        self.imageView4.layer.cornerRadius = self.imageView4.frame.width/16.0;
        self.imageView4.layer.masksToBounds = true;
        self.imageView4.image = UIImage(named: "batiKaradenizPhotos");
        self.imageView5.layer.cornerRadius = self.imageView5.frame.width/16.0;
        self.imageView5.layer.masksToBounds = true;
        self.imageView5.image = UIImage(named: "doguKaradenizPhotos2");
               //®
        self.label1.text = "Yurtiçi Turları";
        self.label1.font = UIFont.boldSystemFontOfSize(18);
        //self.label1.font = UIFont(name: "Avenir", size: 18);
        self.label2.text = "Yurtdışı Turları";
        self.label2.font = UIFont.boldSystemFontOfSize(18);
        //self.label2.font = UIFont(name: "Avenir", size: 18);
        self.label3.text = "Ege Turları";
        self.label3.font = UIFont.boldSystemFontOfSize(18);
        //self.label3.font = UIFont(name: "Avenir", size: 18);
        self.label4.text = "Batı Karadeniz Turları";
        self.label4.font = UIFont.boldSystemFontOfSize(18);
        //self.label4.font = UIFont(name: "Avenir", size: 18);
        self.label5.text = "Doğu Karadeniz Turları";
        self.label5.font = UIFont.boldSystemFontOfSize(18);
        //self.label5.font = UIFont(name: "Avenir", size: 18);
        
        
        
        self.imageView4.userInteractionEnabled = true;
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapTry));
        
        tapGesture.numberOfTapsRequired = 1;
        imageView4.addGestureRecognizer(tapGesture);
        
        
        
        self.imageView5.userInteractionEnabled = true;
        let tapGesture2 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappingDoguKaradeniz));
        tapGesture2.numberOfTapsRequired = 1;
        self.imageView5.addGestureRecognizer(tapGesture2);
        
        
        self.selfImageView3.userInteractionEnabled = true;
        let tapGesture3 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapEge));
        self.selfImageView3.addGestureRecognizer(tapGesture3);
        
        self.imageView1.userInteractionEnabled = true;
        let tapGesture4 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapYurtici));
        self.imageView1.addGestureRecognizer(tapGesture4);
        
        self.imageView2.userInteractionEnabled = true;
        let tapGesture5 : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapYurtdisi));
        self.imageView2.addGestureRecognizer(tapGesture5);
        
        
    }
    
    
    // MARK : - Tap Gesture Function
    
    func tapYurtdisi(sender : UITapGestureRecognizer)
    {
        self.selectionSegue = "Yurtdisi";
        self.performSegueWithIdentifier(id.showingSegue, sender: self);
    }
    
    
    func tapYurtici(sender : UITapGestureRecognizer)
    {
        self.selectionSegue = "Yurtici";
        self.performSegueWithIdentifier(id.tableSegue, sender: self);
    }
    func tappingDoguKaradeniz(sender : UITapGestureRecognizer)
    {
        print("Tap the Dogu Karadeniz ");
        self.selectionSegue = "DoguKaradeniz";
        self.performSegueWithIdentifier(id.showingSegue, sender: self);
    }
    
    func tapTry(sender : UITapGestureRecognizer)
    {
        print("Tap the Bati Karadeniz :d");
        self.selectionSegue = "BatiKaradeniz";
        self.performSegueWithIdentifier(id.showingSegue, sender: self);
    }
    
    func tapEge(sender : UITapGestureRecognizer)
    {
        self.selectionSegue = "Ege";
        self.performSegueWithIdentifier(id.tableSegue, sender: self);
    }
    
    // MARK: - Photos String Struct
    
    private struct photosName
    {
        var photo1 : String = "";
        var photo2 : String = "";
        var photo3 : String = "";
        var photo4 : String = "";
        var photo5 : String = "";
    }
    
    
    func getEnglishVersion()
    {
        self.searchButton.titleLabel?.text = "SEARCH";
        self.tourDistrictsLabel.text = "TOURS";
        self.konumTextField.placeholder = " Get a place !";
        self.buttonShape("SEARCH");
        self.tourNameLabel.text = "Tour Name";
        self.bigSearchLabel.text = "SEARCH";
        self.label1.text = "Turkey Tours";
        self.label2.text = "Abroad Tours";
        self.label3.text = "Aegean Tours";
        self.label4.text = "West of BlackSea Region";
        self.label5.text = "East of BlackSea Region";
    }
    
    func getTurkishVersion()
    {
        self.bigSearchLabel.text = "ARA";
        self.searchButton.titleLabel?.text = "ARA";
        self.tourDistrictsLabel.text = "TURLAR";
        self.konumTextField.placeholder = " Bir yer girin !";
        self.buttonShape("ARA");
        self.tourNameLabel.text = "Tur İsmi";
        self.label1.text = "Yurtiçi Turları";
        self.label2.text = "Yurtdışı Turları";
        self.label3.text = "Ege Turları";
        self.label4.text = "Batı Karadeniz Turları";
        self.label5.text = "Doğu Karadeniz Turları";
    }
    

    func tourDistrictLabelEdit()
    {
        self.tourDistrictsLabel.text = "Tur Bölgeleri";
        self.tourDistrictsLabel.textColor = UIColor.whiteColor();
        self.tourDistrictsLabel.font = UIFont.boldSystemFontOfSize(22);
    }
    
    func tourDistrictViewEdit()
    {
        self.districtTourView.layer.cornerRadius = 10;
        self.districtTourView.layer.backgroundColor = UIColor.grayColor().CGColor;
    }
    
    func style()
    {
        self.projectView.layer.cornerRadius = 12;
        self.projectView.layer.backgroundColor = UIColor.yellowColor().CGColor;
    }
    
    func buttonShape(buttonName : String)
    {
        self.searchButton.layer.backgroundColor = UIColor.blueColor().CGColor;
        self.searchButton.setTitle(buttonName, forState: UIControlState.Normal);
        self.searchButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
        self.searchButton.setTitleShadowColor(UIColor.blackColor(), forState: UIControlState.Normal);
        self.searchButton.layer.cornerRadius = 10;
        self.searchButton.layer.borderColor = UIColor.yellowColor().CGColor;
        self.searchButton.titleLabel?.font = UIFont.boldSystemFontOfSize(24);
    }
    

    // MARK: - Button Action
    
    @IBAction func searchButtonAction(sender: AnyObject) {
        /*
         "Marmara Bölgesi",
         "Akdeniz Bölgesi",
         "Karadeniz Bölgesi",
         "Ege Bölgesi",
         "İç Anadolu Bölgesi",
         "Doğu Anadolu Bölgesi",
         "Güneydoğu Anadolu Bölgesi"];
         
            */
        if self.konumTextField.text?.isEmpty == false
        {
            if(konumTextField.text == "Marmara Bölgesi" || konumTextField.text == "Akdeniz Bölgesi" || konumTextField.text == "Karadeniz Bölgesi" || konumTextField.text == "Ege Bölgesi" || konumTextField.text ==  "İç Anadolu Bölgesi" || konumTextField.text == "Doğu Anadolu Bölgesi" || konumTextField.text == "Güneydoğu Anadolu Bölgesi")
            {
                    self.performSegueWithIdentifier(id.searchSegue, sender: self);
            }
            else
            {
                print("Dogru şekilde girilmedi !!!");
            }
        }
    }
   
    // MARK: -Share Icon Activies , Functions and Stuff
    
    func tapGestureVariables()
    {
        let facebookGesture = UITapGestureRecognizer(target: self, action: #selector(facebookGestureHandler));
        let twitterGesture = UITapGestureRecognizer(target: self, action: #selector(twitterGestureHandler));
        let instagramGesture = UITapGestureRecognizer(target: self, action: #selector(instaGestureHandler));
        
        facebookGesture.numberOfTapsRequired = 1;
        twitterGesture.numberOfTapsRequired = 1;
        instagramGesture.numberOfTapsRequired = 1;
        
        self.instagramImage.addGestureRecognizer(instagramGesture);
        self.twitterImage.addGestureRecognizer(twitterGesture);
        self.facebookImage.addGestureRecognizer(facebookGesture);
        
        self.instagramImage.userInteractionEnabled = true;
        self.facebookImage.userInteractionEnabled = true;
        self.twitterImage.userInteractionEnabled = true;
    }
    // MARK: - Tour Generate Function
    
    func tourGenerateFunction(tourGeneralDistrict : [String] , tourName : [String] , tourDistrict : [String] , tourCalendar : [String] , photosURL : [[String]] , otherTourDistrict : [String] , subTourDistrict : [String])
    {
        let totalTourNumber : Int = tourGeneralDistrict.count;
        var iterator : Int = 0;
        
        for(iterator = 0 ; iterator < totalTourNumber ; iterator += 1)
        {
            let turName = tourName[iterator];
            let turCalendar = tourCalendar[iterator];
            //var turPhotos : [String] = photosURL[iterator];
            //print("TUR PHOTOS -> \(turPhotos)  \n");
            var subTurDistrict : altTurBolgesi!;
            var turDistrict : turBolgesi!;
            var turGeneralDistrict : genelTurBolgesi!;
            var otherTurDistrict : turBolgesi!;
            if(subTourDistrict[iterator] == "Batı Karadeniz")
            {
                subTurDistrict = altTurBolgesi.BatiKaradeniz;
            }else if(subTourDistrict[iterator] == "Dogu Karadeniz")
            {
                subTurDistrict = altTurBolgesi.DoguKaradeniz;
            }else
            {
                subTurDistrict = altTurBolgesi.Undefined;
            }
            
            
            if(tourDistrict[iterator] == "Karadeniz")
            {
                turDistrict = turBolgesi.KaradenizBolgesi;
            }else if(tourDistrict[iterator] == "DoguAnadolu")
            {
                turDistrict = turBolgesi.DoguAnadoluBolgesi;
            }else if(tourDistrict[iterator] == "Akdeniz")
            {
                turDistrict = turBolgesi.AkdenizBolgesi;
            }else if(tourDistrict[iterator] == "Guneydogu Anadolu")
            {
                turDistrict = turBolgesi.GuneyDoguAnadoluBolgesi;
            }else if(tourDistrict[iterator] == "Ege")
            {
                turDistrict = turBolgesi.EgeBolgesi;
            }else if(tourDistrict[iterator] == "Marmara")
            {
                turDistrict = turBolgesi.MarmaraBolgesi;
            }else if(tourDistrict[iterator] == "Ic Anadolu")
            {
                turDistrict = turBolgesi.IcAnadoluBolgesi;
            }else
            {
                turDistrict = turBolgesi.Undefined;
            }
            
            if(tourGeneralDistrict[iterator] == "Yurtici")
            {
                turGeneralDistrict = genelTurBolgesi.YurticiTur;
            }else if(tourGeneralDistrict[iterator] == "Yurtdisi")
            {
                turGeneralDistrict = genelTurBolgesi.YurtdisiTur;
            }else
            {
                turGeneralDistrict = genelTurBolgesi.Undefined;
            }
            
            if(otherTourDistrict[iterator] == "Karadeniz")
            {
                otherTurDistrict = turBolgesi.KaradenizBolgesi;
            }else if(otherTourDistrict[iterator] == "DoguAnadolu")
            {
                otherTurDistrict = turBolgesi.DoguAnadoluBolgesi;
            }else if(otherTourDistrict[iterator] == "Akdeniz")
            {
                otherTurDistrict = turBolgesi.AkdenizBolgesi;
            }else if(otherTourDistrict[iterator] == "Guneydogu Anadolu")
            {
                otherTurDistrict = turBolgesi.GuneyDoguAnadoluBolgesi;
            }else if(otherTourDistrict[iterator] == "Ege")
            {
                otherTurDistrict = turBolgesi.EgeBolgesi;
            }else if(otherTourDistrict[iterator] == "Marmara")
            {
                otherTurDistrict = turBolgesi.MarmaraBolgesi;
            }else if(otherTourDistrict[iterator] == "Ic Anadolu")
            {
                otherTurDistrict = turBolgesi.IcAnadoluBolgesi;
            }else
            {
                otherTurDistrict = turBolgesi.Undefined;
            }
            
            
            let temporaryTour : Tur = Tur(tourName: turName, tourDistrict: turDistrict, generalTourDistrict: turGeneralDistrict, otherTourDistrict: otherTurDistrict, subTourDistrict: subTurDistrict, photo1: photosURL[iterator][0], photo2: photosURL[iterator][1], photo3: photosURL[iterator][2], tourCalendar: turCalendar, tourDetails: turName);
            
            dispatch_async(dispatch_get_main_queue(), {
                if let cachedImage1 = self.photoCaches.objectForKey(temporaryTour.photo1) as? UIImage
                {
                    temporaryTour.imageFirst = cachedImage1;
                }else
                {
                    temporaryTour.loadImageUsingUrlStringForFirst();
                    self.photoCaches.setObject(temporaryTour.imageFirst, forKey: temporaryTour.photo1);
                }
                
                if let cachedImage2 = self.photoCaches.objectForKey(temporaryTour.photo2) as? UIImage
                {
                    temporaryTour.imageSecond = cachedImage2;
                }else
                {
                    temporaryTour.loadImageUsingUrlStringForSecond();
                    self.photoCaches.setObject(temporaryTour.imageSecond, forKey: temporaryTour.photo2);
                }
                
                if let cachedImage3 = self.photoCaches.objectForKey(temporaryTour.photo3) as? UIImage
                {
                    temporaryTour.imageThird = cachedImage3;
                }else
                {
                    temporaryTour.loadImageUsingUrlStringForThird();
                    self.photoCaches.setObject(temporaryTour.imageThird, forKey: temporaryTour.photo3);
                }
                self.allToursDatas.append(temporaryTour);
            })
            
            
        }
        
    }
    func twitterGestureHandler(sender : UITapGestureRecognizer)
    {
        print("Twitter a tıklandı");
        self.sendURLDatas = "https://www.facebook.com/HARTUR.23/";
        performSegueWithIdentifier("identifierURL", sender: self);
        
    }
    func instaGestureHandler(sender : UITapGestureRecognizer)
    {
        print("Instagrama tıklandı");
        self.sendURLDatas = "http://www.hartur.com/hartur/index.jsp";
        performSegueWithIdentifier("identifierURL", sender: self);
    }
    func facebookGestureHandler(sender : UITapGestureRecognizer)
    {
        print("Facebook a tıklandı");
        self.sendURLDatas = "https://www.facebook.com/HARTUR.23/";
        performSegueWithIdentifier("identifierURL", sender: self);
    }
    
    
    // MARK: - Textfield Delegate Functions
   
    func styleFirstTextField()
    {
        let ttx = self.konumTextField;
        let layer = self.konumTextField.layer;
        layer.backgroundColor = UIColor.whiteColor().CGColor;
        
        let placeString = NSAttributedString(string: "Bir Konum Girin !", attributes: [NSForegroundColorAttributeName: UIColor.darkGrayColor()]);
        ttx.attributedPlaceholder = placeString;
        layer.cornerRadius = 6;
    }
  
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        //konumTextField.borderStyle = .RoundedRect;
    }
    
    // Mark: - Identifiers and SegueIdentifiers
    
    private struct id
    {
        static var cell : String = "cellIdentifier";
        static var informationSegue : String = "informationIdentifier";
        static var showingSegue : String = "showingIdentifier";
        static var tableSegue : String = "moreThanOne";
        static var searchSegue : String = "searchIdentifier";
        static var webSegue : String = "identifierURL";
    }
    
    
    // MARK: - Picker View Data Source and Delegates
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.konumTextField.text = pickerViewTestDatas[row];
        self.view.endEditing(true);
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerViewTestDatas[row];
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewTestDatas.count;
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    // MARK: -Settings Button
   
    @IBAction func languageSettings(sender: AnyObject) {
        let alertController : UIAlertController = UIAlertController(title: "Uygulamanın Dilini Değiştir", message: "Uygulamayı Hangi Dilde Kullanıcaksınız ? ", preferredStyle: UIAlertControllerStyle.Alert);
        
        let enOption = UIAlertAction(title: "English", style: UIAlertActionStyle.Default, handler: optionHandler);
        let trOption = UIAlertAction(title: "Turkish", style: UIAlertActionStyle.Default, handler: optionHandler);
        
        
        alertController.addAction(enOption);
        alertController.addAction(trOption);
        self.presentViewController(alertController, animated: true, completion: nil);
    }
    
    func optionHandler(sender : UIAlertAction)
    {
        if(sender.title == "English")
        {
            self.getEnglishVersion();
            self.applicationLanguage = "English";
        }
        else{
            self.getTurkishVersion();
            self.applicationLanguage = "Turkish";
        }
    }
    
    // MARK: -Info Button and its Action
    @IBAction func getInfoAction(sender: AnyObject) {
        self.performSegueWithIdentifier(id.informationSegue, sender: self);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == id.informationSegue)
        {
            let aController = segue.destinationViewController as! InfoViewController;
            aController.applicationLanguage = self.applicationLanguage;
        }
        if(segue.identifier == "identifierURL")
        {
            let aController = segue.destinationViewController as! WebViewController;
            aController.takenURL = self.sendURLDatas;
            
        }
        if(segue.identifier == id.searchSegue)
        {
            let aController = segue.destinationViewController as! SearchViewController;
            
            if(self.konumTextField.text == "Marmara Bölgesi")
            {
                var sendTours : [Tur] = [Tur]();
                for item in self.allToursDatas
                {
                    if(item.tourDistrict == turBolgesi.MarmaraBolgesi)
                    {
                        sendTours.append(item);
                    }
                    if(item.otherTourDistrict == turBolgesi.MarmaraBolgesi)
                    {
                        sendTours.append(item);
                    }
                }
                aController.applicationLanguage = self.applicationLanguage;
                aController.allTours = sendTours;
            }
            if(self.konumTextField.text == "Akdeniz Bölgesi")
            {
                var sendTours : [Tur] = [Tur]();
                for item in self.allToursDatas
                {
                    if(item.tourDistrict == turBolgesi.AkdenizBolgesi)
                    {
                        sendTours.append(item);
                    }
                    if(item.otherTourDistrict == turBolgesi.AkdenizBolgesi)
                    {
                        sendTours.append(item);
                    }
                }
                aController.applicationLanguage = self.applicationLanguage;
                aController.allTours = sendTours;
            }
            if(self.konumTextField.text == "Karadeniz Bölgesi")
            {
                var sendTours : [Tur] = [Tur]();
                
                for item in self.allToursDatas
                {
                    if(item.tourDistrict == turBolgesi.KaradenizBolgesi)
                    {
                        sendTours.append(item);
                    }
                    if(item.otherTourDistrict == turBolgesi.KaradenizBolgesi)
                    {
                        sendTours.append(item);
                    }
                }
                aController.applicationLanguage = self.applicationLanguage;
                aController.allTours = sendTours;
            }
            if(self.konumTextField.text == "Ege Bölgesi")
            {
                var sendTours : [Tur] = [Tur]();
                for item in self.allToursDatas
                {
                    if (item.tourDistrict == turBolgesi.EgeBolgesi)
                    {
                        sendTours.append(item);
                    }
                    if(item.otherTourDistrict == turBolgesi.EgeBolgesi)
                    {
                        sendTours.append(item);
                    }
                }
                aController.applicationLanguage = self.applicationLanguage;
                aController.allTours = sendTours;
            }
            if(self.konumTextField.text == "İç Anadolu Bölgesi")
            {
                var sendTours : [Tur] = [Tur]();
                for item in self.allToursDatas
                {
                    if(item.tourDistrict == turBolgesi.IcAnadoluBolgesi)
                    {
                        sendTours.append(item);
                    }
                    if(item.otherTourDistrict == turBolgesi.IcAnadoluBolgesi)
                    {
                        sendTours.append(item);
                    }
                }
                aController.applicationLanguage = self.applicationLanguage;
                aController.allTours = sendTours;
            }
            if(self.konumTextField.text == "Doğu Anadolu Bölgesi")
            {
                var sendTours : [Tur] = [Tur]();
                for item in self.allToursDatas
                {
                    if(item.tourDistrict == turBolgesi.DoguAnadoluBolgesi)
                    {
                        sendTours.append(item);
                    }
                    if(item.otherTourDistrict == turBolgesi.DoguAnadoluBolgesi)
                    {
                        sendTours.append(item);
                    }
                }
                aController.applicationLanguage = self.applicationLanguage;
                aController.allTours = sendTours;
            }
            if(self.konumTextField.text == "Güneydoğu Anadolu Bölgesi")
            {
                var sendTours : [Tur] = [Tur]();
                for item in self.allToursDatas
                {
                    if ( item.tourDistrict == turBolgesi.GuneyDoguAnadoluBolgesi)
                    {
                        sendTours.append(item);
                    }
                    if(item.otherTourDistrict == turBolgesi.GuneyDoguAnadoluBolgesi)
                    {
                        sendTours.append(item);
                    }
                }
                aController.applicationLanguage = self.applicationLanguage;
                aController.allTours = sendTours;
            }
            
        }
        if(segue.identifier == id.showingSegue)
        {
            if( self.selectionSegue == "BatiKaradeniz")
            {
                let aController = segue.destinationViewController as! ToursViewController;
                
                var sendTour : Tur!;
                
                for item in allToursDatas {
                    if(item.subTourDistrict == altTurBolgesi.BatiKaradeniz)
                    {
                        print("Bulundu : \(item.tourDistrict) ");
                        sendTour = item;
                    }
                }
                
                aController.imageOutlet = sendTour.imageFirst;
                aController.subImageOutlet1 = sendTour.imageFirst;
                aController.subImageOutlet2 = sendTour.imageSecond;
                aController.subImageOutlet3 = sendTour.imageThird;
                aController.name = sendTour.tourName;
                aController.price = "1000 dolarcıkk"
                aController.calendar = sendTour.tourCalendarInformation;
                aController.desct = sendTour.tourGeneralDetails;
            }
            if( self.selectionSegue == "DoguKaradeniz")
            {
                let aController = segue.destinationViewController as! ToursViewController;
                var sendTour2 : Tur!;
                
                for item in allToursDatas
                {
                    if(item.subTourDistrict == altTurBolgesi.DoguKaradeniz)
                    {
                        print("Bulundu :\(item.tourDistrict)" );
                        sendTour2 = item;
                    }
                }
                aController.imageOutlet = sendTour2.imageFirst;
                aController.subImageOutlet1 = sendTour2.imageFirst;
                aController.subImageOutlet2 = sendTour2.imageSecond;
                aController.subImageOutlet3 = sendTour2.imageThird;
                
                aController.name = sendTour2.tourName;
                aController.price = "100tl"
                aController.calendar = sendTour2.tourCalendarInformation;
                aController.desct = sendTour2.tourGeneralDetails;
            }
       
            if( self.selectionSegue == "Yurtdisi")
            {
                let aController = segue.destinationViewController as! ToursViewController;
                var sendTour : Tur!;
                
                for item in self.allToursDatas
                {
                    if(item.generalTourDistrict == genelTurBolgesi.YurtdisiTur)
                    {
                        sendTour = item;
                    }
                }
                aController.imageOutlet = sendTour.imageFirst;
                aController.subImageOutlet1 = sendTour.imageFirst;
                aController.subImageOutlet2 = sendTour.imageSecond;
                aController.subImageOutlet3 = sendTour.imageThird;
                
                aController.name = sendTour.tourName;
                aController.price = "Emrah baba hortumcu"
                aController.calendar = sendTour.tourCalendarInformation;
                aController.desct = sendTour.tourGeneralDetails;
                
            }
            print(photosArray.count);
        }
        if(segue.identifier == "moreThanOne")
        {
            if( self.selectionSegue == "Ege")
            {
                let aController = segue.destinationViewController as! ToursTableViewController;
                var sendDatas : [Tur] = [Tur]();
                
                for item in allToursDatas
                {
                    if(item.otherTourDistrict == turBolgesi.EgeBolgesi)
                    {
                        sendDatas.append(item);
                    }
                    if(item.tourDistrict == turBolgesi.EgeBolgesi)
                    {
                        sendDatas.append(item);
                    }
                }
                
                aController.tourDatas = sendDatas;
                aController.tourTitle = "Ege Turları";
                
                
            }
            if( self.selectionSegue == "Yurtici")
            {
                let aController = segue.destinationViewController as! ToursTableViewController;
                var sendDatas : [Tur] = [Tur]();
                
                for item in allToursDatas
                {
                    if(item.generalTourDistrict == genelTurBolgesi.YurticiTur)
                    {
                        sendDatas.append(item);
                    }
                }
                
                aController.tourDatas = sendDatas;
                aController.tourTitle = "Yurtici Turları";
                
            }
        }
        
    }
    
    func printAllTours()
    {
        print(tourGeneralDistrict)
        print(otherTourDistrict)
        print(photosURL)
        print(subTourDistrict)
        print(tourCalendar)
        print(tourDistrict)
        print(tourName)
    }
    
    var tourGeneralDistrict : [String] = [String]();
    var otherTourDistrict : [String] = [String]();
    var photosURL : [[String]] = [[String]]();
    var subTourDistrict : [String] = [String]();
    var tourCalendar : [String] = [String]();
    var tourDistrict : [String] = [String]();
    var tourName : [String] = [String]();
    func getAllDataFromURLWrapper()
    {
        var i : Int = 0;
        self.getAllDataFromURL(i);
        
    }
    
    
    func getAllDataFromURL(i : Int)
    {
        var contents : jsonContents = jsonContents();
        var arr : [String] = contents.getAllTours();
            Alamofire.request(.GET,arr[i]).responseJSON
            {(response) -> Void in
               
                if let arrivedData = response.result.value
                {
                    self.tourGeneralDistrict.append(arrivedData["generalTourDistrict"] as! String);
                    self.otherTourDistrict.append(arrivedData["otherTourDistrict"] as! String);
                    self.photosURL.append(arrivedData["photoURLS"] as! [String]);
                    self.subTourDistrict.append(arrivedData["subTourDistrict"] as! String);
                    self.tourCalendar.append(arrivedData["tourCalendar"] as! String);
                    self.tourDistrict.append(arrivedData["tourDistrict"] as! String);
                    self.tourName.append(arrivedData["tourName"] as! String);
                    
                }
         if(i < contents.getAllTours().count - 1)
         {
            self.getAllDataFromURL(i + 1);
         }else
         {
            self.printAllTours();
            print(self.tourGeneralDistrict.count);
            
            self.tourGenerateFunction(self.tourGeneralDistrict, tourName: self.tourName, tourDistrict: self.tourDistrict, tourCalendar: self.tourCalendar, photosURL: self.photosURL, otherTourDistrict: self.otherTourDistrict, subTourDistrict: self.subTourDistrict);

            //print(self.allToursDatas[0].photo1);
            /*
            dispatch_async(dispatch_get_main_queue(), {
            for(var i = 0 ; i < self.allToursDatas.count ; i += 1)
            {
                    self.loadImageUsingUrlString(self.allToursDatas[i].photo1);
                    self.loadImageUsingUrlString(self.allToursDatas[i].photo2);
                    self.loadImageUsingUrlString(self.allToursDatas[i].photo3);
            }

            })
 */
        }
                //FOTOLAR BURADA INDIRILECEK
    }
    
     
    
 
    }
    func loadImageUsingUrlString(urlString : String)
    {
        let url = NSURL(string: urlString);
        var imageToCache : UIImage!;
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {(data,response,error)in
            
            if error != nil{
                print(error);
                return;
            }
            dispatch_async(dispatch_get_main_queue(),{
                imageToCache = UIImage(data: data!);
                self.generalPhoto = imageToCache;
                self.photosArray.append(imageToCache);
            })
        }).resume();
    }

}
