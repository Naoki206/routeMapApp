//
//  ThirdViewController.swift
//  routeMapApp
//
//  Created by 鎌塚直己 on 2020/04/29.
//  Copyright © 2020 鎌塚直己. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
   override func viewDidLoad() {
            super.viewDidLoad()
            scrollView.maximumZoomScale = 4
            scrollView.minimumZoomScale = 1
            imageView.image = UIImage(named: "佐賀路線図")
            scrollView.delegate = self
    }

        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            if scrollView.zoomScale > 1 {
                if let image = imageView.image {
                    let ratioW = imageView.frame.width / image.size.width
                    let ratioH = imageView.frame.height / image.size.height
                    
                    let ratio = ratioW < ratioH ? ratioW : ratioH
                    let newWidth = image.size.width * ratio
                    let newHeight = image.size.height * ratio
                    let conditionLeft = newWidth*scrollView.zoomScale > imageView.frame.width
                    let left = 0.5 * (conditionLeft ? newWidth - imageView.frame.width : (scrollView.frame.width - scrollView.contentSize.width))
                    let conditioTop = newHeight*scrollView.zoomScale > imageView.frame.height
                    
                    let top = 0.5 * (conditioTop ? newHeight - imageView.frame.height : (scrollView.frame.height - scrollView.contentSize.height))
                    
                    scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
                    
                }
            } else {
                scrollView.contentInset = .zero
            }
        }

}
