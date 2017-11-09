//
//  CollectionViewHeader.swift
//  AvailableFonts
//
//  Created by Alexander on 11/1/17.
//  Copyright © 2017 Dictality. All rights reserved.
//

import UIKit

class CollectionViewHeader: UICollectionReusableView {

  static let supplimentaryViewIdentifier = "sectionHeader"
  
  let label: UITextView = {
    let view = UITextView()
    view.backgroundColor = .purple
    view.textColor = UIColor.white
//    view.shadowColor = UIColor.lightGray
//    view.shadowOffset = CGSize(width: 0.8, height: 0.8)
    view.isEditable = false
    view.isSelectable = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let counterLabel: UILabel = {
    let view = UILabel()
    view.backgroundColor = .purple
    view.textColor = UIColor.white
//    view.shadowColor = UIColor.lightGray
//    view.shadowOffset = CGSize(width: 0.8, height: 0.8)
    view.textAlignment = .right
    view.adjustsFontSizeToFitWidth = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layoutViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layoutViews() {
    addSubview(label)
    addSubview(counterLabel)
    
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: leadingAnchor),
      label.topAnchor.constraint(equalTo: topAnchor),
      label.widthAnchor.constraint(equalTo: widthAnchor),
      label.heightAnchor.constraint(equalTo: heightAnchor)
      ])
    
    NSLayoutConstraint.activate([
      counterLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      counterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      counterLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.28),
      counterLabel.heightAnchor.constraint(equalTo: heightAnchor)
      ])
  }
}
