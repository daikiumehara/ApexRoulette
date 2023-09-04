//
//  BannerView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/06/17.
//  Copyright © 2023 Daiki Umehara. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct MyBannerView: UIViewControllerRepresentable {
    @State private var viewWidth: CGFloat = .zero
    private let bannerView = GADBannerView()
//    private let adUnitID = "ca-app-pub-3940256099942544/2934735716" // 開発時使用
    private let adUnitID = "ca-app-pub-9549347526821713/9069092922"

    func makeUIViewController(context: Context) -> some UIViewController {
        let bannerViewController = BannerViewController()
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = bannerViewController
        bannerView.delegate = context.coordinator
        bannerViewController.view.addSubview(bannerView)
        bannerViewController.delegate = context.coordinator

        return bannerViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        guard viewWidth != .zero else { return }

        // Request a banner ad with the updated viewWidth.
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        bannerView.load(GADRequest())
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, BannerViewControllerWidthDelegate, GADBannerViewDelegate {
        let parent: MyBannerView

        init(_ parent: MyBannerView) {
            self.parent = parent
        }

        // MARK: - BannerViewControllerWidthDelegate methods

        func bannerViewController(_ bannerViewController: BannerViewController, didUpdate width: CGFloat) {
            // Pass the viewWidth from Coordinator to BannerView.
            parent.viewWidth = width
        }

        func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
            print("\(#function) called")
        }

        func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
            print("\(#function) called")
        }

        func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
            print("\(#function) called")
        }

        func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
            print("\(#function) called")
        }

        func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
            print("\(#function) called")
        }

        func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
            print("\(#function) called")
        }
    }
}

struct BannerView: View {
    var body: some View {
        MyBannerView()
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
