//
//  CharacterPickView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/13.
//

import SwiftUI

struct CharacterPickView: View {
    private let checkSize: CGFloat = 15
    private let lineWidth: CGFloat = 2
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 0)]

    @Binding var isPresented: Bool
    @Binding var selectedChara: [Character]

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Character.allCases) { character in
                        CharacterView(character: character.info)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay {
                                if selectedChara.contains(character) {
                                    ZStack(alignment: .topTrailing) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(R.color.border.primary.color, lineWidth: lineWidth)

                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: checkSize)
                                            .foregroundColor(R.color.border.primary.color)
                                            .background {
                                                Circle()
                                                    .fill(Color.white)
                                            }
                                            .offset(x: checkSize / 2, y: -checkSize / 2)
                                    }
                                } else {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(R.color.border.secondary.color, lineWidth: lineWidth)
                                }
                            }
                            .padding(.leading, 10)
                            .onTapGesture {
                                if selectedChara.contains(character) {
                                    selectedChara.remove(at: selectedChara.firstIndex(of: character)!)
                                } else {
                                    selectedChara.append(character)
                                }
                            }
                    }
                }
                .padding(.trailing, 10)
            }
            .navigationTitle(R.string.localizable.character_pick())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundColor(R.color.foreground.primary.color)
                    }
                }
            }
        }
    }
}

struct CharacterPickView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPickView(isPresented: .constant(true), selectedChara: .constant([]))
    }
}
