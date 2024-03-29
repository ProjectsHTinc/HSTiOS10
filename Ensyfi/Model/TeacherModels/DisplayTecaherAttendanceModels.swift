//
//  DisplayTecaherAttendanceModels.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 11/10/21.
//

import Foundation

class DisplayAttenddanceListModels : NSObject {

       var ac_year : String?
       var at_id : String?
       var attendence_period : String?
       var class_id : String?
       var class_total : String?
       var created_at : String?
       var created_by : String?
       var name : String?
       var no_of_absent : String?
       var no_of_present : String?
       var sent_status : String?
       var status : String?
       var updated_at : String?
       var updated_by : String?
 
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
       {
        if let data = dict["ac_year"] as? String {
          self.ac_year = data
        }
        if let data = dict["at_id"] as? String {
          self.at_id = data
        }
        if let data = dict["attendence_period"] as? String {
          self.attendence_period = data
        }
        if let data = dict["class_id"] as? String {
          self.class_id = data
        }
        if let data = dict["class_total"] as? String {
          self.class_total = data
        }
        if let data = dict["created_at"] as? String {
          self.created_at = data
        }
        if let data = dict["created_by"] as? String {
          self.created_by = data
        }
        if let data = dict["name"] as? String {
          self.name = data
        }
        if let data = dict["no_of_absent"] as? String {
          self.no_of_absent = data
        }
        if let data = dict["no_of_present"] as? String {
          self.no_of_present = data
        }
        if let data = dict["sent_status"] as? String {
          self.sent_status = data
        }
        if let data = dict["status"] as? String {
          self.status = data
        }
        if let data = dict["updated_at"] as? String {
          self.updated_at = data
        }
        if let data = dict["updated_by"] as? String {
          self.updated_by = data
       }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> DisplayAttenddanceListModels{
    
       let model = DisplayAttenddanceListModels()
       model.loadFromDictionary(dict)
       return model
   }
}


class AttendanceRecordListModels : NSObject {
    
       var sex : String?
       var a_status : String?
       var enroll_id : String?
       var admission_id : String?
       var name : String?
       
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
        {
        if let data = dict["sex"] as? String {
          self.sex = data
        }
        if let data = dict["a_status"] as? String {
          self.a_status = data
        }
        if let data = dict["enroll_id"] as? String {
          self.enroll_id = data
        }
        if let data = dict["admission_id"] as? String {
          self.admission_id = data
        }
        if let data = dict["name"] as? String {
          self.name = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> AttendanceRecordListModels{
    
       let model = AttendanceRecordListModels()
       model.loadFromDictionary(dict)
       return model
   }
}


class SendAttendanceModels {

    var status : String?
    var msg: String?

// MARK: Instance Method
    func loadFromDictionary(_ dict: [String: AnyObject])
     {
       if let data = dict["status"] as? String {
       self.status = data
     }
       if let data = dict["msg"] as? String {
       self.msg = data
     }
   }
}

class DayMonthAttendanceListModels : NSObject {

       var enroll_id : String?
       var sec_name : String?
       var at_id : String?
       var a_status : String?
       var count : String?
       var class_id : String?
       var abs_date : String?
       var name : String?
       var class_name : String?
       var attend_period : String?
 
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
       {
        if let data = dict["enroll_id"] as? String {
          self.enroll_id = data
        }
        if let data = dict["sec_name"] as? String {
          self.sec_name = data
        }
        if let data = dict["at_id"] as? String {
          self.at_id = data
        }
        if let data = dict["a_status"] as? String {
          self.a_status = data
        }
        if let data = dict["count"] as? String {
          self.count = data
        }
        if let data = dict["class_id"] as? String {
          self.class_id = data
        }
        if let data = dict["abs_date"] as? String {
          self.abs_date = data
        }
        if let data = dict["name"] as? String {
          self.name = data
        }
        if let data = dict["class_name"] as? String {
          self.class_name = data
        }
        if let data = dict["attend_period"] as? String {
          self.attend_period = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> DayMonthAttendanceListModels{
    
       let model = DayMonthAttendanceListModels()
       model.loadFromDictionary(dict)
       return model
   }
}

//"abs_date" : "",
//"enroll_id" : "2",
//"sec_name" : "A",
//"a_status" : "P",
//"" : "",
//"class_name" : "XII",
//"class_id" : "1",
//"at_id" : "",
//"leaves" : "1",
//"name" : "maran"
class MonthAttendanceListModels : NSObject {

       var abs_date : String?
       var enroll_id : String?
       var sec_name : String?
       var a_status : String?
       var attend_period : String?
       var class_name : String?
       var class_id : String?
       var at_id : String?
       var leaves : String?
       var name : String?
 
     // MARK: Instance Method
   func loadFromDictionary(_ dict: [String: AnyObject])
       {
        if let data = dict["abs_date"] as? String {
          self.abs_date = data
        }
        if let data = dict["enroll_id"] as? String {
          self.enroll_id = data
        }
        if let data = dict["sec_name"] as? String {
          self.sec_name = data
        }
        if let data = dict["a_status"] as? String {
          self.a_status = data
        }
        if let data = dict["attend_period"] as? String {
          self.attend_period = data
        }
        if let data = dict["class_name"] as? String {
          self.class_name = data
        }
        if let data = dict["class_id"] as? String {
          self.class_id = data
        }
        if let data = dict["at_id"] as? String {
          self.at_id = data
        }
        if let data = dict["leaves"] as? String {
          self.leaves = data
        }
        if let data = dict["name"] as? String {
          self.name = data
        }
   }
    
      // MARK: Class Method
class func build(_ dict: [String: AnyObject]) -> MonthAttendanceListModels{
    
       let model = MonthAttendanceListModels()
       model.loadFromDictionary(dict)
       return model
   }
}
