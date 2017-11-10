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
    view.isEditable = false
    view.isSelectable = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let counterLabel: UILabel = {
    let view = UILabel()
    view.backgroundColor = .purple
    view.textColor = UIColor.white
    view.textAlignment = .right
    view.adjustsFontSizeToFitWidth = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let starButton: UIButton = {
    let view = UIButton()
    //view.setBackgroundImage(#imageLiteral(resourceName: "starIconEmpty"), for: .normal)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layoutViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //Action
  @objc private func buttonClicked() {
    
    // Save selected fond to array of selected fonts
    if let index = Datasource.selectedFontNames.index(of: label.text) {
      Datasource.selectedFontNames.remove(at: index)
      starButton.setBackgroundImage(#imageLiteral(resourceName: "starIconEmpty"), for: .normal)
    }
    else {
      Datasource.selectedFontNames.append(label.text)
      starButton.setBackgroundImage(#imageLiteral(resourceName: "starIcon"), for: .normal)
    }
    print(Datasource.selectedFontNames)
  }
  
  private func layoutViews() {
    addSubview(label)
    addSubview(counterLabel)
    addSubview(starButton)
    
    NSLayoutConstraint.activate([
      label.leadingAnchor.constraint(equalTo: leadingAnchor),
      label.topAnchor.constraint(equalTo: topAnchor),
      label.widthAnchor.constraint(equalTo: widthAnchor),
      label.heightAnchor.constraint(equalTo: heightAnchor)
      ])
    
    NSLayoutConstraint.activate([
      counterLabel.trailingAnchor.constraint(equalTo: starButton.leadingAnchor, constant: -10),
      counterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      counterLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.28),
      counterLabel.heightAnchor.constraint(equalTo: heightAnchor)
      ])
    
    NSLayoutConstraint.activate([
      starButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      starButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      starButton.widthAnchor.constraint(equalToConstant: bounds.height - 20),
      starButton.heightAnchor.constraint(equalToConstant: bounds.height - 20)
      ])
    
  }
  
}
