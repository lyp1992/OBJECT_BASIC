//
//  main.swift
//  方法
//
//  Created by 赖永鹏 on 2019/4/2.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Foundation

let counter = Counter()

counter.increment()
counter.incrementBy(amount:5)

print(counter.count)

counter.reset()
print(counter.count)

counter.addIncrement(firsr: 2, no2: 4)
print(counter.count)
