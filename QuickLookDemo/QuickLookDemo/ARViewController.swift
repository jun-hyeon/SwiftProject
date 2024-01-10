//
//  ARViewController.swift
//  QuickLookDemo
//
//  Created by 최준현 on 1/8/24.
//

import Foundation
import ARKit
import QuickLook
import UIKit

class ARViewController: UIViewController, QLPreviewControllerDataSource{
    
    override func viewDidAppear(_ animated: Bool) {
           let previewController = QLPreviewController()
           previewController.dataSource = self
           present(previewController, animated: true, completion: nil)
       }


       func numberOfPreviewItems(in controller: QLPreviewController) -> Int { return 1 }


       func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
           guard let path = Bundle.main.path(forResource: "slide", ofType: "usdz") else {
               fatalError("Couldn't find the supported input file.")
           }
           
           let url = URL(fileURLWithPath: path)
           
           return url as QLPreviewItem
       }
}
