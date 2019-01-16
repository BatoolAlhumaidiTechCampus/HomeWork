//
//  ViewController.swift
//  Signs
//
//  Created by Batool Abdulaziz on 1/16/19.
//  Copyright © 2019 Sample. All rights reserved.
//

import UIKit


struct ScrollViewDataStruct{
    let txt : String?
    let image : UIImage?
}

class ViewController: UIViewController {
    
    var data = [ScrollViewDataStruct]()

    @IBOutlet weak var ScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        data = [ScrollViewDataStruct.init(txt: "o U-Turn Sign is a useful tool to help display official regulations and to provide mandatory information to drivers and pedestrians on public roadways, private drives, and in parking lots.", image: #imageLiteral(resourceName: "NoUTurn")),ScrollViewDataStruct.init(txt: "A Pedestrian Crossing Sign is MUTCD compliant for the safety standards of drivers and pedestrians on roadways and parking areas. A Pedestrian Crossing Sign is a helpful tool to help inforce traffic regulation and display mandatory information to drivers and pedestrians.",image: #imageLiteral(resourceName: "Pedst")),ScrollViewDataStruct.init(txt: "A Two Way Street Sign has informational messages or images for traffic and pedestrian safety concerns. A Two Way Street Sign is a helpful resource to help protect the health and safety on roadways, and is not a substitute for required protective measures for reducing or eliminating hazards.", image: #imageLiteral(resourceName: "Arrows")),ScrollViewDataStruct.init(txt: "A Flagger Ahead Sign is MUTCD compliant for the safety standards of drivers and pedestrians on roadways and parking areas. A Flagger Ahead Sign is a helpful tool to help inforce traffic regulation and display mandatory information to drivers and pedestrians.", image: #imageLiteral(resourceName: "Flagger"))]
        
        ScrollView.contentSize.width = self.ScrollView.frame.width * CGFloat(data.count)
        
        var i = 0
        
        for dat in data{
            let view = CustomView(frame: CGRect(x: 10+(self.ScrollView.frame.width * CGFloat(i)), y: 80, width: self.ScrollView.frame.width-20, height: self.ScrollView.frame.height-90))
                view.imageView.image = dat.image
                self.ScrollView.addSubview(view)
            let Label = UILabel(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 600), size: CGSize.init(width: self.ScrollView.frame.width-20, height:self.ScrollView.frame.height-90)))
                Label.text = dat.txt
                Label.font = UIFont.italicSystemFont(ofSize: 9)
                Label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                Label.numberOfLines = 8
                Label.sizeToFit()
                Label.center.x = view.center.x
                self.ScrollView.addSubview(Label)
            i=i+1
        }
    }
}

class CustomView: UIView{
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true


    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

