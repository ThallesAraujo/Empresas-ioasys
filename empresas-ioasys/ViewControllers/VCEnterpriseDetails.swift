//
//  VCEnterpriseDetails.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit
import Kingfisher

class VCEnterpriseDetails: UIViewController, Storyboarded {
    
    var coordinator: Coordinator?
    var enterprise: Enterprise?
    
    
    @IBOutlet weak var enterpriseImage: UIImageView!
    @IBOutlet weak var lblEnterpriseContact: UILabel!
    @IBOutlet weak var lblEnterpriseDescription: UILabel!
    
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblSharePrice: UILabel!
    @IBOutlet weak var lblMarketValue: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadProperties()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.init(hex: "#ee4c77")
        
        if let coordinator = self.coordinator as? EnterpriseDetailsCoordinator{
            coordinator.enterprise = self.enterprise
        }
        
    }
    
    func setup(enterprise: Enterprise?, coordinator: Coordinator?){
        self.enterprise = enterprise
        self.coordinator = coordinator
    }
    
    func loadProperties(){
        if let enterprise = self.enterprise{
            self.title = self.enterprise?.enterprise_name
            self.enterpriseImage.kf.setImage(with: URL.init(string: ImageHelper.getImage((enterprise.photo)) ), placeholder: UIImage.init(named: "enterprise_placeholder"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            self.lblEnterpriseDescription.text = enterprise.description
            
            if enterprise.phone != "" && enterprise.email_enterprise != "" {
                self.lblEnterpriseContact.text = "\(enterprise.phone.toPhoneNumber()) | \(enterprise.email_enterprise)"
            }else{
                self.lblEnterpriseContact.isHidden = true
            }
            self.lblLocation.text = "\(enterprise.city), \(enterprise.country)"
            self.lblSharePrice.text = "Valor das ações: \(enterprise.share_price!.formatCurrency())"
            self.lblMarketValue.text = "Valor de mercado: \(enterprise.value!.formatCurrency())"
        }
    }
    
    
    @IBAction func didTapFacebookButton(_ sender: Any) {
        if let coordinator = self.coordinator as? EnterpriseDetailsCoordinator{
           coordinator.goToFacebook()
        }
    }
    
    @IBAction func didTapTwitterButton(_ sender: Any) {
        if let coordinator = self.coordinator as? EnterpriseDetailsCoordinator{
            coordinator.goToTwitter()
        }
    }
    
    @IBAction func didTapLinkedInButton(_ sender: Any) {
        if let coordinator = self.coordinator as? EnterpriseDetailsCoordinator{
            coordinator.goToLinkedIn()
        }
    }
    

}
