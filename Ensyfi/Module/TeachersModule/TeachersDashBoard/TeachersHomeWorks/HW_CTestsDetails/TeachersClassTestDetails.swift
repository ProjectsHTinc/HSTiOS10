//
//  TeachersClassTestDetails.swift
//  EnsyfiApp
//
//  Created by HappysanziMac on 26/10/21.
//

import UIKit

class TeachersClassTestDetails: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var topicLbl: UILabel!
    @IBOutlet weak var testDate: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var selectedHwId = String()
    var selectedTopic = String()
    var selectedTitle = String()
    var selectedDate = String()
    var selectedDescription = String()
    var selectedClassId = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bgView.dropShadow()
        self.titleLbl.text = self.selectedTitle
        self.topicLbl.text = self.selectedTopic
        self.testDate.text = self.selectedDate
        self.descriptionLbl.text = self.selectedDescription
    }
    
    @IBAction func AddClassTestMark(_ sender: Any) {
        self.performSegue(withIdentifier: "to_AddClasstestMark", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "to_AddClasstestMark")
        {
        let vc = segue.destination as! AddClassTestMarkVC
            vc.selectedClassId = self.selectedClassId
//            vc.selectedTitle = self.selectedTitle
            vc.selectedDate = self.selectedDate
            vc.selectedHwId = self.selectedHwId
//            vc.selectedDescription = self.selectedDescription
        }
    }
}
