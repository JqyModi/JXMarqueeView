//
//  CustomCopyView.swift
//  JXMarqueeView
//
//  Created by jiaxin on 2018/8/24.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

import UIKit

class CustomCopyView: UIView {
    
    private var collectionView: UICollectionView!
    
    var colors: [UIColor] = [.red, .magenta, .brown, .yellow, .cyan]
    
    var circleView: UIView?
    var shadowView: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //方案1、实现该方法，拷贝的时候，调用NSKeyedUnarchiver.unarchiveObject(with: archivedData)方法，会调用该方法
        initializeViews()
    }

    func initializeViews() {
//        circleView = UIView()
//        circleView?.backgroundColor = .yellow
//        circleView?.layer.cornerRadius = 15;
//        circleView?.layer.masksToBounds = true
//        addSubview(circleView!)
//
//        shadowView = UIView()
//        shadowView?.backgroundColor = .green
//        shadowView?.layer.shadowOpacity = 0.6
//        shadowView?.layer.shadowColor = UIColor.black.cgColor
//        shadowView?.layer.shadowOffset = CGSize(width: 3, height: 3)
//        shadowView?.layer.shadowRadius = 3
//        addSubview(shadowView!)

        self.backgroundColor = .red
        
        self.setCollectionView()
    }
    
    private func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 80, height: 5*80+4*10), collectionViewLayout: layout)
//            self.collectionView.contentSize = CGSize(width: 80, height: 400)
//        collectionView.frame = CGRect(x: 0, y: 0, width: 80, height: 250)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ID")
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.isScrollEnabled = false
        self.addSubview(self.collectionView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

//        self.layer.cornerRadius = self.bounds.height/2
//        circleView?.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
//        shadowView?.frame = CGRect(x: self.bounds.size.width - 30 - 10, y: 10, width: 30, height: 30)
    }

    //方案2、如果没有实现required init?(coder aDecoder: NSCoder)方法
    //且要对拷贝视图进行特殊操作，就重写该方法进行自定义返回，不能返回自己，要重新生成一份实例
//    override func copyMarqueeView() -> UIView {
//        return CustomCopyView(frame: self.frame)
//    }
}

extension CustomCopyView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ID", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
}
