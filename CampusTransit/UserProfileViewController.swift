//
//  UserProfileViewController.swift
//  CampusTransit
//
//  Created by Victoria Leaf on 11/19/17.
//  Copyright © 2017 Victoria Leaf. All rights reserved.
//

import UIKit
import Firebase


class UserProfileViewController: UIViewController {
    @IBOutlet weak var UpEmail: UITextField!
    @IBOutlet weak var UpPassword: UITextField!
    @IBAction func SaveChanges(_ sender: Any) {
        let email = UpEmail.text
        let user = Auth.auth().currentUser
        let password = UpPassword.text
        user?.updateEmail(to: email!) {
            error in
            if let error = error {
                //error occurred
            }
            else {
                //account updated
            }
        }
        user?.updatePassword(to: password!) { error in
            if let error = error {
                //error occurred
            }
            else {
                //account updated
            }
        }
    }

    @IBAction func SignOut(_ sender: Any) {
        try! Auth.auth().signOut()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
