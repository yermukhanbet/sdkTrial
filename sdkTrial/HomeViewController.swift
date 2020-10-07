//
//  ViewController.swift
//  sdkTrial
//
//  Created by HANTEOGLOBAL on 10/7/20.
//

import UIKit
import BidmadSDK

class HomeViewController: UIViewController {
    lazy var view_ad: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var banner: BIDMADBanner?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAdviewConstraint()
        BidmadSDKManager.sharedinstance.showInterstitial(vc: self)
        //setAd(to: view_ad)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         BidmadSDKManager.sharedinstance.removeBanner();
    }
    private func setNavControll(){
    }
    private func setAdviewConstraint(){
        self.view.addSubview(view_ad)
        view_ad.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        view_ad.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view_ad.widthAnchor.constraint(equalToConstant: 320).isActive = true
        view_ad.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func setAd(to view: UIView){
        BidmadSDKManager.sharedinstance.showBanner(addview: view, vc: self)
        if(!BidmadSDKManager.sharedinstance.isInterstitialLoad){
            BidmadSDKManager.sharedinstance.loadInterstitial()
            print("yes")
        }else{
            print("no")
        }
    }


}

