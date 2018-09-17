//
//  ViewController.swift
//  StretchyCollection
//
//  Created by Ryan Poolos on 1/19/16.
//  Copyright © 2016 Frozen Fire Studios, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        title = "Stretchy Header"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboards Ugh")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        collectionView.backgroundColor = UIColor.lightGray
        
        view.addSubview(collectionView)
        
        let views = ["collectionView": collectionView]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collectionView]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[collectionView]|", options: [], metrics: nil, views: views))
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionLayout.itemSize = CGSize(width: size.width - (padding * 2.0), height: 64.0)
    
    }
    
    //==========================================================================
    // MARK: - UICollectionViewDataSource
    //==========================================================================
    
    private let cellIdentifier = "UniqueCellIdentifier"
    private let headerIdentifier = "UniqueHeaderIdentifier"
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath as IndexPath) as! StretchyHeaderView
        view.blurView.alpha = 0
        view.imageView.image = UIImage(named: "Photo")
        return view
    }
    
   
    
    
    
    private func CalculateAlpha (headerHeight: CGFloat) -> CGFloat {
        let halfScreenHeight = view.frame.height  / 2
        let oneTenthOfHalfScreenHeight = halfScreenHeight / 10
        switch headerHeight {
        case  ..<oneTenthOfHalfScreenHeight :
            return 0.1
        case  oneTenthOfHalfScreenHeight ... oneTenthOfHalfScreenHeight * 2 :
            return 0.2
        case  oneTenthOfHalfScreenHeight * 2  ... oneTenthOfHalfScreenHeight * 3 :
            return 0.3
        case  oneTenthOfHalfScreenHeight * 3 ... oneTenthOfHalfScreenHeight * 4 :
            return 0.4
        case  oneTenthOfHalfScreenHeight * 4 ... oneTenthOfHalfScreenHeight * 5 :
            return 0.5
        case  oneTenthOfHalfScreenHeight * 5 ... oneTenthOfHalfScreenHeight * 6 :
            return 0.6
        case  oneTenthOfHalfScreenHeight * 6 ... oneTenthOfHalfScreenHeight * 7 :
            return 0.7
        case  oneTenthOfHalfScreenHeight * 7 ... oneTenthOfHalfScreenHeight * 8 :
            return 0.8
        case  oneTenthOfHalfScreenHeight * 8 ... oneTenthOfHalfScreenHeight * 9 :
            return 0.9
        case  oneTenthOfHalfScreenHeight * 9 ... halfScreenHeight :
            return 1.0
        default:
            return 1.0
        }
    }
    private func CalculateReverseAlpha (headerHeight: CGFloat) -> CGFloat {
        let halfScreenHeight = view.frame.height  / 2
        let oneTenthOfHalfScreenHeight = halfScreenHeight / 10
        switch headerHeight {
        
        case  oneTenthOfHalfScreenHeight ... oneTenthOfHalfScreenHeight * 2 :
            return 0.0
        case  oneTenthOfHalfScreenHeight * 2  ... oneTenthOfHalfScreenHeight * 3 :
            return 0.0
        case  oneTenthOfHalfScreenHeight * 3 ... oneTenthOfHalfScreenHeight * 4 :
            return 0.0
        case  oneTenthOfHalfScreenHeight * 4 ... oneTenthOfHalfScreenHeight * 5 :
            return 0.0
        case  oneTenthOfHalfScreenHeight * 5 ... oneTenthOfHalfScreenHeight * 6 :
            return 0.2
        case  oneTenthOfHalfScreenHeight * 6 ... oneTenthOfHalfScreenHeight * 7 :
            return 0.4
        case  oneTenthOfHalfScreenHeight * 7 ... oneTenthOfHalfScreenHeight * 8 :
            return 0.5
        case  oneTenthOfHalfScreenHeight * 8 ... oneTenthOfHalfScreenHeight * 9 :
            return 0.6
        case  oneTenthOfHalfScreenHeight * 9 ... halfScreenHeight :
            return 0.7
        case  halfScreenHeight ... view.frame.height :
            return 0.8
        default:
            return 0
        }
    }
    
    
    
    
    
    
    
    
    
    //==========================================================================
    // MARK: - Views
    //==========================================================================
    
    let padding: CGFloat = 8.0
    
    lazy var collectionLayout: StretchyCollectionViewLayout = { [unowned self] in
        let layout = StretchyCollectionViewLayout()
        layout.itemSpacing = self.padding
        layout.itemSize = CGSize(width: self.view.bounds.width - (self.padding * 2.0), height: 64.0)
        layout.sectionInset = UIEdgeInsets(top: self.padding, left: self.padding, bottom: 32.0, right: self.padding)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.lightGray
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        collectionView.register(StretchyHeaderView.self, forSupplementaryViewOfKind: StretchyCollectionHeaderKind, withReuseIdentifier: self.headerIdentifier)
        
        return collectionView
    }()
    
      var sectionInset = UIEdgeInsets.zero
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
       
        if(scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y > 0)
        {
         

        }
        
//            let scrollAlpha = scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y / 1000
//            print("header Frame: ", header.frame.height)
//            print(scrollView.panGestureRecognizer.velocity(in: scrollView.superview))
//            UIView.animate(withDuration: 0.4) {
//                header.blurView.effect = UIBlurEffect(style: .regular)
//                header.blurView.alpha = scrollAlpha
//
//            }
//            print("up")
//        }
//        else
//        {
//            print("down")
//        }
        
    
}
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let genHeader = collectionView.supplementaryView(forElementKind: StretchyCollectionHeaderKind, at: IndexPath(item: 0, section: 0))  {
            let header = genHeader as! StretchyHeaderView
        if(scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y > 0)
        {
            
            let scrollAlpha = CalculateAlpha(headerHeight: header.frame.height)
            UIView.animate(withDuration: 0.4) {
                // 2
                header.blurView.alpha = scrollAlpha
            }
//            print("up")
        }
        else{
            if header.frame.height >= 128 {
                let alpha = CalculateReverseAlpha(headerHeight: header.frame.height)
                UIView.animate(withDuration: 0.4) {
                    header.blurView.alpha = alpha
                }
//            print("down")
            }
            }
        }
    }
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        if(scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y > 0)
//        {
//            if let genHeader = collectionView.supplementaryView(forElementKind: StretchyCollectionHeaderKind, at: IndexPath(item: 0, section: 0))  {
//                let header = genHeader as! StretchyHeaderView
//            let alpha = CalculateReverseAlpha(headerHeight: header.frame.height)
//        UIView.animate(withDuration: 0.4) {
//            header.blurView.alpha = alpha
//
//        }
//    }
//    else{
////    print("down")
//    }
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   

}
