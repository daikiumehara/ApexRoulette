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
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 10)]

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

                ForEach(RoleInfo.allCases.filter({ $0 != .none })) { role in
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 8) {
                            role.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 20)

                            Text(role.text)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .foregroundColor(R.color.foreground.black.color)

                        charaGrid(Character.allCases.filter({ $0.info.role == role }))
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
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

    private func charaGrid(_ characters: [Character]) -> some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(characters) { character in
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

                    .onTapGesture {
                        if selectedChara.contains(character) {
                            selectedChara.remove(at: selectedChara.firstIndex(of: character)!)
                        } else {
                            selectedChara.append(character)
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
