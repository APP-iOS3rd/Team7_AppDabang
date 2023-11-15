//
//  TestViewController.swift
//  MentoringAPI
//
//  Created by phang on 11/9/23.
//

import SwiftUI

class TestViewController: UIViewController {
    let jsonSample = """
                    {
                     "info": {
                       "size": {
                         "width": 900,
                         "height": 675
                       },
                       "faceCount": 2
                     },
                     "faces": [{
                       "celebrity": {
                         "value": "안도하루카",
                         "confidence": 0.266675
                       }
                     }, {
                       "celebrity": {
                         "value": "서효림",
                         "confidence": 0.304959
                       }
                     }]
                    }
                    """
    let jsonSample2 = """
                    {
                     "info": {
                       "size": {
                         "width": 768,
                         "height": 1280
                       },
                       "faceCount": 0
                     },
                     "faces": []
                    }
                    """

    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let data = self.jsonSample.data(using: .utf8),
            let response = try? JSONDecoder().decode(CelebrityResponse.self, from: data)
        else { return }
        print(response.faceCount)
        print(response.faces[0])
    }
}
