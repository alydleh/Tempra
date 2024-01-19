//
//  heatMapViewControllerCollectionViewController.swift
//  RedApp_wFrontEnd
//
//  Created by Megan :) on 12/4/18.
//  Copyright © 2018 2.009RED. All rights reserved.
//

import UIKit

final class heatMapViewController: UICollectionView{
    
    // MARK: - Properties
    fileprivate let reuseIdentifier = "pix"
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    fileprivate let itemsPerRow: CGFloat = 32
    let totalColors = 100
    var column = 0
    var index = 0
    var start = true}
extension heatMapViewController {
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 32
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 32
    }
    //3
    func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath)
        if indexPath.row == 0 && !start{
            column+=1
        }
        index = column*32+indexPath.row
        cell.backgroundColor = UIColor.blue
        start = false
        return cell
    }
}
//private extension heatMapViewController {
//    func colorForIndexPath(indexPath: NSIndexPath) -> UICollectionViewCell{
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
//                                                      for: indexPath as IndexPath)
//        if indexPath.row >= totalColors {
//            cell.backgroundColor = UIColor.white
//            return cell  // return black if we get an unexpected row index
//        }
//
//        //let hueValue: CGFloat = CGFloat(indexPath.row) / CGFloat(totalColors)
//        cell.backgroundColor = UIColor.red
//        return cell
//    }
//}

extension heatMapViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 10)
        let availableWidth = bounds.size.height - paddingSpace
        print(bounds.size.height)
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
   // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, targetContent)

}
