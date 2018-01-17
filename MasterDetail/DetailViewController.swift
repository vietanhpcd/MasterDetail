//
//  DetailViewController.swift
//  MasterDetail
//
//  Created by Anhdzai on 1/9/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet weak var ratingImg: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var variableIMG: TypeVariableArrayIMG?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let dataVariableImg = variableIMG {
            navigationItem.title = dataVariableImg.name
            photoImgView.image = dataVariableImg.image
            ratingImg.rating = dataVariableImg.rating
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIBarButtonItem, button === saveButton {
            let name = navigationItem.title
            let image = photoImgView.image
            let rating = ratingImg.rating
            variableIMG = TypeVariableArrayIMG(name: name!, image: image!, rating: rating)
        } else if let zoomIMGViewController = segue.destination as? ZoomIMGViewController {
            zoomIMGViewController.dataImageView = photoImgView.image
        }
    }
}

