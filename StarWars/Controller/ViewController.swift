//
//  ViewController.swift
//  StarWars
//
//  Created by Kinjal  on 28/08/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainCategoryTableView: UITableView! {
        didSet {
            mainCategoryTableView.delegate = self
            mainCategoryTableView.dataSource = self
            mainCategoryTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            // mainCategoryTableView.rowHeight = UITableView.automaticDimension
            // mainCategoryTableView.estimatedRowHeight = 63
            mainCategoryTableView.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
            mainCategoryTableView.tableFooterView = UIView()
        }
    }
    
    var categoryModel = [CategoryModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCategoryArray()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mainCategoryTableView.frame = CGRect(x: mainCategoryTableView.frame.origin.x, y: mainCategoryTableView.frame.origin.y, width: mainCategoryTableView.frame.size.width, height: mainCategoryTableView.contentSize.height)
    }
    
    override func viewDidLayoutSubviews() {
        mainCategoryTableView.frame = CGRect(x: mainCategoryTableView.frame.origin.x, y: mainCategoryTableView.frame.origin.y, width: mainCategoryTableView.frame.size.width, height: mainCategoryTableView.contentSize.height)
        mainCategoryTableView.reloadData()
    }
    
    func createCategoryArray() {
        categoryModel.append(CategoryModel(categoryName:"people", categoryImage: UIImage.init(imageLiteralResourceName: "noun_person_1880095")))
        categoryModel.append(CategoryModel(categoryName:"films", categoryImage: UIImage.init(imageLiteralResourceName: "noun_Film_1666495")))
        categoryModel.append(CategoryModel(categoryName:"starships", categoryImage: UIImage.init(imageLiteralResourceName: "noun_spaceship_1311585")))
        categoryModel.append(CategoryModel(categoryName:"vehicle", categoryImage: UIImage.init(imageLiteralResourceName: "noun_Car_1881053")))
        categoryModel.append(CategoryModel(categoryName:"species", categoryImage: UIImage.init(imageLiteralResourceName: "noun_alien_627223")))
        categoryModel.append(CategoryModel(categoryName:"planets", categoryImage: UIImage.init(imageLiteralResourceName: "noun_Planet_1867071")))
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categoryVC = CategoryListViewController(category: categoryModel[indexPath.row].categoryName)
        navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let category = categoryModel[indexPath.row]
        cell.titleLabel.text = category.categoryName.capitalized
        cell.iconImageView.image = category.categoryImage
        return cell
    }
}
