//
//  AssignHW_TestsVC.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 06/10/21.
//

import UIKit
import DropDown
import MBProgressHUD
import CoreData

class AssignHW_TestsVC: UIViewController {

    @IBOutlet weak var classTextfield: UITextField!
    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var classBtnOutlet: UIButton!
    @IBOutlet weak var subjectOutlet: UIButton!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var titleLbl: UILabel!
//    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var asignOutlet: UIButton!
    @IBOutlet weak var bgView1: UIView!
    @IBOutlet weak var bgView: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext?
    let dropDown = DropDown()
    
    let date = Date()
    let datePicker = UIDatePicker()
    var todayDate = String()
    var dateFormatted = String()
    let formatter = DateFormatter()
    var className = [String]()
    var classId = [String]()
    var secName = [String]()
    var subjectName = [String]()
    var subjectId = [String]()
    var selectedSubjectName = [String]()
    var selectedSubjectId = [String]()
    var selectedClassName = [String]()
    var selectedstudentName = [String]()
    var selectedstudentId = [String]()
    var selectedSubName = String()
    var selectedSubId = String()
    var selectedstudentStatus = [String]()
    var zipedArr = [String]()
    var attendanceStatusArr = [String]()
    var hWTestDataArr = [String]()
    var serialNoArr = [Int]()
    var selectedType = String()
    var selectedClassId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.context = appDelegate.persistentContainer.viewContext
        self.fetchSubjectData()
        self.fetchHWData()
        self.setDate()
        self.hideKeyboardWhenTappedAround()
        self.bgView.dropShadow()
        self.bgView1.dropShadow()
        self.selectedType = "HT"
        self.showDatePicker()
//        view.bindToKeyboard()
    }
    
    @IBAction func selectClass(_ sender: Any) {
        
        self.dropDown.show()
        self.dropDown.anchorView = self.classTextfield
        self.dropDown.dataSource = self.zipedArr
        self.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            classTextfield.text = item
            let slecteId = self.classId[index]
            let slectesub = self.subjectName[index]
            let slectesubId = self.subjectId[index]
            self.selectedClassId = String(slecteId)
            self.selectedSubjectName.append(slectesub)
            self.selectedSubjectId.append(slectesubId)
            print(selectedSubjectName)
            print(selectedSubjectId)
        }
    }
    
    @IBAction func selectHWTest(_ sender: Any) {
        
        self.dropDown.show()
        self.dropDown.anchorView = self.subjectTextField
        self.dropDown.dataSource = self.selectedSubjectName
        self.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.subjectTextField.text = item
            self.titleLbl.text = item
            self.selectedSubName = self.selectedSubjectName[index]
            self.selectedSubId = self.selectedSubjectName[index]
        }
    }
    
    @IBAction func sementAction(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            self.selectedType = "HT"
            self.img2.image = UIImage(named:"unselected1")
            self.img1.image = UIImage(named:"selected")
        }
        else {
            self.selectedType = "HW"
            self.img2.image = UIImage(named:"selected")
            self.img1.image = UIImage(named:"unselected1")
        }
    }
    
    @IBAction func assign(_ sender: Any) {
        
        if titleField.text!.isEmpty == true {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Enter title", complition: {
            })
        }
        else if detailsField.text!.isEmpty == true {
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Enter details", complition: {
            })
        }
        else if dateField.text!.isEmpty == true{
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"select date", complition: {
            })
        }
        else {
            saveHWTest(sync_status:"NS",class_id:self.selectedClassId,created_at:self.todayDate,due_date:self.dateField.text!,created_by:GlobalVariables.shared.user_id,hw_details:self.detailsField.text!,hw_type:self.selectedType,mark_status:"",server_hw_id:"",status:"A",subject_id:self.selectedSubId,subject_name:self.subjectTextField.text!,test_date:self.dateField.text!,title:self.titleField.text!,updated_at:"",updated_by:"",year_id:"1",teacher_id:GlobalVariables.shared.user_id,id:"1")
        }
    }
    
    func showDatePicker() {
       //Formate Date
       datePicker.datePickerMode = .date
       datePicker.backgroundColor = UIColor.white
       datePicker.setValue(UIColor.black, forKeyPath: "textColor")
       datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
      
       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       toolbar.backgroundColor = UIColor.white
       toolbar.tintColor = UIColor(red: 45/255.0, green: 148/255.0, blue: 235/255.0, alpha: 1.0)
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
       let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
       let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
       toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        dateField.inputAccessoryView = toolbar
        dateField.inputView = datePicker
    }
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }
        return nil
    }
    
     @objc func donedatePicker(){
        if dateField.isFirstResponder
        {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            dateFormatted = formatter.string(from: datePicker.date)
//            dateFormatted = datePicker.date
            let formatted = self.formattedDateFromString(dateString: dateFormatted, withFormat: "yyyy-MM-dd")
            dateField.text = formatted
            self.view.endEditing(true)
        }
    }
        
    @objc func cancelDatePicker() {
       self.view.endEditing(true)
     }
}

extension AssignHW_TestsVC {
    
    func setDate() {
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        self.todayDate = result
    }
    
    func fetchSubjectData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  datas = results as! [ClassSubjects]
    
            for data in datas {
                self.className = data.class_name as! [String]
                self.secName = data.sec_name as! [String]
                self.classId = data.class_master_id as! [String]
                self.subjectName = data.subject_name as! [String]
                self.subjectId = data.subject_id as! [String]
                let ziped = zip(className, secName)
                let result = ziped.map { $0.0 + " " + $0.1 }
                self.zipedArr = result
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func fetchHWData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ClassSubjects")
    
        do {
            let results = try context.fetch(fetchRequest)
            let  datas = results as! [ClassSubjects]
    
            for data in datas {
                self.className = data.class_name as! [String]
                self.secName = data.sec_name as! [String]
                self.classId = data.class_master_id as! [String]
                self.subjectName = data.subject_name as! [String]
                self.subjectId = data.subject_id as! [String]
                let ziped = zip(className, secName)
                let result = ziped.map { $0.0 + " " + $0.1 }
                self.zipedArr = result
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func saveHWTest(sync_status:String,class_id:String,created_at:String,due_date:String,created_by:String,hw_details:String,hw_type:String,mark_status:String,server_hw_id:String,status:String,subject_id:String,subject_name:String,test_date:String,title:String,updated_at:String,updated_by:String,year_id:String,teacher_id:String,id:String){
        
        let studentAttendance = NSEntityDescription.insertNewObject(forEntityName: "Homework_class_test", into: context!)
      
        studentAttendance.setValue(sync_status, forKey: "sync_status")
        studentAttendance.setValue(class_id, forKey: "class_id")
        studentAttendance.setValue(created_at, forKey: "created_at")
        studentAttendance.setValue(created_by, forKey: "created_by")
        studentAttendance.setValue(due_date, forKey: "due_date")
        studentAttendance.setValue(hw_details, forKey: "hw_details")
        studentAttendance.setValue(hw_type, forKey: "hw_type")
        studentAttendance.setValue(mark_status, forKey: "mark_status")
        studentAttendance.setValue(server_hw_id, forKey: "server_hw_id")
        studentAttendance.setValue(status, forKey: "status")
        studentAttendance.setValue(subject_id, forKey: "subject_id")
        studentAttendance.setValue(subject_name, forKey: "subject_name")
        studentAttendance.setValue(test_date, forKey: "test_date")
        studentAttendance.setValue(teacher_id, forKey: "teacher_id")
        studentAttendance.setValue(title, forKey: "title")
        studentAttendance.setValue(updated_at, forKey: "updated_at")
        studentAttendance.setValue(updated_by, forKey: "updated_by")
        studentAttendance.setValue(year_id, forKey: "year_id")
        studentAttendance.setValue(id, forKey: "id")
        
        do {
            try context?.save()
                print(" HomeWork_test Saved suucess")
            AlertController.shared.showAlert(targetVc: self, title: Globals.alertTitle, message:"Saved success", complition: {
                self.navigationController?.popViewController(animated: true)
            })
            }
        catch {
            print("error")
        }
    }
}
