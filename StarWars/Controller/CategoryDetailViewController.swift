//
//  CategoryDetailViewController.swift
//  StarWars
//
//  Created by Kinjal  on 03/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var displayPicImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsTableView: UITableView! {
        didSet {
            detailsTableView.delegate = self
            detailsTableView.dataSource = self
            detailsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            detailsTableView.register(UINib.init(nibName: "CategoryDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryDetailTableViewCell")
            detailsTableView.tableFooterView = UIView(frame: .zero)
        }
    }
    
    let viewModel: PeopleViewModel?
    var modelDictionary: [String:String] = [:]
    var modelArray: [[String:String]] = []
    
    init(viewModel: PeopleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let model = self.viewModel {
            navigationItem.title = model.name
            iterateModelObjects(model: model)
            setUpUIView(model: model)
        }
    }
    
    func iterateModelObjects(model: PeopleViewModel) {
        
        let mirror = Mirror(reflecting: model)
        
        for case let (label?, value) in mirror.children {
            
            if case Optional<Any>.none = value {
                modelDictionary[label] = "-"
            } else {
                modelDictionary[label] = value as? String
            }
            
            modelArray.append([label:modelDictionary[label]!])
        }
    }
    
    func setUpUIView(model: PeopleViewModel) {
        displayPicImageView.setImageForName(model.name, backgroundColor: UIColor.lightGray, circular: true, textAttributes: nil, gradient: false)
        titleLabel.text = model.created
    }
}

extension CategoryDetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension CategoryDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryDetailTableViewCell", for: indexPath) as! CategoryDetailTableViewCell
        
        for (key, value) in modelArray[indexPath.row] {
            cell.titleLabel.text = key.capitalized
            cell.valueLabel.text = value
        }
        return cell
    }
}

