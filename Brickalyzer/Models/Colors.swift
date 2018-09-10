//
//  Colors.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 9/9/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation

enum LegoColor {
    case white, veryLightGray, veryLightBluishGray, lightBluishGray, lightGray, darkGray, darkBluishGray, black, darkRed, red, rust, salmon, lightSalmon, sandRed, reddishBrown, brown, darkBrown, darkTan, tan, lightFlesh, flesh, mediumDarkFlesh, darkFlesh, fabulandBrown, fabulandOrange, earthOrange, darkOrange, neonOrange, orange, mediumOrange, brightLightOrange, lightOrange, veryLightOrange, darkYellow, yellow, brightLightYellow, lightYellow, lightLime, yellowishGreen, neonGreen, mediumLime, lime, oliveGreen, darkGreen, green, brightGreen, mediumGreen, lightGreen, sandGreen, darkTurquoise, lightTurquoise, aqua, lightAqua, darkBlue, blue, darkAzure, mediumAzure, mediumBlue, maerskBlue, brightLightBlue, lightBlue, skyBlue, sandBlue, blueViolet, darkBlueViolet, violet, mediumViolet, lightViolet, darkPurple, purple, lightPurple, mediumLavender, lavender, sandPurple, magenta, darkPink, mediumDarkPink, brightPink, pink, lightPink, transClear, transBlack, transRed, transNeonOrange, transOrange, transLightOrange, transNeonYellow, transYellow, transNeonGreen, transBrightGreen, transGreen, transDarkBlue, transMediumBlue, transLightBlue, transVeryLtBlue, transLightPurple, transPurple, transDarkPink, transPink, chromeGold, chromeSilver, chromeAntiqueBrass, chromeBlack, chromeBlue, chromeGreen, chromePink, pearlWhite, pearlVeryLightGray, pearlLightGray, flatSilver, pearlDarkGray, metalBlue, pearlLightGold, pearlGold, flatDarkGold, copper, metallicSilver, metallicGreen, metallicGold, milkyWhite, glowInDarkWhite, glowInDarkOpaque, glowInDarkTrans, glitterTransClear, glitterTransNeonGreen, glitterTransLightBlue, glitterTransPurple, glitterTransDarkPink, speckleBlackSilver, speckleBlackGold, speckleBlackCopper, speckleDBGraySilver, other
    
    var bricklinkID: Int {
        switch(self) {
        case .speckleDBGraySilver: return 117
        case .speckleBlackCopper: return 116
        case .speckleBlackGold: return 151
        case .speckleBlackSilver: return 111
        case .glitterTransDarkPink: return 100
        case .glitterTransPurple: return 102
        case .glitterTransLightBlue: return 162
        case .glitterTransNeonGreen: return 163
        case .glitterTransClear: return 101
        case .glowInDarkTrans: return 118
        case .glowInDarkOpaque: return 46
        case .glowInDarkWhite: return 159
        case .milkyWhite: return 60
        case .metallicGold: return 65
        case .metallicGreen: return 70
        case .metallicSilver: return 67
        case .copper: return 84
        case .flatDarkGold: return 81
        case .pearlGold: return 115
        case .pearlLightGold: return 61
        case .metalBlue: return 78
        case .pearlDarkGray: return 77
        case .flatSilver: return 95
        case .pearlLightGray: return 66
        case .pearlVeryLightGray: return 119
        case .pearlWhite: return 83
        case .chromePink: return 82
        case .chromeGreen: return 64
        case .chromeBlue: return 52
        case .chromeBlack: return 122
        case .chromeAntiqueBrass: return 57
        case .chromeSilver: return 22
        case .chromeGold: return 21
        case .transPink: return 107
        case .transDarkPink: return 50
        case .transPurple: return 51
        case .transLightPurple: return 114
        case .transVeryLtBlue: return 113
        case .transLightBlue: return 15
        case .transMediumBlue: return 74
        case .transDarkBlue: return 14
        case .transGreen: return 20
        case .transBrightGreen: return 108
        case .transNeonGreen: return 16
        case .transYellow: return 19
        case .transNeonYellow: return 121
        case .transLightOrange: return 164
        case .transOrange: return 98
        case .transNeonOrange: return 18
        case .transRed: return 17
        case .transBlack: return 13
        case .transClear: return 12
        case .lightPink: return 56
        case .pink: return 23
        case .brightPink: return 104
        case .mediumDarkPink: return 94
        case .darkPink: return 47
        case .magenta: return 71
        case .sandPurple: return 54
        case .lavender: return 154
        case .mediumLavender: return 157
        case .lightPurple: return 93
        case .purple: return 24
        case .darkPurple: return 89
        case .lightViolet: return 44
        case .mediumViolet: return 73
        case .violet: return 43
        case .darkBlueViolet: return 109
        case .blueViolet: return 97
        case .sandBlue: return 55
        case .skyBlue: return 87
        case .lightBlue: return 62
        case .brightLightBlue: return 105
        case .maerskBlue: return 72
        case .mediumBlue: return 42
        case .mediumAzure: return 156
        case .darkAzure: return 153
        case .blue: return 7
        case .darkBlue: return 63
        case .lightAqua: return 152
        case .aqua: return 41
        case .lightTurquoise: return 40
        case .darkTurquoise: return 39
        case .sandGreen: return 48
        case .lightGreen: return 38
        case .mediumGreen: return 37
        case .brightGreen: return 36
        case .green: return 6
        case .darkGreen: return 80
        case .oliveGreen: return 155
        case .lime: return 34
        case .mediumLime: return 76
        case .neonGreen: return 166
        case .yellowishGreen: return 158
        case .lightLime: return 35
        case .lightYellow: return 33
        case .brightLightYellow: return 103
        case .yellow: return 3
        case .darkYellow: return 161
        case .veryLightOrange: return 96
        case .lightOrange: return 32
        case .brightLightOrange: return 110
        case .mediumOrange: return 31
        case .orange: return 4
        case .neonOrange: return 165
        case .darkOrange: return 68
        case .earthOrange: return 29
        case .fabulandOrange: return 160
        case .fabulandBrown: return 106
        case .darkFlesh: return 91
        case .mediumDarkFlesh: return 150
        case .flesh: return 28
        case .lightFlesh: return 90
        case .tan: return 2
        case .darkTan: return 69
        case .darkBrown: return 120
        case .brown: return 8
        case .reddishBrown: return 88
        case .sandRed: return 58
        case .lightSalmon: return 26
        case .salmon: return 25
        case .rust: return 27
        case .red: return 5
        case .darkRed: return 59
        case .black: return 11
        case .darkBluishGray: return 85
        case .darkGray: return 10
        case .lightGray: return 9
        case .lightBluishGray: return 86
        case .veryLightBluishGray: return 99
        case .veryLightGray: return 49
        case .white: return 1
        case .other: return 0
        }
    }
    
    var name: String {
        switch(self) {
        case .speckleDBGraySilver: return "Speckle DBGray-Silver"
        case .speckleBlackCopper: return "Speckle Black-Copper"
        case .speckleBlackGold: return "Speckle Black-Gold"
        case .speckleBlackSilver: return "Speckle Black-Silver"
        case .glitterTransDarkPink: return "Glitter Trans-Dark Pink"
        case .glitterTransPurple: return "Glitter Trans-Purple"
        case .glitterTransLightBlue: return "Glitter Trans-Light Blue"
        case .glitterTransNeonGreen: return "Glitter Trans-Neon Green"
        case .glitterTransClear: return "Glitter Trans-Clear"
        case .glowInDarkTrans: return "Glow In Dark Trans"
        case .glowInDarkOpaque: return "Glow In Dark Opaque"
        case .glowInDarkWhite: return "Glow In Dark White"
        case .milkyWhite: return "Milky White"
        case .metallicGold: return "Metallic Gold"
        case .metallicGreen: return "Metallic Green"
        case .metallicSilver: return "Metallic Silver"
        case .copper: return "Copper"
        case .flatDarkGold: return "Flat Dark Gold"
        case .pearlGold: return "Pearl Gold"
        case .pearlLightGold: return "Pearl Light Gold"
        case .metalBlue: return "Metal Blue"
        case .pearlDarkGray: return "Pearl Dark Gray"
        case .flatSilver: return "Flat Silver"
        case .pearlLightGray: return "Pearl Light Gray"
        case .pearlVeryLightGray: return "Pearl Very Light Gray"
        case .pearlWhite: return "Pearl White"
        case .chromePink: return "Chrome Pink"
        case .chromeGreen: return "Chrome Green"
        case .chromeBlue: return "Chrome Blue"
        case .chromeBlack: return "Chrome Black"
        case .chromeAntiqueBrass: return "Chrome Antique Brass"
        case .chromeSilver: return "Chrome Silver"
        case .chromeGold: return "Chrome Gold"
        case .transPink: return "Trans-Pink"
        case .transDarkPink: return "Trans-Dark Pink"
        case .transPurple: return "Trans-Purple"
        case .transLightPurple: return "Trans-Light Purple"
        case .transVeryLtBlue: return "Trans-Very Lt Blue"
        case .transLightBlue: return "Trans-Light Blue"
        case .transMediumBlue: return "Trans-Medium Blue"
        case .transDarkBlue: return "Trans-Dark Blue"
        case .transGreen: return "Trans-Green"
        case .transBrightGreen: return "Trans-Bright Green"
        case .transNeonGreen: return "Trans-Neon Green"
        case .transYellow: return "Trans-Yellow"
        case .transNeonYellow: return "Trans-Neon Yellow"
        case .transLightOrange: return "Trans-Light Orange"
        case .transOrange: return "Trans-Orange"
        case .transNeonOrange: return "Trans-Neon Orange"
        case .transRed: return "Trans-Red"
        case .transBlack: return "Trans-Black"
        case .transClear: return "Trans-Clear"
        case .lightPink: return "Light Pink"
        case .pink: return "Pink"
        case .brightPink: return "Bright Pink"
        case .mediumDarkPink: return "Medium Dark Pink"
        case .darkPink: return "Dark Pink"
        case .magenta: return "Magenta"
        case .sandPurple: return "Sand Purple"
        case .lavender: return "Lavender"
        case .mediumLavender: return "Medium Lavender"
        case .lightPurple: return "Light Purple"
        case .purple: return "Purple"
        case .darkPurple: return "Dark Purple"
        case .lightViolet: return "Light Violet"
        case .mediumViolet: return "Medium Violet"
        case .violet: return "Violet"
        case .darkBlueViolet: return "Dark Blue-Violet"
        case .blueViolet: return "Blue-Violet"
        case .sandBlue: return "Sand Blue"
        case .skyBlue: return "Sky Blue"
        case .lightBlue: return "Light Blue"
        case .brightLightBlue: return "Bright Light Blue"
        case .maerskBlue: return "Maersk Blue"
        case .mediumBlue: return "Medium Blue"
        case .mediumAzure: return "Medium Azure"
        case .darkAzure: return "Dark Azure"
        case .blue: return "Blue"
        case .darkBlue: return "Dark Blue"
        case .lightAqua: return "Light Aqua"
        case .aqua: return "Aqua"
        case .lightTurquoise: return "Light Turquoise"
        case .darkTurquoise: return "Dark Turquoise"
        case .sandGreen: return "Sand Green"
        case .lightGreen: return "Light Green"
        case .mediumGreen: return "Medium Green"
        case .brightGreen: return "Bright Green"
        case .green: return "Green"
        case .darkGreen: return "Dark Green"
        case .oliveGreen: return "Olive Green"
        case .lime: return "Lime"
        case .mediumLime: return "Medium Lime"
        case .neonGreen: return "Neon Green"
        case .yellowishGreen: return "Yellowish Green"
        case .lightLime: return "Light Lime"
        case .lightYellow: return "Light Yellow"
        case .brightLightYellow: return "Bright Light Yellow"
        case .yellow: return "Yellow"
        case .darkYellow: return "Dark Yellow"
        case .veryLightOrange: return "Very Light Orange"
        case .lightOrange: return "Light Orange"
        case .brightLightOrange: return "Bright Light Orange"
        case .mediumOrange: return "Medium Orange"
        case .orange: return "Orange"
        case .neonOrange: return "Neon Orange"
        case .darkOrange: return "Dark Orange"
        case .earthOrange: return "Earth Orange"
        case .fabulandOrange: return "Fabuland Orange"
        case .fabulandBrown: return "Fabuland Brown"
        case .darkFlesh: return "Dark Flesh"
        case .mediumDarkFlesh: return "Medium Dark Flesh"
        case .flesh: return "Flesh"
        case .lightFlesh: return "Light Flesh"
        case .tan: return "Tan"
        case .darkTan: return "Dark Tan"
        case .darkBrown: return "Dark Brown"
        case .brown: return "Brown"
        case .reddishBrown: return "Reddish Brown"
        case .sandRed: return "Sand Red"
        case .lightSalmon: return "Light Salmon"
        case .salmon: return "Salmon"
        case .rust: return "Rust"
        case .red: return "Red"
        case .darkRed: return "Dark Red"
        case .black: return "Black"
        case .darkBluishGray: return "Dark Bluish Gray"
        case .darkGray: return "Dark Gray"
        case .lightGray: return "Light Gray"
        case .lightBluishGray: return "Light Bluish Gray"
        case .veryLightBluishGray: return "Very Light Bluish Gray"
        case .veryLightGray: return "Very Light Gray"
        case .white: return "White"
        case .other: return "Other"
        }
    }
    
    var numParts: Int {
        switch(self) {
        case .speckleDBGraySilver: return 5
        case .speckleBlackCopper: return 5
        case .speckleBlackGold: return 2
        case .speckleBlackSilver: return 15
        case .glitterTransDarkPink: return 11
        case .glitterTransPurple: return 7
        case .glitterTransLightBlue: return 7
        case .glitterTransNeonGreen: return 1
        case .glitterTransClear: return 14
        case .glowInDarkTrans: return 14
        case .glowInDarkOpaque: return 39
        case .glowInDarkWhite: return 29
        case .milkyWhite: return 27
        case .metallicGold: return 58
        case .metallicGreen: return 19
        case .metallicSilver: return 158
        case .copper: return 42
        case .flatDarkGold: return 33
        case .pearlGold: return 667
        case .pearlLightGold: return 16
        case .metalBlue: return 32
        case .pearlDarkGray: return 455
        case .flatSilver: return 754
        case .pearlLightGray: return 417
        case .pearlVeryLightGray: return 6
        case .pearlWhite: return 4
        case .chromePink: return 10
        case .chromeGreen: return 1
        case .chromeBlue: return 10
        case .chromeBlack: return 11
        case .chromeAntiqueBrass: return 3
        case .chromeSilver: return 102
        case .chromeGold: return 51
        case .transPink: return 48
        case .transDarkPink: return 175
        case .transPurple: return 123
        case .transLightPurple: return 10
        case .transVeryLtBlue: return 26
        case .transLightBlue: return 562
        case .transMediumBlue: return 95
        case .transDarkBlue: return 243
        case .transGreen: return 137
        case .transBrightGreen: return 155
        case .transNeonGreen: return 177
        case .transYellow: return 189
        case .transNeonYellow: return 18
        case .transLightOrange: return 44
        case .transOrange: return 153
        case .transNeonOrange: return 186
        case .transRed: return 184
        case .transBlack: return 360
        case .transClear: return 714
        case .lightPink: return 6
        case .pink: return 126
        case .brightPink: return 357
        case .mediumDarkPink: return 14
        case .darkPink: return 493
        case .magenta: return 324
        case .sandPurple: return 20
        case .lavender: return 150
        case .mediumLavender: return 303
        case .lightPurple: return 22
        case .purple: return 137
        case .darkPurple: return 632
        case .lightViolet: return 64
        case .mediumViolet: return 24
        case .violet: return 77
        case .darkBlueViolet: return 7
        case .blueViolet: return 37
        case .sandBlue: return 483
        case .skyBlue: return 28
        case .lightBlue: return 48
        case .brightLightBlue: return 229
        case .maerskBlue: return 84
        case .mediumBlue: return 699
        case .mediumAzure: return 398
        case .darkAzure: return 356
        case .blue: return 3228
        case .darkBlue: return 1415
        case .lightAqua: return 199
        case .aqua: return 86
        case .lightTurquoise: return 39
        case .darkTurquoise: return 188
        case .sandGreen: return 420
        case .lightGreen: return 66
        case .mediumGreen: return 118
        case .brightGreen: return 422
        case .green: return 1662
        case .darkGreen: return 672
        case .oliveGreen: return 375
        case .lime: return 1217
        case .mediumLime: return 63
        case .neonGreen: return 82
        case .yellowishGreen: return 90
        case .lightLime: return 18
        case .lightYellow: return 97
        case .brightLightYellow: return 180
        case .yellow: return 5297
        case .darkYellow: return 3
        case .veryLightOrange: return 1
        case .lightOrange: return 17
        case .brightLightOrange: return 678
        case .mediumOrange: return 138
        case .orange: return 1439
        case .neonOrange: return 127
        case .darkOrange: return 504
        case .earthOrange: return 36
        case .fabulandOrange: return 1
        case .fabulandBrown: return 8
        case .darkFlesh: return 40
        case .mediumDarkFlesh: return 504
        case .flesh: return 95
        case .lightFlesh: return 1057
        case .tan: return 1582
        case .darkTan: return 729
        case .darkBrown: return 534
        case .brown: return 561
        case .reddishBrown: return 1375
        case .sandRed: return 39
        case .lightSalmon: return 51
        case .salmon: return 83
        case .rust: return 10
        case .red: return 5795
        case .darkRed: return 1192
        case .black: return 8287
        case .darkBluishGray: return 2720
        case .darkGray: return 1017
        case .lightGray: return 1797
        case .lightBluishGray: return 3031
        case .veryLightBluishGray: return 51
        case .veryLightGray: return 21
        case .white: return 10185
        case .other: return 0
        }
    }
    
    var numSets: Int {
        switch(self) {
        case .speckleDBGraySilver: return 7
        case .speckleBlackCopper: return 3
        case .speckleBlackGold: return 4
        case .speckleBlackSilver: return 46
        case .glitterTransDarkPink: return 31
        case .glitterTransPurple: return 23
        case .glitterTransLightBlue: return 9
        case .glitterTransNeonGreen: return 8
        case .glitterTransClear: return 21
        case .glowInDarkTrans: return 21
        case .glowInDarkOpaque: return 85
        case .glowInDarkWhite: return 49
        case .milkyWhite: return 129
        case .metallicGold: return 171
        case .metallicGreen: return 5
        case .metallicSilver: return 508
        case .copper: return 62
        case .flatDarkGold: return 41
        case .pearlGold: return 1283
        case .pearlLightGold: return 9
        case .metalBlue: return 19
        case .pearlDarkGray: return 703
        case .flatSilver: return 1860
        case .pearlLightGray: return 612
        case .pearlVeryLightGray: return 7
        case .pearlWhite: return 6
        case .chromePink: return 23
        case .chromeGreen: return 2
        case .chromeBlue: return 18
        case .chromeBlack: return 1
        case .chromeAntiqueBrass: return 15
        case .chromeSilver: return 580
        case .chromeGold: return 257
        case .transPink: return 30
        case .transDarkPink: return 433
        case .transPurple: return 245
        case .transLightPurple: return 11
        case .transVeryLtBlue: return 25
        case .transLightBlue: return 1994
        case .transMediumBlue: return 194
        case .transDarkBlue: return 1400
        case .transGreen: return 1212
        case .transBrightGreen: return 324
        case .transNeonGreen: return 976
        case .transYellow: return 1974
        case .transNeonYellow: return 22
        case .transLightOrange: return 19
        case .transOrange: return 1256
        case .transNeonOrange: return 954
        case .transRed: return 2993
        case .transBlack: return 1352
        case .transClear: return 3763
        case .lightPink: return 13
        case .pink: return 88
        case .brightPink: return 593
        case .mediumDarkPink: return 7
        case .darkPink: return 689
        case .magenta: return 444
        case .sandPurple: return 5
        case .lavender: return 192
        case .mediumLavender: return 309
        case .lightPurple: return 11
        case .purple: return 133
        case .darkPurple: return 654
        case .lightViolet: return 39
        case .mediumViolet: return 27
        case .violet: return 43
        case .darkBlueViolet: return 5
        case .blueViolet: return 17
        case .sandBlue: return 364
        case .skyBlue: return 16
        case .lightBlue: return 46
        case .brightLightBlue: return 262
        case .maerskBlue: return 14
        case .mediumBlue: return 872
        case .mediumAzure: return 614
        case .darkAzure: return 334
        case .blue: return 6688
        case .darkBlue: return 1304
        case .lightAqua: return 168
        case .aqua: return 52
        case .lightTurquoise: return 32
        case .darkTurquoise: return 136
        case .sandGreen: return 340
        case .lightGreen: return 63
        case .mediumGreen: return 99
        case .brightGreen: return 1205
        case .green: return 4043
        case .darkGreen: return 636
        case .oliveGreen: return 249
        case .lime: return 1578
        case .mediumLime: return 36
        case .neonGreen: return 3
        case .yellowishGreen: return 96
        case .lightLime: return 15
        case .lightYellow: return 75
        case .brightLightYellow: return 303
        case .yellow: return 8176
        case .darkYellow: return 3
        case .veryLightOrange: return 2
        case .lightOrange: return 17
        case .brightLightOrange: return 858
        case .mediumOrange: return 123
        case .orange: return 2241
        case .neonOrange: return 2
        case .darkOrange: return 1032
        case .earthOrange: return 89
        case .fabulandOrange: return 1
        case .fabulandBrown: return 28
        case .darkFlesh: return 26
        case .mediumDarkFlesh: return 683
        case .flesh: return 136
        case .lightFlesh: return 1024
        case .tan: return 3061
        case .darkTan: return 1421
        case .darkBrown: return 978
        case .brown: return 1074
        case .reddishBrown: return 2636
        case .sandRed: return 18
        case .lightSalmon: return 24
        case .salmon: return 31
        case .rust: return 12
        case .red: return 8345
        case .darkRed: return 1196
        case .black: return 9615
        case .darkBluishGray: return 4437
        case .darkGray: return 1676
        case .lightGray: return 3154
        case .lightBluishGray: return 4726
        case .veryLightBluishGray: return 46
        case .veryLightGray: return 24
        case .white: return 8083
        case .other: return 0
        }
    }
}
