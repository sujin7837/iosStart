//
//  ViewController.swift
//  PageControlMission
//
//  Created by 김수진 on 2021/01/06.
//

import UIKit

let NUM_PAGE=10

class ViewController: UIViewController {

    @IBOutlet var lblNum: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages=NUM_PAGE
        pageControl.currentPage=0
        pageControl.pageIndicatorTintColor=UIColor.green
        pageControl.currentPageIndicatorTintColor=UIColor.red
        lblNum.text=String(pageControl.currentPage+1)
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        lblNum.text=String(pageControl.currentPage+1)
    }
}

