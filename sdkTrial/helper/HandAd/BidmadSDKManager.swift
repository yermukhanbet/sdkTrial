








import BidmadSDK

class BidmadSDKManager: NSObject {
    
    static let sharedinstance = BidmadSDKManager()
    
    var banner:BIDMADBanner?
    var interstitial:BIDMADInterstitial?
    var rewardVideo:BIDMADRewardVideo?
    var parentVC:UIViewController?
    var isInterstitialLoad = false;
 
    func showBanner(addview:UIView, vc:UIViewController) {
        
        parentVC = vc
        
        BIDMADSetting.sharedInstance()?.bannerZoneID = "02fb7164-f9ee-4fc0-924c-93e2d217b62f"
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
        
        BIDMADSetting.sharedInstance()?.interstitialZoneID = "5348a1e0-839a-4b7d-942a-1f96404cc87d"
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
        print("bidmadInterstitialLoad ---- \(String(describing: parentVC))")
        isInterstitialLoad = true;
    }
    
    func bidmadInterstitialShow(_ core: BIDMADInterstitial!) {
        print("bidmadInterstitialShow ---- \(String(describing: parentVC))")
        
        // 미리 show 중에 다음 광고 로드 해주는 기능 입니다.
        // 이렇게 호출해 주시면, 현재 광고를 보는 중에, 다음 광고를 미리 장전하여 다음 광고 show에 시간을 지체하지 않게됩니다.
        BidmadSDKManager.sharedinstance.loadInterstitial();
    }
    
    func bidmadInterstitialClose(_ core: BIDMADInterstitial!) {
        print("bidmadInterstitialClose ---- \(String(describing: parentVC))")
    }
    
    func bidmadInterstitialAllFail(_ core: BIDMADInterstitial!) {
        print("bidmadInterstitialAllFail ---- \(String(describing: parentVC))")
    }

}



