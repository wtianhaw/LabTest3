//
//  SearchDetailVC.swift
//  LabTest
//
//  Created by Wong Tian Haw on 29/06/2022.
//

import UIKit
import Combine

class SearchDetailVC: BaseViewController {
    
    //Initialize UI
    @IBOutlet weak var tblView: UITableView!
    
    //Initialize VM instance
    private lazy var searchVM: SearchVM = {
        return SearchVM()
    }()
    
    //Pass the vm from parent vm to get existing data
    convenience init(vm :SearchVM) {
        self.init()
        self.searchVM = vm
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTblView()
        bindVM()
        self.searchVM.apply(.arrangeData)
    }
    
    private func setupUI(){
        self.navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        self.title = self.searchVM.searchResult?.location?.name ?? "Location"
    }
    
    private func setupTblView(){
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(DetailCell.getNib(), forCellReuseIdentifier: DetailCell.identifier)
        
    }
    
    //Bind the VM with VC
    private func bindVM(){
        self.searchVM.$searchDetailResult
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] list in
                guard let `self` = self else { return }
                self.tblView.reloadData()
            })
            .store(in: &self.cancellables)
    }
    
}

//Table View Cell and Section header handling
extension SearchDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = section == 0 ? "Location" : "Current"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .blue
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.searchVM.searchDetailResult.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchVM.searchDetailResult[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell {
            cell.model = self.searchVM.searchDetailResult[indexPath.section][indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

