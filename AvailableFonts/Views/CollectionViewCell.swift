//
//  CollectionViewCell.swift
//  AvailableFonts
//
//  Created by Alexander on 11/1/17.
//  Copyright © 2017 Dictality. All rights reserved.
//

import UIKit

class LetterData {
  var font: UIFont
  var letter: String
  
  init(fontName: String, letter: String) {
    self.font = UIFont(name: fontName, size: 85)!
    self.letter = letter
  }
}

class CollectionViewCell: UICollectionViewCell {
  
  static let cellIdentifier = "letterCell"
  
  var letterData: LetterData! {
    didSet {
      label.font = letterData.font
      label.text = letterData.letter
      label.textAlignment = .center
    }
  }
  
  private var label: UILabel = {
    let view = UILabel()
    view.backgroundColor = UIColor.yellow.withAlphaComponent(0.6)
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
    
    // Letter Label
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: centerXAnchor),
      label.centerYAnchor.constraint(equalTo: centerYAnchor),
      label.widthAnchor.constraint(equalTo: widthAnchor),
      label.heightAnchor.constraint(equalTo: heightAnchor)
    ])
  }
  
}
