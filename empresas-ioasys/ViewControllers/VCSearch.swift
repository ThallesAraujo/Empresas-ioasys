//
//  VCSearch.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 17/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit

class VCSearch: UIViewController, Storyboarded, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var coordinator: Coordinator?
    var enterprises : [Enterprise] = []
    var enterprisesFilter: [Enterprise] = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbvSearchResults: UITableView!
    @IBOutlet weak var lblNoSearchResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblNoSearchResults.isHidden = true
        self.searchBar.delegate = self
        self.tbvSearchResults.delegate = self
        self.tbvSearchResults.dataSource = self
        self.tbvSearchResults.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? enterprisesFilter.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EnterpriseCell") as? EnterpriseCell{
            cell.setup(enterprise: enterprisesFilter[indexPath.row], coordinator: self.coordinator)
            return cell
        }else{
            return EnterpriseCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            let searchResults = self.enterprises.filter({ (enterprise) -> Bool in
                return enterprise.enterprise_name.lowercased().contains(searchText.lowercased()) ||
                enterprise.city.lowercased().contains(searchText.lowercased()) ||
                enterprise.country.lowercased().contains(searchText.lowercased()) ||
                (enterprise.enterprise_type?.enterprise_name_type.lowercased().contains(searchText.lowercased()))!
            })
            
            if searchResults.count > 0{
                self.enterprisesFilter = searchResults
                self.tbvSearchResults.reloadData()
                self.tbvSearchResults.isHidden = false
                self.lblNoSearchResults.isHidden = true
            }else{
                self.tbvSearchResults.isHidden = true
                self.lblNoSearchResults.isHidden = false
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.coordinator?.navigationController.popViewController(animated: true)
    }

}
