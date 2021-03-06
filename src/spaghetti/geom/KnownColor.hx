package spaghetti.geom;


/*!
 *
 */
@:enum
abstract KnownColor(Int) from Int to PackedARGB {
    var AliceBlue = 0xfff0f8ff;
    var AntiqueWhite = 0xfffaebd7;
    var Aqua = 0xff00ffff;
    var Aquamarine = 0xff7fffd4;
    var Azure = 0xfff0ffff;
    var Beige = 0xfff5f5dc;
    var Bisque = 0xffffe4c4;
    var Black = 0xff000000;
    var BlanchedAlmond = 0xffffebcd;
    var Blue = 0xff0000ff;
    var BlueViolet = 0xff8a2be2;
    var Brown = 0xffa52a2a;
    var BurlyWood = 0xffdeb887;
    var CadetBlue = 0xff5f9ea0;
    var Chartreuse = 0xff7fff00;
    var Chocolate = 0xffd2691e;
    var Coral = 0xffff7f50;
    var CornflowerBlue = 0xff6495ed;
    var Cornsilk = 0xfffff8dc;
    var Crimson = 0xffdc143c;
    var Cyan = 0xff00ffff;
    var DarkBlue = 0xff00008b;
    var DarkCyan = 0xff008b8b;
    var DarkGoldenrod = 0xffb8860b;
    var DarkGray = 0xffa9a9a9;
    var DarkGreen = 0xff006400;
    var DarkKhaki = 0xffbdb76b;
    var DarkMagenta = 0xff8b008b;
    var DarkOliveGreen = 0xff556b2f;
    var DarkOrange = 0xffff8c00;
    var DarkOrchid = 0xff9932cc;
    var DarkRed = 0xff8b0000;
    var DarkSalmon = 0xffe9967a;
    var DarkSeaGreen = 0xff8fbc8b;
    var DarkSlateBlue = 0xff483d8b;
    var DarkSlateGray = 0xff2f4f4f;
    var DarkTurquoise = 0xff00ced1;
    var DarkViolet = 0xff9400d3;
    var DeepPink = 0xffff1493;
    var DeepSkyBlue = 0xff00bfff;
    var DimGray = 0xff696969;
    var DodgerBlue = 0xff1e90ff;
    var Firebrick = 0xffb22222;
    var FloralWhite = 0xfffffaf0;
    var ForestGreen = 0xff228b22;
    var Fuchsia = 0xffff00ff;
    var Gainsboro = 0xffdcdcdc;
    var GhostWhite = 0xfff8f8ff;
    var Gold = 0xffffd700;
    var Goldenrod = 0xffdaa520;
    var Gray = 0xff808080;
    var Green = 0xff008000;
    var GreenYellow = 0xffadff2f;
    var Honeydew = 0xfff0fff0;
    var HotPink = 0xffff69b4;
    var IndianRed = 0xffcd5c5c;
    var Indigo = 0xff4b0082;
    var Ivory = 0xfffffff0;
    var Khaki = 0xfff0e68c;
    var Lavender = 0xffe6e6fa;
    var LavenderBlush = 0xfffff0f5;
    var LawnGreen = 0xff7cfc00;
    var LemonChiffon = 0xfffffacd;
    var LightBlue = 0xffadd8e6;
    var LightCoral = 0xfff08080;
    var LightCyan = 0xffe0ffff;
    var LightGoldenrodYellow = 0xfffafad2;
    var LightGray = 0xffd3d3d3;
    var LightGreen = 0xff90ee90;
    var LightPink = 0xffffb6c1;
    var LightSalmon = 0xffffa07a;
    var LightSeaGreen = 0xff20b2aa;
    var LightSkyBlue = 0xff87cefa;
    var LightSlateGray = 0xff778899;
    var LightSteelBlue = 0xffb0c4de;
    var LightYellow = 0xffffffe0;
    var Lime = 0xff00ff00;
    var LimeGreen = 0xff32cd32;
    var Linen = 0xfffaf0e6;
    var Magenta = 0xffff00ff;
    var Maroon = 0xff800000;
    var MediumAquamarine = 0xff66cdaa;
    var MediumBlue = 0xff0000cd;
    var MediumOrchid = 0xffba55d3;
    var MediumPurple = 0xff9370db;
    var MediumSeaGreen = 0xff3cb371;
    var MediumSlateBlue = 0xff7b68ee;
    var MediumSpringGreen = 0xff00fa9a;
    var MediumTurquoise = 0xff48d1cc;
    var MediumVioletRed = 0xffc71585;
    var MidnightBlue = 0xff191970;
    var MintCream = 0xfff5fffa;
    var MistyRose = 0xffffe4e1;
    var Moccasin = 0xffffe4b5;
    var NavajoWhite = 0xffffdead;
    var Navy = 0xff000080;
    var OldLace = 0xfffdf5e6;
    var Olive = 0xff808000;
    var OliveDrab = 0xff6b8e23;
    var Orange = 0xffffa500;
    var OrangeRed = 0xffff4500;
    var Orchid = 0xffda70d6;
    var PaleGoldenrod = 0xffeee8aa;
    var PaleGreen = 0xff98fb98;
    var PaleTurquoise = 0xffafeeee;
    var PaleVioletRed = 0xffdb7093;
    var PapayaWhip = 0xffffefd5;
    var PeachPuff = 0xffffdab9;
    var Peru = 0xffcd853f;
    var Pink = 0xffffc0cb;
    var Plum = 0xffdda0dd;
    var PowderBlue = 0xffb0e0e6;
    var Purple = 0xff800080;
    var Red = 0xffff0000;
    var RosyBrown = 0xffbc8f8f;
    var RoyalBlue = 0xff4169e1;
    var SaddleBrown = 0xff8b4513;
    var Salmon = 0xfffa8072;
    var SandyBrown = 0xfff4a460;
    var SeaGreen = 0xff2e8b57;
    var SeaShell = 0xfffff5ee;
    var Sienna = 0xffa0522d;
    var Silver = 0xffc0c0c0;
    var SkyBlue = 0xff87ceeb;
    var SlateBlue = 0xff6a5acd;
    var SlateGray = 0xff708090;
    var Snow = 0xfffffafa;
    var SpringGreen = 0xff00ff7f;
    var SteelBlue = 0xff4682b4;
    var Tan = 0xffd2b48c;
    var Teal = 0xff008080;
    var Thistle = 0xffd8bfd8;
    var Tomato = 0xffff6347;
    var Turquoise = 0xff40e0d0;
    var Violet = 0xffee82ee;
    var Wheat = 0xfff5deb3;
    var White = 0xffffffff;
    var WhiteSmoke = 0xfff5f5f5;
    var Yellow = 0xffffff00;
    var YellowGreen = 0xff9acd32;
}