//
//  SearchWeatherVC.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import UIKit
import Combine

class SearchWeatherVC: BaseViewController {
    
    //Initialize UI
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //Initialize VM instance
    private lazy var searchVM: SearchVM = {
        return SearchVM()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindVM()
    }
    
    //Setup UI
    private func setupUI(){
        self.lblTitle.text = "Weather Forecast"
        self.textField.placeholder = "Eg:. Paris, Malaysia"
        self.lblError.text = "Field Required!"
        self.btnSearch.addTarget(self, action: #selector(self.handleSearchTap(_:)), for: .touchUpInside)
    }
    
    //Bind the VM with current VC
    private func bindVM(){
        self.searchVM.$searchResult
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] item in
                guard let `self` = self else { return }
                if let error = item?.error, let message = error.message {
                    MsgManager.shared.show(msg: message)
                    return
                }
                let vc = SearchDetailVC(vm: self.searchVM)
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .store(in: &self.cancellables)
    }
    
    //Trigger when button is clicked
    @objc func handleSearchTap(_ sender: UITapGestureRecognizer? = nil) {
        let searchText = textField.text ?? ""
        if(searchText.isEmpty){
            lblError.isHidden = false
        } else {
            lblError.isHidden = true
            self.searchVM.searchKeyWord = searchText
            self.searchVM.apply(.search)
        }
    }
    
}
