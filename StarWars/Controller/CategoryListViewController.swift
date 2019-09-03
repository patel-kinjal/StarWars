//
//  CategoryListViewController.swift
//  StarWars
//
//  Created by Kinjal  on 02/09/19.
//  Copyright © 2019 Kinjal . All rights reserved.
//

import UIKit

enum Categorytype {
    case people
    case films
    case starships
    case vehicle
    case species
    case planets
}

class CategoryListViewController: UIViewController {
    
    @IBOutlet weak var tableViewHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var categoryListTableView: UITableView! {
        didSet {
            categoryListTableView.delegate = self
            categoryListTableView.dataSource = self
            categoryListTableView.tableFooterView = UIView(frame: .zero)
            categoryListTableView.register(UINib.init(nibName: "CategoryListTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryListTableViewCell")
        }
    }
    
    var peopleModels = [PeopleViewModel]()
    var categoryString = ""
    
    init(category: String) {
        self.categoryString = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        categoryListTableView.frame = CGRect(x: categoryListTableView.frame.origin.x, y: categoryListTableView.frame.origin.y, width: categoryListTableView.frame.size.width, height: categoryListTableView.contentSize.height)
        categoryListTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetchData()
        navigationItem.title = categoryString.capitalized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    func fetchData() {
        
        Service.shared.fetchPeople { (people, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
            if let peopleArray = people?.results {
                self.peopleModels = peopleArray.map({return PeopleViewModel(people: $0)})
                self.categoryListTableView.reloadData()
            }
        }
    }
    
}

extension CategoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = CategoryDetailViewController.init(viewModel: peopleModels[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
}

extension CategoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("In number of rows - \(peopleModels.count)")
        return peopleModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryListTableViewCell", for: indexPath) as! CategoryListTableViewCell
        let peopleVM = peopleModels[indexPath.row]
        cell.peopleViewModel = peopleVM
        return cell
    }
}
