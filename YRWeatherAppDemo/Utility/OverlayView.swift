//
//  OverlayView.swift
//  YRWeatherAppDemo
//
//  Created by Pradeep's Macbook on 07/10/21.
//
import UIKit

public class OverlayView {
    
    var overlayView: UIView!
    var activityIndicatorView: UIActivityIndicatorView!
    
    class var sharedInstance: OverlayView {
        struct Static {
            static let shared = OverlayView()
        }
        return Static.shared
    }
    
    private init() {
        overlayView = UIView()
        overlayView.backgroundColor = .black
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.frame = .init(x: 0, y: 0, width: 80, height: 80)
        overlayView.layer.zPosition = .infinity
        
        activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.frame  = .init(x: 0, y: 0, width: 40, height: 40)
        activityIndicatorView.color = .white
        activityIndicatorView.center = .init(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        overlayView.addSubview(activityIndicatorView)
    }
    
    public func showOverlay(_ view: UIView) {
        overlayView.center = view.center
        view.addSubview(overlayView)
        activityIndicatorView.startAnimating()
    }
    
    public func hideOverlay() {
        activityIndicatorView.stopAnimating()
        overlayView.removeFromSuperview()
    }
    
}
