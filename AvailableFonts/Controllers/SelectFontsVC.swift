//
//  SelectFontsVC.swift
//  AvailableFonts
//
//  Created by Alexander on 11/1/17.
//  Copyright © 2017 Dictality. All rights reserved.
//

import UIKit

class SelectFontsVC: UIViewController {

  fileprivate let datasource = Datasource()
  
  private lazy var collection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionHeadersPinToVisibleBounds = true
    layout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 50)
    layout.estimatedItemSize = CGSize(width: 100, height: 100)
    
    let view = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.dataSource = self
    view.delegate = self
    view.backgroundColor = UIColor.purple.withAlphaComponent(0.7)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.cellIdentifier)
    collection.register(CollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.supplimentaryViewIdentifier)
    
    layoutViews()
  }

  private func layoutViews() {
    view.addSubview(collection)
    
    // Collection View
    NSLayoutConstraint.activate([
      collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collection.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      collection.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
    ])
  }
  
}

extension SelectFontsVC: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return datasource.availableFontNames.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return datasource.arrayOfText.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellIdentifier, for: indexPath) as! CollectionViewCell
    
    cell.letterData = LetterData(fontName: datasource.availableFontNames[indexPath.section], letter: datasource.arrayOfText[indexPath.row])
    
    return cell
  }
  
}

extension SelectFontsVC: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: CollectionViewHeader.supplimentaryViewIdentifier, for: indexPath) as! CollectionViewHeader
    
    view.label.text = datasource.availableFontNames[indexPath.section]
    view.label.font = UIFont(name: datasource.availableFontNames[indexPath.section], size: 25)
    
    view.counterLabel.text = "\(indexPath.section + 1) of \(datasource.availableFontNames.count)"
    view.counterLabel.font = view.label.font
    
    return view
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: self.view.frame.width, height: 50)
  }
  
}
