//
//  DetailSettingView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/09/08.
//  Copyright © 2023 Daiki Umehara. All rights reserved.
//

import SwiftUI

enum Member: Int, CaseIterable {
    case solo = 1
    case duo = 2
    case trio = 3

    var image: Image {
        switch self {
        case .solo: return Image(systemName: "person.fill")
        case .duo: return Image(systemName: "person.2.fill")
        case .trio: return Image(systemName: "person.3.fill")
        }
    }
}

struct DetailSettingInfo: Equatable {
    var member: Member = .trio {
        didSet {
            resetCount()
        }
    }
    var scumisher: Int = 0
    var support: Int = 0
    var assault: Int = 0
    var reconnaissance: Int = 0
    var controller: Int = 0

    var countSum: Int {
        scumisher + support + assault + reconnaissance + controller
    }

    mutating func resetCount() {
        scumisher = 0
        support = 0
        assault = 0
        reconnaissance = 0
        controller = 0
    }
}

struct DetailSettingView: View {
    @Binding var isPresentedDetailSetting: Bool
    @Binding var info: DetailSettingInfo

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(localizeString(key: .pick_count))
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(R.color.foreground.black.color)

                        SelectCounter(selection: $info.member, items: Member.allCases, toImage: { item in
                            item.image
                        })
                    }
                    .padding(.bottom, 40)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(localizeString(key: .select_role))
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(R.color.foreground.black.color)

                        Text(localizeString(key: .select_role_description))
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(R.color.foreground.invalid.color)
                    }
                    .padding(.bottom, 12)

                    counters()
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle(localizeString(key: .detail_setting))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentedDetailSetting = false
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

    private func counters() -> some View {
        VStack(spacing: 30) {
            charaCounter($info.scumisher, role: .scumisher)

            charaCounter($info.support, role: .support)

            charaCounter($info.assault, role: .assault)

            charaCounter($info.reconnaissance, role: .reconnaissance)

            charaCounter($info.controller, role: .controller)
        }
    }

    private func charaCounter(_ count: Binding<Int>, role: RoleInfo) -> some View {
        HStack {
            HStack(spacing: 4) {
                role.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)

                Text(role.text)
            }
            .offset(y: 5)
            .foregroundColor(R.color.foreground.black.color)

            Spacer()

            HStack(spacing: 10) {
                Button("-") {
                    count.wrappedValue -= 1
                }
                .primaryButton(.constant(count.wrappedValue <= 0))

                Text(count.wrappedValue.description)
                    .offset(y: 5)

                Button("+") {
                    count.wrappedValue += 1
                }
                .primaryButton(.constant(info.member.rawValue <= info.countSum))
            }
        }
        .padding(.bottom, 10)
    }
}

struct DetailSettingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSettingView(isPresentedDetailSetting: .constant(true), info: .constant(.init()))
    }
}
