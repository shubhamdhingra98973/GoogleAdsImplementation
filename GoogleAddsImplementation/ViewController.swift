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
    
     var interstitial: GADInterstitial?
    
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
      adveriseView.adUnitID = "ca-app-pub-6283389635676693/2380676672"
       
        //production ads
       
        adveriseView.delegate = self
        adveriseView.rootViewController = self
        
//         interstitial = createAndLoadInterstitial()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func createAndLoadInterstitial() -> GADInterstitial? {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-6283389635676693/6156270153")
        
        guard let interstitial = interstitial else {
            return nil
        }
        
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID ]
        interstitial.load(request)
        interstitial.delegate = self
        
        return interstitial
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


extension ViewController : GADInterstitialDelegate {
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("Interstitial loaded successfully")
        ad.present(fromRootViewController: self)
    
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
          print("Fail to receive interstitial")
    }
}

