//
//  TodoModel.swift
//  todo
//
//  Created by Hongyan Zhou S2972126 on 10/5/18.
//  Copyright © 2018年 griffith.edu.au. All rights reserved.
//

import Foundation

class TodoModel:NSObject{
    var id:String
    var title:String
    
    init(id:String,title:String){
        self.id = id
        self.title = title
    }
}
