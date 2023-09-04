//
//  SelectCounter.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/03/04.
//

import SwiftUI

struct SelectCounter<T: Hashable>: View {
    @Binding var selection: T
    let items: [T]
    let toImage: (T) -> Image

    var body: some View {
        Picker("", selection: $selection) {
            ForEach(items, id: \.hashValue) { item in
                toImage(item)
                    .tag(item)
            }
        }
        .pickerStyle(.segmented)
        .onAppear {
            let appearance = UISegmentedControl.appearance()
            appearance.setTitleTextAttributes([.foregroundColor: R.color.foreground.secondary()!], for: .selected)
            appearance.setTitleTextAttributes([.foregroundColor: R.color.foreground.secondary()!], for: .normal)
            appearance.backgroundColor = R.color.foreground.black()
            appearance.selectedSegmentTintColor = R.color.foreground.primary()
        }
    }
}

struct SelectCounter_Previews: PreviewProvider {
    static var previews: some View {
        SelectCounter(selection: .constant(.duo), items: Member.allCases, toImage: { item in
            item.image
        })
            .frame(width: 200)
    }
}
