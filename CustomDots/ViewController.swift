//
//  ViewController.swift
//  CustomDots
//
//  Created by MyGlamm on 9/12/19.
//  Copyright © 2019 MyGlamm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: CustomPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 960, height: 568)
        scrollView.delegate = self
        
        
        pageControl.numberOfPages = (960/320)
    }


}


extension ViewController : UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        pageControl.currentPage = page
    }
}
