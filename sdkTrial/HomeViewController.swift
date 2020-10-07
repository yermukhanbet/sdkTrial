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
    lazy var showAd: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(showAdAction), for: .touchUpInside)
        return button
    }()
    @objc func showAdAction(){
        BidmadSDKManager.sharedinstance.showRewardVideo()
    }
    var banner: BIDMADBanner?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        BidmadSDKManager.sharedinstance.showBanner(addview: view_ad, vc: self)
        setAdviewConstraint()
        setshowAdConstraint()
        setAd(to: view_ad)
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
    private func setshowAdConstraint(){
        self.view.addSubview(showAd)
        showAd.topAnchor.constraint(equalTo: view_ad.bottomAnchor, constant: 50).isActive = true
        showAd.heightAnchor.constraint(equalToConstant: 50).isActive = true
        showAd.centerXAnchor.constraint(equalTo: view_ad.centerXAnchor).isActive = true
        showAd.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func setAdviewConstraint(){
        self.view.addSubview(view_ad)
        view_ad.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        view_ad.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view_ad.widthAnchor.constraint(equalToConstant: 320).isActive = true
        view_ad.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func setAd(to view: UIView){
        if(!BidmadSDKManager.sharedinstance.isInterstitialLoad){
            BidmadSDKManager.sharedinstance.loadRewardVideo()
            print("yes")
        }else{
            print("no")
        }
    }


}

