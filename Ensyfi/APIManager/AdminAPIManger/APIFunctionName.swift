//
//  APIFunctionName.swift
//  Ensyfi
//
//  Created by HappysanziMac on 19/08/21.
//
import Foundation
import UIKit

struct APIFunctionName {
   
    static let instituteLoginUrl = "/apimain/login/"
    static let forgotPswdUrl = "/apimain/forgot_Password/"
    static let studentClassUrl = "/apiadmin/get_all_classes/"
    static let sectionListUrl = "/apiadmin/get_all_sections/"
    static let studentsListUrl = "/apiadmin/get_all_students_in_classes/"
    static let studentsDetailsUrl = "/apiadmin/get_student_details/"
    static let HomeWorkTestListUrl = "/apistudent/disp_Homework/"
    static let classTestDetailsUrl = "/apistudent/get_classtest_details/"
    static let studentAttendanceUrl = "/apistudent/disp_Attendence/"
    static let examListUrl = "/apistudent/disp_Exams/"
    static let getParentDetailsUrl = "/apiadmin/get_parent_details/"
    static let leaveListUrl = "/apiadmin/get_teachers_leaves/"
    static let leaveApprovalUrl = "/apiadmin/update_teachers_leaves/"
//    Teachers
    static let teacherListUrl = "/apiadmin/get_all_teachers/"
    static let teacherDetailUrl = "/apiadmin/get_teacher_class_details/"
//    clasess
    static let clasForTeacherListurl = "/apiadmin/list_of_teachers_for_class/"
//    exams
    static let examsRsultsListUrl = "/apiadmin/list_of_exams_class/"
    static let examDetailsTableListUrl = "/apistudent/disp_Examdetails/"
//    Events
    static let eventsListUrl = "/apimain/disp_Events/"
    static let subEventsListUrl = "/apimain/disp_subEvents/"
//    Circulars
    static let adminCircularListUrl = "/apiadmin/get_all_circular_view/"
//    Fees
    static let feesClassListUrl = "/apiadmin/get_all_classes/"
    static let feesSectionListUrl = "/apiadmin/get_all_sections/"
    static let feesListUrl = "/apiadmin/get_fees_master_class/"
    static let feesStatusListUrl = "/apiadmin/get_fees_status/"
//    OnDuty
    static let ODstudentsListUrl = "/apiadmin/get_students_od_view/"
    static let ODteachersListUrl = "/apiadmin/get_teachers_od_view/"
    static let ODApprovalUrl = "/apiadmin/update_teachers_od/"
//    Groups
    static let groupListUrl = "/apiadmin/list_groupmaster/"
    static let techerIDnameListUrl = "/apiadmin/get_allteachersuserid/"
    static let createGroupUrl = "/apiadmin/add_groupmaster/"
    static let groupMembersListUrl = "/apiadmin/list_gn_members/"
    static let updategroupUrl = "/apiadmin/update_groupmaster/"
    static let roleListUrl = "/apiadmin/list_roles/"
    static let groupSectionUrl = "/apiadmin/list_class_section/"
    static let studentListGroupAddUrl = "/apiadmin/gn_studentlist/"
    static let staffListGroupAddUrl = "/apiadmin/gn_stafflist/"
    static let AddGroupMemberUrl = "/apiadmin/add_gn_members/"
    static let grpNotificationList = "/apimain/grp_messsage_history/"
    static let grpTitleList = "/apimain/disp_Grouplist/"
    static let sendGrpNotificationUrl = "/apiadmin/group_msg_send/"
//    Attendance
    static let classSectionListUrl = "/apimain/list_class_section/"
    static let classAttendanceListUrl = "/apimain/view_class_day_attendence/"
//    password
    static let changePasswordUrl = "/apimain/change_Password/"
    static let boardMemListUrl = "/apiadmin/get_all_board_members/"
    
    static let studentExamReslutListUrl = "/apistudent/disp_Exams/"
    static let adminSpecialClassListUrl = "/apiadmin/get_special_list/"
}


