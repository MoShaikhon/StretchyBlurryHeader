//
//  StretchyHeaderView.swift
//  StretchyCollection
//
//  Created by Ryan Poolos on 1/19/16.
//  Copyright © 2016 Frozen Fire Studios, Inc. All rights reserved.
//

import UIKit

class StretchyHeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        
        addSubview(imageView)

        let views = ["imageView": imageView]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: [], metrics: nil, views: views))
       
        addSubview(blurView)
//        vibrancyView.effect = vibrancyEffect
//        blurView.contentView.addSubview(imageView)
        // 4
//        blurView.contentView.addSubview(vibrancyView)
        
      
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
//        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
//        addSubview(vibrancyEffectView)
//        vibrancyEffectView.frame = blurView.bounds
//
//        vibrancyEffectView.contentView.addSubview(blurView)
//        blurView.contentView.addSubview(vibrancyEffectView)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboards Ugh")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
    }
    
    //==========================================================================
    // MARK: - Views
    //==========================================================================
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
//    let blurEffect = UIBlurEffect(style: .regular)

    // 2
//     var vibrancyEffect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .regular))
    // 2
     let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.prominent))
//    let vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: UIBlurEffect(style: .regular)))
    // 3
    
}
