//
//  jsonContents.swift
//  Project
//
//  Created by xcodewarrior on 19.08.2016.
//  Copyright © 2016 EmrahKorkmaz. All rights reserved.
//

import Foundation

class jsonContents
{
    func kemaliyeTour() -> String
    {
        let kemaliyeJson = "https://gist.githubusercontent.com/0x121044053/d8d63d8a76254a161e9b500cc1a80cdd/raw/29a9891f0618201cb214285d44954450c65b590e/kemaliye.json"

        
        return kemaliyeJson;
    }
    
    func batiKaradenizTour() -> String
    {
        let batiKaradeniz = "https://gist.githubusercontent.com/0x121044053/43613b16439312f34e0d53cecd58e8f7/raw/4a2c335878948b87378fe2b18cd6673d7454a59c/batiKaradeniz.json";
        return batiKaradeniz;
    }
    
    func doguKaradenizTour() -> String
    {
        let doguKaradeniz = "https://gist.githubusercontent.com/0x121044053/ff5b299729e22ba39d82bf5020d7337d/raw/4dee006998eef5b5bb0ebc7c1643d8ea4309d681/doguKaradeniz.json";
        return doguKaradeniz;
    }
    
    func akdenizEgeTour() -> String
    {
        let akdenizEge = "https://gist.githubusercontent.com/0x121044053/dcc3a98e6e017c39405cfc285635721b/raw/04eb576b4ac91bce20e2e99b11a665bd46604fbf/akdenizEge.json";
        return akdenizEge;
    }
    
    func egeMarmaraTour() -> String
    {
        let egeMarmara = "https://gist.githubusercontent.com/0x121044053/b39dea7b463a465fa13b7303ccb71480/raw/59bdd4ba8bb62c230ae7b3e729f115d30d8fc81d/egeMarmara.json";
        return egeMarmara;
    }
    
    func urfaAntepTour() -> String
    {
        let urfaAntep = "https://gist.githubusercontent.com/0x121044053/152cb0d746fef0649faba82ef61dbdd9/raw/d945aa082f52a5a1e05f225606ca59849d57dbfb/urfaAntep.json";
        return urfaAntep;
    }
    
    func elazigPalu() -> String
    {
        let palu = "https://gist.githubusercontent.com/0x121044053/5e1e5ecd136c96acf16aae7a40d5b044/raw/061223a48ea777bd88666460f3b84ecfd8d4cc55/palu.json";
        return palu;
    }
    
    func batumTour() -> String
    {
        let batum = "https://gist.githubusercontent.com/0x121044053/2cc9610de1d9618286ce2d9d767b2674/raw/de5b9d058105f645acf8e376ad69962a68324bc0/batum.json";
        return batum;
    }
    func getAllTours() -> [String]
    {
        var tourArray : [String] = [String]();
        tourArray.append(kemaliyeTour());
        tourArray.append(batiKaradenizTour());
        tourArray.append(doguKaradenizTour());
        tourArray.append(akdenizEgeTour());
        tourArray.append(egeMarmaraTour());
        tourArray.append(urfaAntepTour());
        tourArray.append(elazigPalu());
        tourArray.append(batumTour());
        return tourArray;
    }
    
    
}