//
//  CustomCopyViewController.swift
//  JXMarqueeView
//
//  Created by jiaxin on 2018/8/24.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

import UIKit

class CustomCopyViewController: UIViewController {
    private let marqueeView = JXMarqueeView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        let customView = CustomCopyView(frame: CGRect(x: 0, y: 100, width: 80, height: 5*80+4*10))
        marqueeView.contentView = customView
        marqueeView.marqueeType = .bottom
        marqueeView.contentMargin = 10
        marqueeView.pointsPerFrame = 1
        self.view.addSubview(marqueeView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        marqueeView.bounds = CGRect(x:0, y:0, width: 80, height: 390)
        marqueeView.center = self.view.center
    }

}
