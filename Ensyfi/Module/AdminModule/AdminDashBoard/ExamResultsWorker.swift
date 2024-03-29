//
//  ExamResultsWorker.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 02/09/21.
//

import Foundation
import UIKit

typealias ExamResultsresponseHandler = (_ response:ExamResultsModel.Fetch.Response) ->()

class ExamResultsWorker{
    
   var respData = [ExamResultsModels]()
   func fetch(class_id:String,section_id:String,dynamic_db:String, onSuccess successCallback:(ExamResultsresponseHandler)?,onFailure failureCallback: @escaping(ExamResultsresponseHandler)) {
       let manager = APIManager()
       manager.callAPIExamResults(
        class_id:class_id,section_id:section_id,dynamic_db:dynamic_db, onSuccess: { (resp)  in
               successCallback?(ExamResultsModel.Fetch.Response(testObj:resp, isError: false, message:nil))
           },
               onFailure: { (errorMessage) in
                   failureCallback(ExamResultsModel.Fetch.Response(testObj: self.respData , isError: true, message:nil))
           }
       )
    }
}
