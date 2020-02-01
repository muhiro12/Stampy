//
//  ViewExtension.swift
//  Stampy
//
//  Created by Hiromu Nakano on 2020/02/01.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

extension View {
    static var spaceS: CGFloat {
        return 20
    }

    static var spaceM: CGFloat {
        return 50
    }

    static var spaceL: CGFloat {
        return 100
    }

    func roundedCorners(color: Color = .blue) -> some View {
        let width: CGFloat = 200
        let height: CGFloat = 40
        let foregroundColor: Color = .white
        return frame(width: width, height: height)
            .foregroundColor(foregroundColor)
            .background(color)
            .cornerRadius(width/2)
    }
}
