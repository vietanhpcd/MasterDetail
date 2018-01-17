//
//  MasterViewController.swift
//  MasterDetail
//
//  Created by Anhdzai on 1/9/18.
//  Copyright © 2018 Anhdzai. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var arrayDataIMG = [TypeArrayIMG]()
    var arrayVariableDataIMG = [TypeVariableArrayIMG]()
    
    var indexPathForSelectedRow: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadSampleImage()
        loadSampleVariableIMG()
        navigationItem.leftBarButtonItem = editButtonItem
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDataIMG.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath) as? MasterTableViewCell  else { fatalError("The dequeued cell is not an instance of MasterTableViewCell.") }
        // Fetches the appropriate meal for the data source layout.
        
        cell.nameLabel.text = arrayDataIMG[indexPath.row].name
        arrayVariableDataIMG[indexPath.row].name = arrayDataIMG[indexPath.row].name
        cell.ratingImg.rating = arrayDataIMG[indexPath.row].rating
        arrayVariableDataIMG[indexPath.row].rating = arrayDataIMG[indexPath.row].rating
        
        let urlIMG = URL(string: arrayDataIMG[indexPath.row].urlTextIMG)!
        DispatchQueue.global().async {
            let dataIMG = NSData(contentsOf: urlIMG)!
            DispatchQueue.main.async {
                cell.imgView.image = UIImage(data: dataIMG as Data)
                self.arrayVariableDataIMG[indexPath.row].image = cell.imgView.image!
            }
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayDataIMG.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    //MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                indexPathForSelectedRow = indexPath
                let detailViewController = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                detailViewController.variableIMG = arrayVariableDataIMG[indexPath.row]
                detailViewController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                detailViewController.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    //MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let detailViewController = sender.source as? DetailViewController,
        let indexPath = indexPathForSelectedRow {
            // Update an existing meal.
            arrayVariableDataIMG[indexPath.row] = detailViewController.variableIMG!
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    //MARK: Data sample array Image
    private func loadSampleImage() {
        
        let urlTextIMG1 = "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/13882631_1752923801625397_3017520630682105893_n.jpg?oh=8d8fd725162e66847b40fb67c9cc6f1c&oe=5AE9A904"
        let name1 = "Nguyễn Phuong Chi"
        let urlTextIMG2 = "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/20596952_1877113212552498_4260954232612984014_n.jpg?oh=75fad98ccc122432e128767cd1de1864&oe=5AE4235A"
        let name2 = "linh IChi"
        let urlTextIMG3 = "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/21371356_757448777760755_5107523621305562451_n.jpg?oh=c942835b25955eabd190ec4e3ab69f5f&oe=5AB1A070"
        let name3 = "Đào Thị Lụa"
        let urlTextIMG4 = "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/24232709_375341182906729_8316518842280303369_n.jpg?oh=8713ebdb3b2eb6c8c12e9285f2808d48&oe=5AB26E31"
        let name4 = "Vân hạ"
        let urlTextIMG5 = "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/14355794_699084186924426_4131274230090189943_n.jpg?oh=65d75d8de439a8bde7da750a54388ccc&oe=5AFD6C04"
        let name5 = "Cô xíu"
        let urlTextIMG6 = "https://scontent.fhan2-2.fna.fbcdn.net/v/t1.0-9/22528046_1876859209309252_5094913037608506507_n.jpg?oh=4441286d4c86e0588b51784ca4b831db&oe=5AF2B04C"
        let name6 = "Nguyễn Thị Huế"
        
        guard let img1 = TypeArrayIMG(name: name1, urlTextIMG: urlTextIMG1, rating: 5) else {
            fatalError("Unable to instantiate IMG1")
        }
        
        guard let img2 = TypeArrayIMG(name: name2, urlTextIMG: urlTextIMG2, rating: 3) else {
            fatalError("Unable to instantiate IMG2")
        }
        
        guard let img3 = TypeArrayIMG(name: name3, urlTextIMG: urlTextIMG3, rating: 4) else {
            fatalError("Unable to instantiate IMG3")
        }
        
        guard let img4 = TypeArrayIMG(name: name4, urlTextIMG: urlTextIMG4, rating: 3) else {
            fatalError("Unable to instantiate IMG4")
        }
        guard let img5 = TypeArrayIMG(name: name5, urlTextIMG: urlTextIMG5, rating: 4) else {
            fatalError("Unable to instantiate IMG5")
        }
        guard let img6 = TypeArrayIMG(name: name6, urlTextIMG: urlTextIMG6, rating: 4) else {
            fatalError("Unable to instantiate IMG6")
        }
        arrayDataIMG += [img1, img2, img3, img4, img5, img6]
    }
    
    private func loadSampleVariableIMG() {
        let photo = UIImage(named: "defaultPhoto")
        guard let img = TypeVariableArrayIMG(name: "name", image: photo!, rating: 0) else {
            fatalError("Unable to instantiate photo")
        }
        arrayVariableDataIMG += [img]
    }
}

