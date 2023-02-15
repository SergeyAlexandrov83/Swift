//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Сергей Александров on 11.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        if let myView = Bundle.main.loadNibNamed("ProfileView",
                                                 owner: nil,
                                                 options: nil
        )?.first as? ProfileView {
            myView.frame = CGRect(x: 5,
                                  y: 5,
                                  width: screenWidth - 10,
                                  height: screenHeight - 10)
            view.addSubview(myView)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
