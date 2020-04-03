//
//  ViewController.swift
//  UISearchBar2
//
//  Created by Mayur Mori on 17/09/19.
//  Copyright © 2019 Mayur Mori. All rights reserved.
//

import UIKit

// MARK: - GLOBLE PROPERTIES -
let arrAlpha = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
let arrCountry = ["Afghanistan", "Algeria", "Bahrain","Brazil", "Cuba", "Denmark","Denmark", "Georgia", "Hong Kong", "Iceland", "India", "Japan", "Kuwait", "Nepal"]

let arrActor = ["Arjun kapoor","Varun dhawan","Shahrukhan","Salman Khan","Amitabh Bachhan","Amir khan","Anil kapoor","Sonam kapoor","Pareeniti Chopra","Virat kohli","Aishwarya ray Bachhan","Prachi Desai","Diya mirza","Kangana Ranaut","Deepika Padukone","Alia Bhatt.","Sunny Leone","Kareena Kapoor Khan","Kriti Sanon","Ranveer Sinh","Ranbir","Disha Patni","Alu Arjun"]
var isSearch: Bool = false
var arrFilter: [String] = [] // or var arrFilter = [""]

class ViewController: UIViewController {
    
    // MARK: - IBOUTLET -
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: TableView!
    
    // MARK: - VIEW LIFE CYCLE METHODS -
    override func viewDidLoad() {
        self.setupUI()
    }
    
    private func setupUI() {
        self.searchBar.delegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            isSearch = false
            self.tblView.reloadData()
        } else {
            arrFilter = arrActor.filter { (text) -> Bool in
                if text.lowercased().contains(searchText.lowercased()) {
                    return true
                } else {
                    return false
                }
            }
            if searchText.count == 0 {
                isSearch = false
            } else {
                isSearch = true
            }
            self.tblView.reloadData()
        }
    }
}
