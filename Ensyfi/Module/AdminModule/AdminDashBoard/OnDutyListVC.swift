//
//  OnDutyListVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 04/09/21.
//

import UIKit
import MBProgressHUD
import SideMenu

protocol ODStudentsListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ODStudentsListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ODStudentsListModel.Fetch.ViewModel)
}

protocol ODTeachersListDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: ODTeachersListModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: ODTeachersListModel.Fetch.ViewModel)
}

class OnDutyListVC: UIViewController, ODStudentsListDisplayLogic, ODTeachersListDisplayLogic,SideMenuNavigationControllerDelegate {
  
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var displayedODTeachersListData: [ODTeachersListModel.Fetch.ViewModel.DisplayedODTeachersListData] = []
    var displayedODStudentsListData: [ODStudentsListModel.Fetch.ViewModel.DisplayedODStudentsListData] = []
    var interactor: ODStudentsListBusinessLogic?
    var interactor1: ODTeachersListBusinessLogic?
    
    var selectedType = String()
    var selectedODId = String()
    var selectedFromDate = String()
    var selectedToDate = String()
    var selectedTitle = String()
    var selectedDescription = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        interactor?.fetchItems(request: ODStudentsListModel.Fetch.Request(user_type :"1",dynamic_db: GlobalVariables.shared.dynamic_db))
        self.selectedType = "ST"
        self.bgView.dropShadow()
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        view.alpha = 0.8
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
           view.alpha = 1
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup()
    {
        let viewController = self
        let interactor = ODStudentsListInteractor()
        let presenter = ODStudentsListPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = ODTeachersListInteractor()
        let presenter1 = ODTeachersListPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
    }
    
    @IBAction func sementAction(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            interactor?.fetchItems(request: ODStudentsListModel.Fetch.Request(user_type :"1",dynamic_db: GlobalVariables.shared.dynamic_db))
            self.selectedType = "ST"
            self.img2.image = UIImage(named:"unselected1")
            self.img1.image = UIImage(named:"selected")
        }
        else {
            interactor1?.fetchItems(request: ODTeachersListModel.Fetch.Request(user_type :"1",dynamic_db: GlobalVariables.shared.dynamic_db))
            self.selectedType = "TC"
         
            self.img2.image = UIImage(named:"selected")
            self.img1.image = UIImage(named:"unselected1")
        }
    }
}

extension OnDutyListVC {
    
//
    func successFetchedItems(viewModel: ODStudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedODStudentsListData = viewModel.displayedODStudentsListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ODStudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
    
//
    func successFetchedItems(viewModel: ODTeachersListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedODTeachersListData = viewModel.displayedODTeachersListData
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: ODTeachersListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:Globals.errorAlertMsg, complition: {
        })
    }
}

extension OnDutyListVC : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.selectedType == "ST" {
            
            return displayedODStudentsListData.count
        }
        else {
            
            return displayedODTeachersListData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ONDutyListCell
        
        if self.selectedType == "ST" {
            
            let data = displayedODStudentsListData[indexPath.row]
            cell.name.text = "\(data.name!) - \(data.od_for!)"
            cell.date.text = "\(data.from_date!) - \(data.to_date!)"
            cell.status.text = data.status
            
            if data.status == "Approved" {
                cell.status.textColor = UIColor.systemGreen
                cell.sideView.backgroundColor = UIColor.systemGreen
                cell.statusImg.image = UIImage(named:"Completed ")
            }
            else if data.status == "Rejected" {
                cell.status.textColor = UIColor.systemRed
                cell.sideView.backgroundColor = UIColor.systemRed
                cell.statusImg.image = UIImage(named:"rejected")
            }
            else if data.status == "Pending" {
                cell.status.textColor = UIColor.systemYellow
                cell.sideView.backgroundColor = UIColor.systemYellow
                cell.statusImg.image = UIImage(named:"pending")
            }
            cell.selectionStyle = .none
        }
        else {
            
            let data = displayedODTeachersListData[indexPath.row]
            cell.name.text = "\(data.name!) - \(data.od_for!)"
            cell.date.text = "\(data.from_date!) - \(data.to_date!)"
            cell.status.text = data.status
            
            if data.status == "Approved" {
                cell.status.textColor = UIColor.systemGreen
                cell.sideView.backgroundColor = UIColor.systemGreen
                cell.statusImg.image = UIImage(named:"Completed ")
            }
            else if data.status == "Rejected" {
                cell.status.textColor = UIColor.systemRed
                cell.sideView.backgroundColor = UIColor.systemRed
                cell.statusImg.image = UIImage(named:"rejected")
            }
            else if data.status == "Pending" {
                cell.status.textColor = UIColor.systemYellow
                cell.sideView.backgroundColor = UIColor.systemYellow
                cell.statusImg.image = UIImage(named:"pending")
            }
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.selectedType == "ST" {
            
        let data = displayedODStudentsListData[indexPath.row]
            self.selectedODId = data.id!
            self.selectedTitle = data.od_for!
            self.selectedFromDate = data.from_date!
            self.selectedToDate = data.to_date!
            self.selectedDescription = data.notes!
            self.performSegue(withIdentifier: "od_approval", sender: self)
        }
        else {
            
        let data = displayedODTeachersListData[indexPath.row]
            self.selectedODId = data.id!
            self.selectedTitle = data.od_for!
            self.selectedFromDate = data.from_date!
            self.selectedToDate = data.to_date!
            self.selectedDescription = data.notes!
            self.performSegue(withIdentifier: "od_approval", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "od_approval")
        {
        let vc = segue.destination as! ODApprovalVC
            vc.selectedODId = self.selectedODId
            vc.selectedTitle = self.selectedTitle
            vc.selectedFromDate = self.selectedFromDate
            vc.selectedToDate = self.selectedToDate
            vc.selectedDescription = self.selectedDescription
        }
    }
}
