//
//  ParentsDetailsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 03/09/21.
//

import UIKit
import MBProgressHUD

protocol FatherDeatilsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: FatherDeatilsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: FatherDeatilsModel.Fetch.ViewModel)
}
protocol MotherDetailsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: MotherDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: MotherDetailsModel.Fetch.ViewModel)
}
protocol GuardianDetailsDisplayLogic: AnyObject
{
    func successFetchedItems(viewModel: GuardianDetailsModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: GuardianDetailsModel.Fetch.ViewModel)
}

class ParentsDetailsVC: UIViewController, FatherDeatilsDisplayLogic, MotherDetailsDisplayLogic,GuardianDetailsDisplayLogic {

    @IBOutlet weak var motherImg: UIImageView!
    @IBOutlet weak var guardianImg: UIImageView!
    @IBOutlet weak var fatherImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addres: UILabel!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var income: UILabel!
    @IBOutlet weak var mobile: UILabel!
    @IBOutlet weak var telephone: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var officePhone: UILabel!
    
    var selectedStudentId = String()
    var selectedClassId = String()
    var interactor: FatherDeatilsBusinessLogic?
    var interactor2: MotherDetailsBusinessLogic?
    var interactor3: GuardianDetailsBusinessLogic?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.bgView.dropShadow()
        interactor?.fetchItems(request: FatherDeatilsModel.Fetch.Request(admission_id:self.selectedStudentId,dynamic_db: GlobalVariables.shared.dynamic_db))
        MBProgressHUD.showAdded(to: self.view, animated: true)
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
        let interactor = FatherDeatilsInteractor()
        let presenter = FatherDeatilsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        let viewController2 = self
        let interactor2 = MotherDetailsInteractor()
        let presenter2 = MotherDetailsPresenter()
        viewController2.interactor2 = interactor2
        interactor2.presenter2 = presenter2
        presenter2.viewController2 = viewController2
        
        let viewController3 = self
        let interactor3 = GuardianDetailsInteractor()
        let presenter3 = GuardianDetailsPresenter()
        viewController3.interactor3 = interactor3
        interactor3.presenter3 = presenter3
        presenter3.viewController3 = viewController3
    }
        
    @IBAction func fatherDetails(_ sender: Any) {
        interactor?.fetchItems(request: FatherDeatilsModel.Fetch.Request(admission_id:self.selectedStudentId,dynamic_db: GlobalVariables.shared.dynamic_db))
        
        self.motherImg.image = UIImage(named:"Mother light")
        self.guardianImg.image = UIImage(named:"Guardian light -1")
        self.fatherImg.image = UIImage(named:"Father")
    }
    
    @IBAction func motherDetails(_ sender: Any) {
        interactor2?.fetchItems(request: MotherDetailsModel.Fetch.Request(admission_id:self.selectedStudentId,dynamic_db: GlobalVariables.shared.dynamic_db))
        
        self.motherImg.image = UIImage(named:"Mother")
        self.guardianImg.image = UIImage(named:"Guardian light -1")
        self.fatherImg.image = UIImage(named:"Father light")
    }
    
    @IBAction func guardianDetails(_ sender: Any) {
        
        interactor3?.fetchItems(request: GuardianDetailsModel.Fetch.Request(admission_id:self.selectedStudentId,dynamic_db: GlobalVariables.shared.dynamic_db))
        
        self.motherImg.image = UIImage(named:"Mother light")
        self.guardianImg.image = UIImage(named:"Guardian light ")
        self.fatherImg.image = UIImage(named:"Father light")
    }
    
    @IBAction func viewTableAction(_ sender: Any) {
        
    }
}

extension ParentsDetailsVC {
    
//    FatherDeatilsDisplayLogic
    func successFetchedItems(viewModel: FatherDeatilsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        self.name.text = viewModel.name
        self.addres.text = viewModel.home_address
        self.emailId.text = viewModel.email
        self.occupation.text = viewModel.occupation
        self.income.text = viewModel.income
        self.mobile.text = viewModel.mobile
        self.telephone.text = viewModel.home_phone
        self.officePhone.text = viewModel.office_phone
    }
    
    func errorFetchingItems(viewModel: FatherDeatilsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
//    MotherDetailsDisplayLogic
    func successFetchedItems(viewModel: MotherDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        self.name.text = viewModel.name
        self.addres.text = viewModel.home_address
        self.emailId.text = viewModel.email
        self.occupation.text = viewModel.occupation
        self.income.text = viewModel.income
        self.mobile.text = viewModel.mobile
        self.telephone.text = viewModel.home_phone
        self.officePhone.text = viewModel.office_phone
    }
    
    func errorFetchingItems(viewModel: MotherDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
//    GuardianDetailsDisplayLogic
    func successFetchedItems(viewModel: GuardianDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
        self.name.text = viewModel.name
        self.addres.text = viewModel.home_address
        self.emailId.text = viewModel.email
        self.occupation.text = viewModel.occupation
        self.income.text = viewModel.income
        self.mobile.text = viewModel.mobile
        self.telephone.text = viewModel.home_phone
        self.officePhone.text = viewModel.office_phone
    }
    
    func errorFetchingItems(viewModel: GuardianDetailsModel.Fetch.ViewModel) {
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
