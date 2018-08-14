//  Converted to Swift 4 by Swiftify v4.1.6792 - https://objectivec2swift.com/
//
//  DetailsViewController.swift
//  GoT
//
//  Created by Paciej on 21/10/15.
//  Copyright © 2015 Maciej Piotrowski. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    private var article: Article!
    private var imageView: UIImageView!
    private var abstractTextView: UITextView!
    private var openButton: UIButton!
    private var favouriteInfoLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(article: Article, favourite: Bool) {
        super.init(nibName: nil, bundle: nil)
        
        self.article = article
        title = article.title
        view.backgroundColor = UIColor.white
        if let aView = UIImageView.autolayout() as? UIImageView {
            imageView = aView
        }
        imageView.image = article.imageFromThumbnailData()
        if let aView = UITextView.autolayout() as? UITextView {
            abstractTextView = aView
        }
        abstractTextView.isEditable = false
        abstractTextView.text = article.abstract
        abstractTextView.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        if let aView = UILabel.autolayout() as? UILabel {
            favouriteInfoLabel = aView
        }
        favouriteInfoLabel.text = favourite ? "This is your favourite article" : "This is not your favourite article"
        favouriteInfoLabel.textAlignment = .center
        favouriteInfoLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        if let aView = UIButton.autolayout() as? UIButton {
            openButton = aView
        }
        openButton.setTitle("Open in Safari", for: .normal)
        openButton.addTarget(self, action: #selector(DetailsViewController.openButtonTapped(_:)), for: .touchUpInside)
        openButton.setTitleColor(UIColor.gray, for: .normal)
        openButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        view.addSubview(imageView)
        view.addSubview(abstractTextView)
        view.addSubview(openButton)
        view.addSubview(favouriteInfoLabel)
        imageView.mas_makeConstraints({ make in
            _ = make?.centerX.equalTo()(self.imageView.superview)
            _ = make?.top.equalTo()(self.imageView.superview)?.offset()(10)
            _ = make?.width.height().equalTo()(100)
        })
        abstractTextView.mas_makeConstraints({ make in
            _ = make?.top.equalTo()(self.imageView.mas_bottom)?.offset()(10)
            _ = make?.left.equalTo()(self.abstractTextView.superview)?.offset()(10)
            _ = make?.right.equalTo()(self.abstractTextView.superview)?.offset()(-10)
            _ = make?.bottom.equalTo()(self.favouriteInfoLabel.mas_top)?.offset()(-10)
        })
        favouriteInfoLabel.mas_makeConstraints({ make in
            _ = make?.height.equalTo()(40)
            _ = make?.bottom.equalTo()(self.openButton.mas_top)?.offset()(10)
            _ = make?.left.right().equalTo()(self.abstractTextView)
        })
        openButton.mas_makeConstraints({ make in
            _ = make?.height.equalTo()(40)
            _ = make?.left.right().equalTo()(self.abstractTextView)
            _ = make?.bottom.equalTo()(self.openButton.superview)?.offset()(-10)
        })
        edgesForExtendedLayout = []
    
    }

    @objc func openButtonTapped(_ sender: UIButton?) {
        if let aString = URL(string: article.urlString) {
            UIApplication.shared.openURL(aString)
        }
    }
}

/*Detail view is meant to display all above information about the selected Wiki
 * and enable the user to go to that wiki article in Safari using a button. User
 * should also see if a wiki is added to his favorite list or not.
 title
 thumbnail
 abstract - shortened to max 2 lines of description
 */
