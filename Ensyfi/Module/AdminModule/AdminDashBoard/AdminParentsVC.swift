//
//  AdminParentsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit
import DropDown
import MBProgressHUD
import SideMenu

class AdminParentsVC: UIViewController,ClassViewDisplayLogic,SectionListDisplayLogic, StudentsListDisplayLogic,SideMenuNavigationControllerDelegate {

    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var sectionTextfield: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var sectionBtnOutlet: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let dropDown = DropDown()
    var interactor: ClassViewBusinessLogic?
    var interactor1: SectionListBusinessLogic?
    var interactor2: StudentsListBusinessLogic?
    
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var secId = [String]()
    var studentIdArr = [String]()
    var serialNoArr = [Int]()
    
    var selectedClassId = String()
    var selectedSecId = String()
    var selectedStudentId = String()
    
    var displayedClassViewData: [ClassViewModel.Fetch.ViewModel.DisplayedClassViewData] = []
    var displayedSectionListData: [SectionListModel.Fetch.ViewModel.DisplayedSectionListData] = []
    var displayedStudentsListData: [StudentsListModel.Fetch.ViewModel.DisplayedStudentsListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bgView.dropShadow()
        interactor?.fetchItems(request: ClassViewModel.Fetch.Request(user_id :"",dynamic_db: GlobalVariables.shared.dynamic_db))
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
        let interactor = ClassViewInteractor()
        let presenter = ClassViewPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController1 = self
        let interactor1 = SectionListInteractor()
        let presenter1 = SectionListPresenter()
        viewController1.interactor1 = interactor1
        interactor1.presenter1 = presenter1
        presenter1.viewController1 = viewController1
        
        let viewController2 = self
        let interactor2 = StudentsListInteractor()
        let presenter2 = StudentsListPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        dropDown.show()
        dropDown.anchorView = classTextfield
        dropDown.dataSource = className
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = classId[index]
            self.selectedClassId = String(slecteId)
            print(selectedClassId)
            interactor1?.fetchItems(request: SectionListModel.Fetch.Request(class_id :self.selectedClassId,dynamic_db: GlobalVariables.shared.dynamic_db))
        }
    }
    
    @IBAction func selectSection(_ sender: Any) {
        
        if classTextfield.text!.count == 0 {
            
            sectionBtnOutlet.isEnabled = false
        }
        else {
//            sectionBtnOutlet.isEnabled = true
            dropDown.show()
            dropDown.anchorView = sectionTextfield
            dropDown.dataSource = secName
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
              print("Selected item: \(item) at index: \(index)")
                sectionTextfield.text = item
                let slecteId = secId[index]
                self.selectedSecId = String(slecteId)
                print(selectedSecId)
                interactor2?.fetchItems(request: StudentsListModel.Fetch.Request(class_id :self.selectedClassId,section_id: self.selectedSecId,dynamic_db: GlobalVariables.shared.dynamic_db))
            }
        }
    }
}

extension AdminParentsVC {
    
//    ClassViewDisplayLogic
    func successFetchedItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        displayedClassViewData = viewModel.displayedClassViewData
        
        MBProgressHUD.hide(for: self.view, animated: true)
        for data in displayedClassViewData {
            
            let class_name = data.class_name
            let class_id = data.class_id
            
            self.className.append(class_name!)
            self.classId.append(class_id!)
        }
    }
    
    func errorFetchingItems(viewModel: ClassViewModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
    
//    SectionListDisplayLogic
    func successFetchedItems(viewModel: SectionListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedSectionListData = viewModel.displayedSectionListData
        
        for data in displayedSectionListData {
            
            let secName = data.sec_name
            let secId = data.sec_id
            
            self.secId.append(secId!)
            self.secName.append(secName!)
        }
    }
    
    func errorFetchingItems(viewModel: SectionListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
    
//    StudentsListDisplayLogic
    func successFetchedItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        displayedStudentsListData = viewModel.displayedStudentsListData
        for i in 1...10000 {
            self.serialNoArr.append(i)
        }
        self.tableView.reloadData()
    }
    
    func errorFetchingItems(viewModel: StudentsListModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"An error occured", complition: {
        })
    }
}

extension AdminParentsVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return displayedStudentsListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentsListCell
        
        let data = displayedStudentsListData[indexPath.row]
        
        cell.SerialNo.text = String(serialNoArr[indexPath.row])
        cell.admissionNo.text = data.admisn_no
        cell.studentName.text = data.name
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = displayedStudentsListData[indexPath.row]
        self.selectedStudentId = data.enroll_id!
        
        self.performSegue(withIdentifier: "to_parentDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "to_parentDetails")
        {
        let vc = segue.destination as! ParentsDetailsVC
            vc.selectedStudentId = self.selectedStudentId
            vc.selectedClassId = self.selectedClassId
            
        }
    }
}
