//
//  YouTubeVideoCell.swift
//  SYYoutube
//
//  Created by shenyi on 2017/7/16.
//  Copyright © 2017年 shenyi. All rights reserved.
//

import UIKit

class YouTubeVideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let videoThumbnailView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.backgroundColor = UIColor.green
        return imageView
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel.init()
        label.backgroundColor = UIColor.orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleView: UITextView = {
       let textView = UITextView.init()
        textView.backgroundColor = UIColor.brown
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    func setupViews() {
        addSubview(videoThumbnailView)
        addSubview(separatorView)
        addSubview(userImageView)
        addSubview(titleLabel)
        addSubview(subtitleView)
        
        addConstraintWithVisualFormat(format: "H:|-10-[v0]-10-|", views: videoThumbnailView)
        addConstraintWithVisualFormat(format: "H:|-10-[v0(44)]|", views: userImageView)
        addConstraintWithVisualFormat(format: "V:|-10-[v0]-8-[v1(44)]-16-[v2(1)]|", views: videoThumbnailView, userImageView, separatorView)
        addConstraintWithVisualFormat(format: "H:|[v0]|", views: separatorView)
        
        //titleLable
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: videoThumbnailView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: videoThumbnailView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //subTitleView
        addConstraint(NSLayoutConstraint.init(item: subtitleView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: subtitleView, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint.init(item: subtitleView, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint.init(item: subtitleView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIView {
    func addConstraintWithVisualFormat(format: String, views: UIView...) {
        var viewDict = [String : UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: viewDict))
    }
}

