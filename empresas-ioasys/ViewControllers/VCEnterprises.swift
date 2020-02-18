//
//  VCEnterprises.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit
import Kingfisher

class VCEnterprises: UIViewController, Storyboarded, UITableViewDelegate, UITableViewDataSource {
    
    var coordinator: Coordinator?
    var requestHandler = EnterpriseRequestHandler()
    
    
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var tbvEnterprises: UITableView!
    
    var enterprises: [Enterprise] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbvEnterprises.delegate = self
        self.tbvEnterprises.dataSource = self
        self.requestHandler.coordinator = self.coordinator
        self.loadEnterprises()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? enterprises.count : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EnterpriseCell") as? EnterpriseCell{
            cell.setup(enterprise: enterprises[indexPath.row], coordinator: self.coordinator)
            return cell
        }else{
            return EnterpriseCell()
        }
    }
    
    @IBAction func didTapGoToSearch(_ sender: Any) {
        if let coordinator = self.coordinator as? EnterprisesCoordinator{
            coordinator.goToSearch()
        }
    }
    
    
    func setup(){
        self.userPhoto.kf.setImage(with: URL.init(string: ImageHelper.getImage((SessionHelper.loadUser().photo)) ), placeholder: UIImage.init(named: "user_placeholder"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
        self.userPhoto.roundCorners()
    }
    
    func loadEnterprises(){
        self.requestHandler.loadEnterprises(completion: {enterprises in
            self.enterprises = enterprises
            self.tbvEnterprises.reloadData()
        })
    }


   
}
