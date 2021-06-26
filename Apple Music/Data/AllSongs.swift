//
//  AllSongs.swift
//  Apple Music
//
//  Created by Runhua Huang on 2021/6/26.
//

import SwiftUI
import Combine

/**
 *  @class SongStore
 *   用户点击指定的歌词时触发的变量修改
 */
class SongStore: ObservableObject {
    @Published var allSongs: [Song] = songs
    @Published var isListChanged: Bool = false
    @Published var noBlurCellIndex: Int = 1
    @Published var currentTime: Int = 0
}

/**
 *  @class PlayStore
 *   歌词自动滚动时触发的变量修改
 */
class PlayStore: ObservableObject {
    @Published var allSongs: [Song] = songs
    @Published var isListChanged: Bool = false
    @Published var noBlurCellIndex: Int = 1
    @Published var currentPlayTime: Double = 0
}


var songs = [
        Song(name: "起风了", singer: "@你爱了夏天", cover: "起风了", lyrics: [
            Lyric(lyric: "一阵微风塑起记忆", isBlur: false, time: 27),
            Lyric(lyric: "吹过森林萤火的痕迹", isBlur: false, time: 31),
            Lyric(lyric: "禁书目录上铭刻着", isBlur: false, time: 34),
            Lyric(lyric: "魔法的气息", isBlur: false, time: 37),
            Lyric(lyric: "不禁笑这异世之旅", isBlur: false, time: 40),
            Lyric(lyric: "又从零开始", isBlur: false, time: 44),
            Lyric(lyric: "而她的哭泣 泪中的花意 至今仍未知", isBlur: false, time: 45),
            Lyric(lyric: "我曾握紧刀与剑", isBlur: false, time: 51),
            Lyric(lyric: "神域之前", isBlur: false, time: 54),
            Lyric(lyric: "灭鬼之刃扬起烈焰", isBlur: false, time: 56),
            Lyric(lyric: "也头戴王冠一人将罪恶书写", isBlur: false, time: 58),
            Lyric(lyric: "徘徊彼方的境界", isBlur: false, time: 63),
            Lyric(lyric: "追寻千遍", isBlur: false, time: 66),
            Lyric(lyric: "菓实冰冷浸透齿间", isBlur: false, time: 68),
            Lyric(lyric: "命运之门依然视而不见", isBlur: false, time: 71),
            Lyric(lyric: "手中魔刀碎裂了无牵挂", isBlur: false, time: 76),
            Lyric(lyric: "赤色染过双眼无话", isBlur: false, time: 81),
            Lyric(lyric: "一人之下 刀锋血洒 彼岸生花", isBlur: false, time: 84),
            Lyric(lyric: "感受夏风炽热焦灼嘶哑", isBlur: false, time: 89),
            Lyric(lyric: "漫天蝶舞吻过伤疤", isBlur: false, time: 93),
            Lyric(lyric: "祈愿让风 吹起满地樱花", isBlur: false, time: 96),
            Lyric(lyric: "而风只留下 记忆中的她", isBlur: false, time: 102),
            Lyric(lyric: "窗外的雨淅淅沥沥", isBlur: false, time: 118),
            Lyric(lyric: "不知何时放晴的天气", isBlur: false, time: 121),
            Lyric(lyric: "拨动心跳的是天使", isBlur: false, time: 124),
            Lyric(lyric: "还是段故事", isBlur: false, time: 128),
            Lyric(lyric: "翻开白色相簿回忆", isBlur: false, time: 131),
            Lyric(lyric: "告白的秘密", isBlur: false, time: 134),
            Lyric(lyric: "将你的名字 写在手心里", isBlur: false, time: 136),
            Lyric(lyric: "好想告诉你", isBlur: false, time: 139),
            Lyric(lyric: "歌剧奏响的瞬间", isBlur: false, time: 141),
            Lyric(lyric: "轻音悠远", isBlur: false, time: 144),
            Lyric(lyric: "犹如蔷薇端庄高洁", isBlur: false, time: 146),
            Lyric(lyric: "看落花舞动抚过了少女指尖", isBlur: false, time: 149),
            Lyric(lyric: "数着庭中树与叶", isBlur: false, time: 154),
            Lyric(lyric: "游戏人间", isBlur: false, time: 157),
            Lyric(lyric: "等待天使降临身边", isBlur: false, time: 158),
            Lyric(lyric: "四月的风却带来了谎言", isBlur: false, time: 162),
            Lyric(lyric: "听着大雨将顷春风渡夏", isBlur: false, time: 167),
            Lyric(lyric: "一声惊雷划过天涯", isBlur: false, time: 171),
            Lyric(lyric: "想起与他 泪尽繁花 一世情话", isBlur: false, time: 174),
            Lyric(lyric: "听着时间流逝钟声滴答", isBlur: false, time: 180),
            Lyric(lyric: "落泪点缀永恒之花", isBlur: false, time: 183),
            Lyric(lyric: "问向天空 为何缘分尽纳", isBlur: false, time: 187),
            Lyric(lyric: "听着阴霾散去阳光尽洒", isBlur: false, time: 192),
            Lyric(lyric: "抚着那日留下的画", isBlur: false, time: 196),
            Lyric(lyric: "画中与他 苦情树下 几世情话", isBlur: false, time: 199),
            Lyric(lyric: "听着月色将近美如轻纱", isBlur: false, time: 205),
            Lyric(lyric: "誓约已然无从应答", isBlur: false, time: 208),
            Lyric(lyric: "问着星空 为何梦境崩塌", isBlur: false, time: 212),
            Lyric(lyric: "听着蔽日扬尘无尽风沙", isBlur: false, time: 217),
            Lyric(lyric: "侵蚀了她手中的画", isBlur: false, time: 221),
            Lyric(lyric: "少女的爱 终将埋葬 地狱之下", isBlur: false, time: 224),
            Lyric(lyric: "她终将一生献给了他", isBlur: false, time: 228),
            Lyric(lyric: "未来已将日记都写下", isBlur: false, time: 233),
            Lyric(lyric: "心之所动 就随风飞吧", isBlur: false, time: 237),
            Lyric(lyric: "以爱之名 你还哭泣吗", isBlur: false, time: 242),
        ])
]

