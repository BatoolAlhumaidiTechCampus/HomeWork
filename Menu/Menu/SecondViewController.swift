//
//  ViewController.swift
//  Menu
//
//  Created by Batool Abdulaziz on 1/12/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var imagesArray = [UIImage]()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = true
        scroll.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        preferredStatusBarStyle
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setScrollView(){
        self.view.addSubview(scrollView)
        imagesArray = [UIImage(named:"des1"),UIImage(named:"des2"),UIImage(named:"des3"),UIImage(named:"des4")] as! [UIImage]
        
        setUpImages(imagesArray)
    }
    
    func setUpImages(_ images:[UIImage]){
        for i in 0..<images.count {
            // container of each image
            let imageView = UIImageView()
            imageView.image = images[i]
            
            // shifting to next image
            //casting width to CGFloat
            let xPos = UIScreen.main.bounds.width * CGFloat(i)
            // width and height of the screen
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit
            // shifting to next image
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i+1)
            scrollView.addSubview(imageView)
            
        }
        
    }
    
    
}

