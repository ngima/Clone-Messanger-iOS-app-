//
//  ViewController.swift
//  FacebookMessanger
//
//  Created by Ngima Sherpa on 11/9/18.
//  Copyright © 2018 Ngima Sherpa. All rights reserved.
//

import UIKit

class FriendsController: UICollectionViewController,UICollectionViewDelegateFlowLayout{

    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Recent"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for:indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    class FriendCell:BaseCell{
        
        let profileImageView : UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 34
            imageView.layer.masksToBounds = true
            return imageView
        }()
        
        let dividerLineView:UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
            return view
        }()
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "Mark Zuckerberg"
            label.font = UIFont.systemFont(ofSize: 18)
            return label
        }()
        
        let messageLabel: UILabel = {
            let label = UILabel()
            label.text = "Hello this is your friend's message label..."
            label.textColor = UIColor.darkGray
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
        
        
        let timeLabel: UILabel = {
            let label = UILabel()
            label.text = "10:09 am"
            label.font = UIFont.systemFont(ofSize: 18)
            return label
        }()
        
        let hasReadImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 10
            imageView.layer.masksToBounds = true
            return imageView
        }()
        override func setupViews(){
//            backgroundColor = UIColor.blue
            
            addSubview(profileImageView)
            addSubview(dividerLineView)
            setupContainerView()
            
            profileImageView.image = UIImage(named: "mark")
            hasReadImageView.image = UIImage(named: "mark")
            
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            dividerLineView.translatesAutoresizingMaskIntoConstraints = false

            addConstraintsWithFormat("H:|-12-[v0(68)]|", profileImageView)
            addConstraintsWithFormat("V:[v0(68)]", profileImageView)
            addConstraintCenterVertical(profileImageView)
            
            addConstraintsWithFormat("H:|-82-[v0]|", dividerLineView)
            addConstraintsWithFormat("V:[v0(1)]|", dividerLineView)
        }
        
        func setupContainerView(){
            let containerView = UIView()
            addSubview(containerView)
            
            addConstraintsWithFormat("H:|-90-[v0]|", containerView)
            addConstraintsWithFormat("V:[v0(50)]", containerView)
            addConstraintCenterVertical(containerView)
            
            containerView.addSubview(nameLabel)
            containerView.addSubview(messageLabel)
            containerView.addSubview(timeLabel)
            containerView.addSubview(hasReadImageView)
            
            addConstraintsWithFormat("H:|[v0][v1(80)]-12-|", nameLabel,timeLabel)
            addConstraintsWithFormat("V:|[v0][v1(24)]|", nameLabel,messageLabel)
            addConstraintsWithFormat("H:|[v0]-8-[v1(20)]-12-|", messageLabel,hasReadImageView)
            addConstraintsWithFormat("V:|[v0]", timeLabel)
            addConstraintsWithFormat("V:[v0(20)]|", hasReadImageView)
            
        }
    }
}


extension UIView {
    func addConstraintsWithFormat(_ format:String, _ views: UIView...){
        var viewsDictionary = [String:UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key]=view
            view.translatesAutoresizingMaskIntoConstraints=false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options:
            NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func addConstraintCenterVertical(_ view: UIView){
        addConstraint(NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal,
                                         toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}

class BaseCell:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
    func setupViews(){
        //            backgroundColor = UIColor.blue
    }
}
