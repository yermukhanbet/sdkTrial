import BidmadSDK

class BidmadSDKManager: NSObject {
    
    static let sharedinstance = BidmadSDKManager()
    var banner:BIDMADBanner?
    var interstitial:BIDMADInterstitial?
    var rewardVideo:BIDMADRewardVideo?
    var parentVC:UIViewController?
    var isInterstitialLoad = false
    var isRewardVideoLoad = false
    
    let BANNER_ZONE_ID = "4a1b76f2-5e46-4ba1-8af4-1b9bfb39fc9b"
    let INTERSTITIAL_ZONE_ID = "0f814644-8179-43d4-9d79-49b9b40c2f10"
    let REWARD_ZONE_ID  = "dba2518a-c99a-4e53-af5f-ac89886b265e"
    
 
    func showBanner(addview:UIView, vc:UIViewController) {
        
        parentVC = vc
        BIDMADSetting.sharedInstance()?.bannerZoneID = BANNER_ZONE_ID
        BIDMADSetting.sharedInstance()?.isDebug = true
        banner = BIDMADBanner.init(parentViewController: vc, rootView: addview, bannerSize: banner_320_50)
        banner?.setTestDevice("b763d82d5e9bed4d0d235b490e6b81e6")
        banner?.delegate = self
        banner?.requestView()
        
    }
    
    func removeBanner(){
        banner?.removeAds();
    }
    
    func loadInterstitial(){
        
        BIDMADSetting.sharedInstance()?.interstitialZoneID = INTERSTITIAL_ZONE_ID
        BIDMADSetting.sharedInstance()?.isDebug = true
        interstitial = BIDMADInterstitial.init()
        interstitial?.setTestDevice("f1273e0a7e05ab60a622xdedb36e90a6d")
        interstitial?.delegate = self
        interstitial?.loadView()
        
    }
    
    func showInterstitial(vc:UIViewController) {
        print("[ BidmadSDKManager ] showInterstitial ");
        isInterstitialLoad = false;
        interstitial?.showView(vc)
        
    }
    
    func loadRewardVideo(){
        
        BIDMADSetting.sharedInstance()?.rewardZoneID = REWARD_ZONE_ID
        BIDMADSetting.sharedInstance()?.isDebug = true
        rewardVideo = BIDMADRewardVideo.init()
        rewardVideo?.setTestDevice("f1273e0a7e05ab60a622xdedb36e90a6d")
        rewardVideo?.delegate = self
        rewardVideo?.load()
    }
    
    func showRewardVideo(){
        isRewardVideoLoad = false
        rewardVideo?.show()
    }
    
}

extension BidmadSDKManager: BIDMADBannerDelegate {
    func bidmadBannerLoad(_ core: BIDMADBanner!) {
        print("bidmadBannerLoad ---- \(String(describing: parentVC))")
    }
    
    func bidmadBannerClosed(_ core: BIDMADBanner!) {
        print("bidmadBannerClosed ---- \(String(describing: parentVC))")
    }
    
    func bidmadBannerAllFail(_ core: BIDMADBanner!) {
        print("bidmadBannerAllFail ---- \(String(describing: parentVC))")
    }
    
    func bidmadBannerShow(_ core: BIDMADBanner!) {
        print("bidmadBannerShow ---- \(String(describing: parentVC))")
    }
    
}

extension BidmadSDKManager: BIDMADInterstitialDelegate {
    func bidmadInterstitialLoad(_ core: BIDMADInterstitial!) {
        print("BidmadSDKManager Interstitial is Loaded Successfully")
        isInterstitialLoad = true;
    }
    
    func bidmadInterstitialShow(_ core: BIDMADInterstitial!) {
        print("BidmadSDKManager Video starts Interstitial and Load the next Interstitial in Advance")
        BidmadSDKManager.sharedinstance.loadInterstitial()
    }
    
    func bidmadInterstitialClose(_ core: BIDMADInterstitial!) {
        print("BidmadSDKManager InterstitialAds is Closed")
    }
    
    func bidmadInterstitialAllFail(_ core: BIDMADInterstitial!) {
        print("BidmadSDKManager bidmadInterstitialAllFail  No Ads Available")
    }

}


extension BidmadSDKManager: BIDMADRewardVideoDelegate {
    
    func bidmadRewardVideoLoad(_ core: BIDMADRewardVideo!) {
        isRewardVideoLoad = true
        print("BidmadSDKManager RewardVideo is Loaded Successfully")
    }
    func bidmadRewardSkipped(_ core: BIDMADRewardVideo!) {
        print("BidmadSDKManager RewardVideo was skipped !!!")
    }
    func bidmadRewardVideoSucceed(_ core: BIDMADRewardVideo!) {
        print("BidmadSDKManager Video Completely played, and Rewarded Successfully")
    }
    func bidmadRewardVideoClose(_ core: BIDMADRewardVideo!) {
        print("BidmadSDKManager Video is Closed")
    }
    func bidmadRewardVideoAllFail(_ core: BIDMADRewardVideo!) {
        print("BidmadSDKManager No Ads is available")
    }
    func bidmadRewardVideoShow(_ core: BIDMADRewardVideo!) {
        print("BidmadSDKManager Video starts playing and Load the next video in Advance")
        BidmadSDKManager.sharedinstance.loadRewardVideo()
    }
}
