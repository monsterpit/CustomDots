//
//  CustomPageControl.swift
//  CustomDots
//
//  Created by MyGlamm on 9/12/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

class CustomPageControl: UIPageControl {
    let locationArrow: UIImage = UIImage(named: "SelectedPage")!
    let pageCircle: UIImage = UIImage(named: "UnselectedPage")!
    
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
                    imageView = UIImageView(image: locationArrow)
                   
                } else {
                    imageView = UIImageView(image: pageCircle)
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
