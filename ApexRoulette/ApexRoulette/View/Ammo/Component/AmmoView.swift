//
//  AmmoView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/08.
//

import SwiftUI

struct AmmoView: View {
    let ammo: AmmoInfo

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    AmmoTriangle(width: geometry.size.width, height: geometry.size.height)
                        .foregroundColor(ammo.main)

                    AmmoTriangle(
                        width: geometry.size.width * 0.9,
                        height: geometry.size.height * 0.9,
                        origin: .init(x: geometry.size.width * 0.05, y: geometry.size.height * 0.03)
                    )
                    .foregroundColor(ammo.sub)

                    AmmoTriangle(
                        width: geometry.size.width * 0.6,
                        height: geometry.size.height * 0.6,
                        origin: .init(x: geometry.size.width * 0.2, y: geometry.size.height * 0.12)
                    )
                    .foregroundColor(ammo.cover)
                    .opacity(0.5)
                }
                .offset(y: geometry.size.height * 0.1)

                Text(ammo.name)
                    .font(.system(size: geometry.size.width*0.10))
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
        }
    }
}

struct AmmoView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                AmmoView(ammo: Ammo.light.info)
                    .frame(width: 100, height: 100)

                AmmoView(ammo: Ammo.heavy.info)
                    .frame(width: 100, height: 100)

                AmmoView(ammo: Ammo.shotgun.info)
                    .frame(width: 100, height: 100)

                AmmoView(ammo: Ammo.energy.info)
                    .frame(width: 100, height: 100)

                AmmoView(ammo: Ammo.sniper.info)
                    .frame(width: 100, height: 100)
            }
        }
    }
}
