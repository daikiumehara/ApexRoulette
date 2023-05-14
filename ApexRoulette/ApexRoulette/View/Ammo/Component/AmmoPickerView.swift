//
//  AmmoPickerView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/03/18.
//

import SwiftUI

struct AmmoPickerView: View {
    private let checkSize: CGFloat = 15
    private let lineWidth: CGFloat = 2
    private let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 150), spacing: 0)]

    @Binding var isPresented: Bool
    @Binding var selectedAmmo: [Ammo]

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                HStack {
                    Button {
                        selectedAmmo = Ammo.allCases
                    } label: {
                        Text(localizeString(key: .pick_all))
                            .bold()
                            .frame(maxWidth: .infinity)
                    }
                    .primaryButton()

                    Button {
                        selectedAmmo = []
                    } label: {
                        Text(localizeString(key: .pick_clear))
                            .bold()
                            .frame(maxWidth: .infinity)
                    }
                    .primaryButton()
                }
                .padding(20)

                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(Ammo.allCases) { ammo in
                        AmmoView(ammo: ammo.info)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay {
                                if selectedAmmo.contains(ammo) {
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
                                if selectedAmmo.contains(ammo) {
                                    selectedAmmo.remove(at: selectedAmmo.firstIndex(of: ammo)!)
                                } else {
                                    selectedAmmo.append(ammo)
                                }
                            }
                    }
                }
                .padding(.trailing, 10)
            }
            .navigationTitle(localizeString(key: .pick_ammo))
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

struct AmmoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        AmmoPickerView(isPresented: .constant(true), selectedAmmo: .constant(Ammo.allCases))
    }
}
