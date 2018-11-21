//
//  ViewController.swift
//  GoogleAddsImplementation
//
//  Created by Shubham on 21/11/18.
//  Copyright © 2018 Franciscan Ecare. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController  {

   
    @IBOutlet weak var adveriseView: GADBannerView!
    
//    lazy var adBannerView: GADBannerView = {
////        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
//                let adBannerView = GADBannerView(adSize: kGADAdSizeBanner)
//
//        adBannerView.adUnitID = "ca-app-pub-4535091644785601/3684884013"
//        adBannerView.delegate = self
//        adBannerView.rootViewController = self
//
//        return adBannerView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adveriseView.load(GADRequest())
        
        //test ads
      adveriseView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
       
        //production ads
       
        adveriseView.delegate = self
        adveriseView.rootViewController = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}


extension ViewController : GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("banner Load Successfully")
        adveriseView.frame = bannerView.frame
        adveriseView.addSubview(bannerView)
        self.view.layoutIfNeeded()
        
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("fail to load Ads")
        print(error.localizedDescription)
    }
}

