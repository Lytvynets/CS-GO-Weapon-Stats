//
//  RewardedAdHelper.swift
//  CS-GO-Weapon-Stats
//
//  Created by Vlad Lytvynets on 25.11.2022.
//

import GoogleMobileAds

class RewardedAdHelper : NSObject, GADFullScreenContentDelegate {
    private var rewardedAd : GADRewardedAd?
    
    func loadRewardedAd() {
        let request = GADRequest()
        GADRewardedAd.load(withAdUnitID: "ca-app-pub-3940256099942544/1712485313", request: request) { [self] ad, error in
            if let error = error {
                print("Failed to load reward ad with error: \(error.localizedDescription)")
                return
            }
            rewardedAd = ad
            rewardedAd?.fullScreenContentDelegate = self
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        loadRewardedAd()
    }
    
    func showRewardedAd(viewController: UIViewController) {
        if rewardedAd != nil {
            rewardedAd!.present(fromRootViewController: viewController, userDidEarnRewardHandler: {
                let reward = self.rewardedAd!.adReward
                print("\(reward.amount) \(reward.type)")
            })
        } else {
            print("RewardedAd wasn't ready")
        }
    }
}
