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
                HStack {
                    Button {
                        selectedChara = Character.allCases
                    } label: {
                        Text(localizeString(key: .pick_all))
                            .bold()
                            .frame(maxWidth: .infinity)
                    }
                    .primaryButton()

                    Button {
                        selectedChara = []
                    } label: {
                        Text(localizeString(key: .pick_clear))
                            .bold()
                            .frame(maxWidth: .infinity)
                    }
                    .primaryButton()
                }
                .padding(20)

                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Character.allCases) { character in
                        let isContains = selectedChara.contains(character)
                        CharacterView(character: character.info)
                            .aspectRatio(1, contentMode: .fit)
                            .background(R.color.border.primary.color.opacity(isContains ? 0.1 : 0))
                            .overlay {
                                if isContains {
                                    ZStack(alignment: .topTrailing) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(R.color.border.primary.color, lineWidth: lineWidth)
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
            .navigationTitle(localizeString(key: .character_pick))
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
                            .foregroundColor(R.color.foreground.black.color)
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
