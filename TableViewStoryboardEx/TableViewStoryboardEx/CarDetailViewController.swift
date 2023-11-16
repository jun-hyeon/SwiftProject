//
//  CarDetailViewController.swift
//  TableViewStoryboardEx
//
//  Created by 최준현 on 11/16/23.
//

import UIKit

class CarDetailViewController: UIViewController {
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTextView: UITextView!
    @IBOutlet var detailCarLabel: UILabel!
    var car: Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        if let data = car{
            detailImageView.image = UIImage(named: data.imageName)
            detailCarLabel.text = data.name
            detailTextView.text = data.description
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
