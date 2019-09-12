//
//  CustomPageControl.swift
//  CustomDots
//
//  Created by MyGlamm on 9/12/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

//https://stackoverflow.com/questions/38869171/custom-uipagecontrol-with-dot-images/42324241#42324241
//https://www.oipapio.com/question-1146491
//https://stackoverflow.com/questions/36965228/change-page-indicator-image-smpagecontrol-eaintroview-in-swift
//https://stackoverflow.com/questions/262156/uiimage-rounded-corners
//https://medium.com/@anitaa_1990/create-a-horizontal-paging-uiscrollview-with-uipagecontrol-swift-4-xcode-9-a3dddc845e92
//https://guides.codepath.com/ios/Using-UIPageControl

import UIKit

class CustomPageControl: UIPageControl {
    let currentPageImage: UIImage = UIImage(named: "SelectedPage")!
    let otherPageImage: UIImage = UIImage(named: "UnselectedPage")!
    
    override var numberOfPages: Int {
        didSet {
            updateDots()
        }
    }
    
    override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.pageIndicatorTintColor = UIColor.clear
        self.currentPageIndicatorTintColor = UIColor.clear
        self.clipsToBounds = false
    }
    
    func updateDots() {
        var i = 0
        for view in self.subviews {
            var imageView = self.imageView(forSubview: view)
            
            
            if imageView == nil {
                if i == 0 {
                    imageView = UIImageView(image: currentPageImage)
                   
                } else {
                    imageView = UIImageView(image: otherPageImage)
                }
                
              imageView?.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
                imageView?.layer.cornerRadius = 5
                imageView?.layer.masksToBounds = true
                
                imageView!.center = view.center
                view.addSubview(imageView!)
                
                view.clipsToBounds = false
            }
            if i == self.currentPage {
                imageView!.alpha = 1.0
            } else {
                imageView!.alpha = 0.5
            }
            i += 1
        }
    }
    
    fileprivate func imageView(forSubview view: UIView) -> UIImageView? {
        var dot: UIImageView?
        if let dotImageView = view as? UIImageView {
            dot = dotImageView
        } else {
            for foundView in view.subviews {
                if let imageView = foundView as? UIImageView {
                    dot = imageView
                    break
                }
            }
        }
       // dot?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        return dot
    }
}
