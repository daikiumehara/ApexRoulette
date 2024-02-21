//
//  CharacterView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/08.
//

import SwiftUI

struct CharacterView: View {
    var character: CharacterInfo
    var isDisplayRole: Bool = false

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image(uiImage: character.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text(character.name)
                    .font(.system(size: geometry.size.width*0.10))
                    .bold()
                    .foregroundColor(R.color.foreground.black.color)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)

                if isDisplayRole {
                    HStack(spacing: 2) {
                        character.role.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width * 0.08, height: geometry.size.width * 0.08)

                        Text(character.role.text)
                            .font(.system(size: geometry.size.width*0.08))
                            .bold()
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                    .foregroundColor(R.color.foreground.invalid.color)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static let size: CGFloat = 200
    static let characters: [CharacterInfo] = Character.allCases.map { $0.info }
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(characters) { chara in
                    CharacterView(character: chara)
                        .frame(width: size, height: size)
                }
            }
            .padding(.horizontal)
        }
    }
}
