//
//  feedViewController.swift
//  MyFirstApp
//
//  Created by Сергей Александров on 11.02.2023.
//

import UIKit

class feedViewController: UIViewController {
    
    private var field: FieldView {
        let view = Bundle.main.loadNibNamed(
            "Field",
            owner: nil
        )?.first as! FieldView
        
        view.frame = CGRect(x: 100, y: 100, width: 150, height: 200)
        
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow
        view.addSubview(field)
        
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
