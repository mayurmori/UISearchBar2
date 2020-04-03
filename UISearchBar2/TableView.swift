//
//  TableView.swift
//  UISearchBar2
//
//  Created by Mayur Mori on 17/09/19.
//  Copyright © 2019 Mayur Mori. All rights reserved.
//

import UIKit

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - INIT METHODS -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    // MARK: - FUNCTIONS -
    func commonInit() {
        self.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        self.delegate = self
        self.dataSource = self
        
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        self.backgroundColor = UIColor.clear
        self.isScrollEnabled = true
        
        self.reloadData()
    }
    
    // MARK: - TABLEVIEW DATASOURCE & DELEGATE METHODS -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return arrFilter.count
        } else {
            return arrActor.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            configureCell(cell: cell, forRowAtIndexPath: indexPath as NSIndexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        if isSearch {
            cell.textLabel?.text = arrFilter[forRowAtIndexPath.row]
        } else {
            cell.textLabel?.text = arrActor[forRowAtIndexPath.row];
        }
    }
}
