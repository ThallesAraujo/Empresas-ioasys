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
    @IBOutlet weak var lblEnterpriseName: UILabel!
    @IBOutlet weak var lblEnterpriseContact: UILabel!
    @IBOutlet weak var lblEnterpriseDescription: UILabel!
    
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblSharePrice: UILabel!
    @IBOutlet weak var lblMarketValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadProperties()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setup(enterprise: Enterprise?, coordinator: Coordinator?){
        self.enterprise = enterprise
        self.coordinator = coordinator
    }
    
    func loadProperties(){
        if let enterprise = self.enterprise{
            self.enterpriseImage.kf.setImage(with: URL.init(string: ImageHelper.getImage((enterprise.photo)) ), placeholder: UIImage.init(named: "enterprise_placeholder"), options: [.forceRefresh], progressBlock: nil, completionHandler: nil)
            self.lblEnterpriseName.text = enterprise.enterprise_name
            self.lblEnterpriseDescription.text = enterprise.description
            
            if enterprise.phone != "" && enterprise.email_enterprise != "" {
                self.lblEnterpriseContact.text = "\(enterprise.phone.toPhoneNumber()) | \(enterprise.email_enterprise)"
            }else{
                self.lblEnterpriseContact.isHidden = true
            }
            self.lblLocation.text = "\(enterprise.city), \(enterprise.country)"
            self.lblSharePrice.text = "Share price: \(enterprise.share_price!.formatCurrency())"
            self.lblMarketValue.text = "Market value: \(enterprise.value!.formatCurrency())"
        }
    }
    
    
    @IBAction func didTapFacebookButton(_ sender: Any) {
        
        if let facebook = self.enterprise?.facebook, facebook != ""{
           UIApplication.shared.open(URL(string: facebook)!, options: [:]) { _ in }
        }else{
           UIApplication.shared.open(URL(string: "https://www.facebook.com/search/top/?q=\(self.enterprise!.enterprise_name.formatUrl())")!, options: [:]) { _ in }
        }
        
    }
    
    @IBAction func didTapTwitterButton(_ sender: Any) {
        if let twitter = self.enterprise?.twitter, twitter != ""{
            UIApplication.shared.open(URL(string: twitter)!, options: [:]) { _ in }
        }else{
            UIApplication.shared.open(URL(string: "https://mobile.twitter.com/search?q=\(self.enterprise!.enterprise_name.formatUrl())&src=typed_query")!, options: [:]) { _ in }
        }
    }
    
    @IBAction func didTapLinkedInButton(_ sender: Any) {
        if let linkedin = self.enterprise?.linkedin, linkedin != ""{
            UIApplication.shared.open(URL(string: linkedin)!, options: [:]) { _ in }
        }else{
            UIApplication.shared.open(URL(string: "https://www.linkedin.com/search/results/all/?keywords=\(self.enterprise!.enterprise_name.formatUrl())&origin=GLOBAL_SEARCH_HEADER")!, options: [:]) { _ in }
        }
    }
    

}
