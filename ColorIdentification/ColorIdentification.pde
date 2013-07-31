WikiColor[] colorList;
WikiColor currentColor;
WikiColor wrongColor;

int x = 1000;
int y = 500;
int n = 284;

int rc = floor(random(n));
int wc = floor(random(n));
int op = floor(random(2));

int correct = 0;
int incorrect = 0;

void setup(){
  smooth();
  size(x, y);
  colorList = new WikiColor[n];
  colorList[0] = new WikiColor(93 , 138, 168,"Air Force Blue");
  colorList[1] = new WikiColor(163, 38 , 56 ,"Alabama Crimson");
  colorList[2] = new WikiColor(44, 22, 8, "Zinnwaldite");
  colorList[3] = new WikiColor(227, 38 , 54 ,"Alizarin Crimson");
  colorList[4] = new WikiColor(196, 98 , 16 ,"Alloy Orange");
  colorList[5] = new WikiColor(239, 222, 205,"Almond");
  colorList[6] = new WikiColor(229, 43 , 80 ,"Amaranth");
  colorList[7] = new WikiColor(255, 191, 0  ,"Amber");
  colorList[8] = new WikiColor(255, 3  , 62 ,"American Rose");
  colorList[9] = new WikiColor(153, 102, 204,"Amethyst ");
  colorList[10] = new WikiColor(164, 198, 57 ,"Android Green");
  colorList[11] = new WikiColor(205, 149, 117,"Antique Brass");
  colorList[12] = new WikiColor(145, 92 , 131,"Antique Fuchsia");
  colorList[13] = new WikiColor(132, 27 , 45 ,"Antique Ruby");
  colorList[14] = new WikiColor(250, 235, 215,"Antique White");
  colorList[15] = new WikiColor(0  , 128, 0  ,"Ao");
  colorList[16] = new WikiColor(141, 182, 0  ,"Apple Green");
  colorList[17] = new WikiColor(251, 206, 177,"Apricot");
  colorList[18] = new WikiColor(0  , 255, 255,"Aqua");
  colorList[19] = new WikiColor(127, 255, 212,"Aquamarine");
  colorList[20] = new WikiColor(75 , 83 , 32 ,"Army Green");
  colorList[21] = new WikiColor(59 , 68 , 75 ,"Arsenic");
  colorList[22] = new WikiColor(233, 214, 107,"Arylide");
  colorList[23] = new WikiColor(178, 190, 181,"Ash Grey");
  colorList[24] = new WikiColor(135, 169, 107,"Asparagus");
  colorList[25] = new WikiColor(255, 153, 102,"Atomic Tangerine");
  colorList[26] = new WikiColor(165, 42 , 42 ,"Auburn");
  colorList[27] = new WikiColor(253, 238, 0  ,"Aureolin");
  colorList[28] = new WikiColor(110, 127, 128,"Aurometalsaurus");
  colorList[29] = new WikiColor(86 , 130,   3,"Avocado");
  colorList[30] = new WikiColor(0  , 127, 255,"Azure");
  colorList[31] = new WikiColor(137, 207, 240,"Baby Blue");
  colorList[32] = new WikiColor(255, 225, 53 ,"Banana");
  colorList[33] = new WikiColor(124, 10 , 2  ,"Barn Red");
  colorList[34] = new WikiColor(132, 132, 130,"Battleship Grey");
  colorList[35] = new WikiColor(152, 119, 123,"Bazaar");
  colorList[36] = new WikiColor(188, 212, 230,"Beau Blue");
  colorList[37] = new WikiColor(159, 129, 112,"Beaver");
  colorList[38] = new WikiColor(245, 245, 220,"Beige");
  colorList[39] = new WikiColor(255, 228, 196,"Bisque");
  colorList[40] = new WikiColor(61 , 43 , 31 ,"Bistre");
  colorList[41] = new WikiColor(0  , 0  , 0  ,"Black");
  colorList[42] = new WikiColor( 59 ,  60,  54, "Black Olive");
  colorList[43] = new WikiColor(250, 240, 190,"Blond");
  colorList[44] = new WikiColor(0  , 0  , 255,"Blue");
  colorList[45] = new WikiColor(222, 93 , 131,"Blush");
  colorList[46] = new WikiColor(121, 68 , 59 ,"Bole");
  colorList[47] = new WikiColor(135, 50 , 96 ,"Boysenberry");
  colorList[48] = new WikiColor(0  , 112, 255,"Brandeis Blue");
  colorList[49] = new WikiColor(181, 166, 66 ,"Brass");
  colorList[50] = new WikiColor(255, 0  , 127,"Bright Pink");
  colorList[51] = new WikiColor(251, 96 , 127,"Brink Pink");
  colorList[52] = new WikiColor(205, 127, 50 ,"Bronze");
  colorList[53] = new WikiColor(255, 193, 204,"Bubble Gum");
  colorList[54] = new WikiColor(240, 220, 130,"Buff");
  colorList[55] = new WikiColor(72 , 6  , 7  ,"Bulgarian Rose");
  colorList[56] = new WikiColor(128, 0  , 32 ,"Burgundy");
  colorList[57] = new WikiColor(222, 184, 135,"Burlywood");
  colorList[58] = new WikiColor(204, 85 , 0  ,"Burnt Orange");
  colorList[59] = new WikiColor(233, 116, 81 ,"Burnt Sienna");
  colorList[60] = new WikiColor(138, 51 , 36 ,"Burnt Umber");
  colorList[61] = new WikiColor(112, 41 , 99 ,"Byzantium");
  colorList[62] = new WikiColor(83 , 104, 114,"Cadet");
  colorList[63] = new WikiColor(227, 0  , 34 ,"Cadmium Red");
  colorList[64] = new WikiColor(193, 154, 107,"Camel");
  colorList[65] = new WikiColor(255, 239, 0  ,"Canary");
  colorList[66] = new WikiColor(255, 8  , 0  ,"Candy Apple Red");
  colorList[67] = new WikiColor(0  , 191, 255,"Capri");
  colorList[68] = new WikiColor(89 , 39 , 32 ,"Caput Mortuum");
  colorList[69] = new WikiColor(196, 30 , 58 ,"Cardinal");
  colorList[70] = new WikiColor(0  , 204, 153,"Caribbean Green");
  colorList[71] = new WikiColor(150, 0  , 24 ,"Carmine");
  colorList[72] = new WikiColor(179, 27 , 27 ,"Carnelian");
  colorList[73] = new WikiColor(146, 161, 207,"Ceil");
  colorList[74] = new WikiColor(172, 225, 175,"Celadon");
  colorList[75] = new WikiColor(178, 255, 255, "Celeste");
  colorList[76] = new WikiColor(222, 49 , 99,"Cerise");
  colorList[77] = new WikiColor(0  , 123, 167,"Cerulean");
  colorList[78] = new WikiColor(160, 120, 90 ,"Chamoisee");
  colorList[79] = new WikiColor(250, 214, 165,"Champagne");
  colorList[80] = new WikiColor(54 , 69 , 79 ,"Charcoal");
  colorList[81] = new WikiColor(230, 143, 172,"Charm Pink");
  colorList[82] = new WikiColor(223, 255, 0  ,"Chartreuse");
  colorList[83] = new WikiColor(222, 49 , 99 ,"Cherry");
  colorList[84] = new WikiColor(205, 92 , 92 ,"Chestnut");
  colorList[85] = new WikiColor(168, 81 , 110,"China Rose");
  colorList[86] = new WikiColor(123, 63 , 0  ,"Chocolate");
  colorList[87] = new WikiColor(152, 129, 123,"Cinereous");
  colorList[88] = new WikiColor(227, 66 , 52 ,"Cinnabar");
  colorList[89] = new WikiColor(210, 105, 30 ,"Cinnamon");
  colorList[90] = new WikiColor(228, 208, 10 ,"Citrine");
  colorList[91] = new WikiColor(0  , 71 , 171,"Cobalt");
  colorList[92] = new WikiColor(184, 115, 51 ,"Copper");
  colorList[93] = new WikiColor(255, 56 , 0  ,"Coquelicot");
  colorList[94] = new WikiColor(255, 127, 80 ,"Coral");
  colorList[95] = new WikiColor(137, 63 , 69 ,"Cordovan");
  colorList[96] = new WikiColor(255, 248, 220,"Cornsilk");
  colorList[97] = new WikiColor(220, 20 , 60 ,"Crimson");
  colorList[98] = new WikiColor(0  , 255, 255,"Cyan");
  colorList[99] = new WikiColor(255, 255, 49 ,"Daffodil");
  colorList[100] = new WikiColor(240, 225, 48 ,"Dandelion");
  colorList[101] = new WikiColor(0  , 65 , 106,"Imperial Blue");
  colorList[102] = new WikiColor(215, 10 , 83 ,"Debian");
  colorList[103] = new WikiColor(21 , 96 , 189,"Denim");
  colorList[104] = new WikiColor(193, 154, 107,"Desert");
  colorList[105] = new WikiColor(150, 113, 23 ,"Drab");
  colorList[106] = new WikiColor( 85,  93,  80,"Ebony");
  colorList[107] = new WikiColor(194, 178, 128,"Ecru");
  colorList[108] = new WikiColor(97 , 64 , 81 ,"Eggplant");
  colorList[109] = new WikiColor(125, 249, 255,"Electric Blue");
  colorList[110] = new WikiColor(204, 255, 0  ,"Lime");
  colorList[111] = new WikiColor(80 , 200, 120,"Emerald");
  colorList[112] = new WikiColor(150, 200, 162,"Eton Blue");
  colorList[113] = new WikiColor(193, 154, 107,"Fallow");
  colorList[114] = new WikiColor(128, 24 , 24 ,"Falu Red");
  colorList[115] = new WikiColor(181, 51 , 137,"Fandango");
  colorList[116] = new WikiColor(229, 170, 112,"Fawn");
  colorList[117] = new WikiColor(77 , 93 , 83 ,"Feldgrau");
  colorList[118] = new WikiColor(79 , 121, 66 ,"Fern");
  colorList[119] = new WikiColor(255, 40 , 0  ,"Ferrari Red");
  colorList[120] = new WikiColor(178, 34 , 34 ,"Firebrick");
  colorList[121] = new WikiColor(226, 88 , 34 ,"Flame");
  colorList[122] = new WikiColor(252, 142, 172,"Flamingo");
  colorList[123] = new WikiColor(247, 233, 142,"Flavescent");
  colorList[124] = new WikiColor(238, 220, 130,"Flax");
  colorList[125] = new WikiColor(255, 0  , 79 ,"Folly");
  colorList[126] = new WikiColor(255, 0  , 255,"Fuchsia");
  colorList[127] = new WikiColor(228, 132, 0  ,"Fulvous");
  colorList[128] = new WikiColor(220, 220, 220,"Gainsboro");
  colorList[129] = new WikiColor(228, 155, 15 ,"Gamboge");
  colorList[130] = new WikiColor(176, 101, 0  ,"Ginger");
  colorList[131] = new WikiColor(96 , 130, 182,"Glaucous");
  colorList[132] = new WikiColor(255, 215, 0  ,"Gold");
  colorList[133] = new WikiColor(218, 165, 32 ,"Goldenrod");
  colorList[134] = new WikiColor(128, 128, 128,"Grey");
  colorList[135] = new WikiColor(0  , 128, 0  ,"Green");
  colorList[136] = new WikiColor(169, 154, 134,"Grullo");
  colorList[137] = new WikiColor(0  , 255, 127, "Guppie Green");
  colorList[138] = new WikiColor(68 , 108, 207,"Han Blue");
  colorList[139] = new WikiColor(233, 214, 107,"Hansa Yellow");
  colorList[140] = new WikiColor(63 , 255, 0  , "Harlequin");
  colorList[141] = new WikiColor(223, 115, 255,"Heliotrope");
  colorList[142] = new WikiColor(240, 255, 240,"Honeydew");
  colorList[143] = new WikiColor(113, 166, 210,"Iceberg");
  colorList[144] = new WikiColor(252, 247, 94 ,"Icterine");
  colorList[145] = new WikiColor(178, 236, 93 ,"Inchworm");
  colorList[146] = new WikiColor(75 , 0  , 130,"Indigo");
  colorList[147] = new WikiColor(0  , 47 , 167,"Klein Blue");
  colorList[148] = new WikiColor(90 , 79 , 207,"Iris");
  colorList[149] = new WikiColor(244, 240, 236,"Isabelline");
  colorList[150] = new WikiColor(0  , 168, 107,"Jade");
  colorList[151] = new WikiColor(248, 222, 126,"Jasmine");
  colorList[152] = new WikiColor(215, 59 , 62 ,"Jasper");
  colorList[153] = new WikiColor( 52,  52,  52,"Jet");
  colorList[154] = new WikiColor(250, 218, 94 ,"Jonquil");
  colorList[155] = new WikiColor(189, 218, 87 ,"June Bud");
  colorList[156] = new WikiColor(124, 28 , 5  ,"Kenyan Copper");
  colorList[157] = new WikiColor(195, 176, 145,"Khaki");
  colorList[158] = new WikiColor(38 , 97 , 156,"Lapis Lazuli");
  colorList[159] = new WikiColor(254, 254, 34 ,"Laser Lemon");
  colorList[160] = new WikiColor(207, 16 , 32 ,"Lava");
  colorList[161] = new WikiColor(230, 230, 250,"Lavender");
  colorList[162] = new WikiColor(255, 247, 0  ,"Lemon");
  colorList[163] = new WikiColor(227, 255, 0  ,"Lemon Lime");
  colorList[164] = new WikiColor( 26,  17,  16,"Licorice");
  colorList[165] = new WikiColor(200, 162, 200,"Lilac");
  colorList[166] = new WikiColor(191, 255, 0  ,"Lime");
  colorList[167] = new WikiColor(157, 194, 9  ,"Limerick");
  colorList[168] = new WikiColor(193, 154, 107,"Lion");
  colorList[169] = new WikiColor(83 , 75 , 79 ,"Liver");
  colorList[170] = new WikiColor(230, 32 , 32 , "Lust");
  colorList[171] = new WikiColor(255, 0  , 255,"Magenta");
  colorList[172] = new WikiColor(170, 240, 209,"Magic Mint");
  colorList[173] = new WikiColor(248, 244, 255,"Magnolia");
  colorList[174] = new WikiColor(192, 64 , 0  ,"Mahogany");
  colorList[175] = new WikiColor(251, 236, 93 ,"Maize");
  colorList[176] = new WikiColor(11 , 218, 81 ,"Malachite");
  colorList[177] = new WikiColor(151, 154, 170,"Manatee");
  colorList[178] = new WikiColor(116, 195, 101,"Mantis");
  colorList[179] = new WikiColor(195, 33 , 72 ,"Maroon");
  colorList[180] = new WikiColor(224, 176, 255,"Mauve");
  colorList[181] = new WikiColor(145, 95 , 109,"Mauve Taupe");
  colorList[182] = new WikiColor(253, 188, 180,"Melon");
  colorList[183] = new WikiColor(255, 196, 12 ,"Mikado");
  colorList[184] = new WikiColor(250, 235, 215,"Moccasin");
  colorList[185] = new WikiColor(150, 113, 23 ,"Mode Beige");
  colorList[186] = new WikiColor(173, 223, 173,"Moss");
  colorList[187] = new WikiColor(197, 75 , 140,"Mulberry");
  colorList[188] = new WikiColor(255, 219, 88 ,"Mustard");
  colorList[189] = new WikiColor(33 , 66 , 30 ,"Myrtle");
  colorList[190] = new WikiColor(246, 173, 198,"Nadeshiko");
  colorList[191] = new WikiColor(42 , 128, 0  ,"Napier");
  colorList[192] = new WikiColor(204, 119, 34 ,"Ochre");
  colorList[193] = new WikiColor(128, 128, 0  ,"Olive");
  colorList[194] = new WikiColor(107, 142, 35 ,"Olive Drab");
  colorList[195] = new WikiColor(154, 185, 115,"Olivine");
  colorList[196] = new WikiColor(53 , 56 , 57 ,"Onyx");
  colorList[197] = new WikiColor(255, 127, 0  ,"Orange");
  colorList[198] = new WikiColor(218, 112, 214,"Orchid");
  colorList[199] = new WikiColor(255, 239, 213,"Papaya Whip");
  colorList[200] = new WikiColor(128, 0  , 128,"Patriarch");
  colorList[201] = new WikiColor(255, 229, 180,"Peach");
  colorList[202] = new WikiColor(209, 226, 49 ,"Pear");
  colorList[203] = new WikiColor(230, 226, 0  ,"Peridot");
  colorList[204] = new WikiColor(204, 204, 255,"Periwinkle");
  colorList[205] = new WikiColor(236, 88 , 0  ,"Persimmon");
  colorList[206] = new WikiColor(205, 133, 63 ,"Peru");
  colorList[207] = new WikiColor(223, 0  , 255,"Phlox");
  colorList[208] = new WikiColor(147, 197, 114,"Pistachio");
  colorList[209] = new WikiColor(142, 69 , 133,"Plum");
  colorList[210] = new WikiColor(112, 28 , 28 ,"Prune");
  colorList[211] = new WikiColor(0  , 49 , 83 ,"Prussian Blue");
  colorList[212] = new WikiColor(204, 136, 153,"Puce");
  colorList[213] = new WikiColor(255, 117, 24 ,"Pumpkin");
  colorList[214] = new WikiColor(160, 32 , 240,"Purple");
  colorList[215] = new WikiColor(81, 72 , 79 ,"Quartz");
  colorList[216] = new WikiColor(93 , 138, 168,"Rackley");
  colorList[217] = new WikiColor(251, 174,  96,"Rajah");
  colorList[218] = new WikiColor(227, 11 , 92 ,"Raspberry");
  colorList[219] = new WikiColor(130, 102, 68 ,"Raw Umber");
  colorList[220] = new WikiColor(242, 0  , 60 ,"Red");
  colorList[221] = new WikiColor(82 , 45 , 128,"Regalia");
  colorList[222] = new WikiColor(65 , 72 , 51 ,"Rifle Green");
  colorList[223] = new WikiColor(255, 0  , 127,"Rose");
  colorList[224] = new WikiColor(212, 0  , 0  ,"Rosso Corsa");
  colorList[225] = new WikiColor(209, 0  , 86 ,"Rubine");
  colorList[226] = new WikiColor(224, 17 , 95 ,"Ruby");
  colorList[227] = new WikiColor(255, 0  , 40 ,"Ruddy");
  colorList[228] = new WikiColor(168, 28 , 7  ,"Rufous");
  colorList[229] = new WikiColor(128, 70 , 27 ,"Russet");
  colorList[230] = new WikiColor(183, 65 , 14 ,"Rust");
  colorList[231] = new WikiColor(244, 196, 48 ,"Saffron");
  colorList[232] = new WikiColor(255, 140, 105,"Salmon");
  colorList[233] = new WikiColor(146, 0  , 10 ,"Sangria");
  colorList[234] = new WikiColor(80 , 125, 42 ,"Sap Green");
  colorList[235] = new WikiColor(15 , 82 , 186,"Sapphire");
  colorList[236] = new WikiColor(255, 36 , 0  ,"Scarlet");
  colorList[237] = new WikiColor(50 , 20 , 20 ,"Seal");
  colorList[238] = new WikiColor(112, 66 , 20 ,"Sepia");
  colorList[239] = new WikiColor(0  , 158, 96 ,"Shamrock");
  colorList[240] = new WikiColor(136, 45 , 23 ,"Sienna");
  colorList[241] = new WikiColor(203, 65 , 11 ,"Sinopia");
  colorList[242] = new WikiColor(0  , 116, 116,"Skobeloff");
  colorList[243] = new WikiColor(112, 128, 144,"Slate");
  colorList[244] = new WikiColor(147, 61 , 65 ,"Topaz");
  colorList[245] = new WikiColor(250, 218, 94 ,"Stil De Grain");
  colorList[246] = new WikiColor(153, 0  , 0  ,"Stizza");
  colorList[247] = new WikiColor(228, 217, 111,"Straw");
  colorList[248] = new WikiColor(255, 204, 51 ,"Sunglow");
  colorList[249] = new WikiColor(250, 214, 165,"Sunset");
  colorList[250] = new WikiColor(210, 180, 140,  "Tan");
  colorList[251] = new WikiColor(249, 77 , 0  ,"Tangelo");
  colorList[252] = new WikiColor(242, 133, 0  ,"Tangerine");
  colorList[253] = new WikiColor(72 , 60 , 50 ,"Taupe");
  colorList[254] = new WikiColor(0  , 128, 128,"Teal");
  colorList[255] = new WikiColor(207, 52 , 118,"Telemagenta");
  colorList[256] = new WikiColor(205, 87 , 0  , "Tawny");
  colorList[257] = new WikiColor(226, 114, 91 ,"Terra Cotta");
  colorList[258] = new WikiColor(216, 191, 216,"Thistle");
  colorList[259] = new WikiColor(222, 111, 161,"Thulian Pink");
  colorList[260] = new WikiColor(224, 141, 60 ,"Tiger's Eye");
  colorList[261] = new WikiColor(219, 215, 210,"Timberwolf");
  colorList[262] = new WikiColor(255, 200, 124,"Topaz");
  colorList[263] = new WikiColor(65 , 125, 193,"Tufts Blue");
  colorList[264] = new WikiColor(222, 170, 136,"Tumbleweed");
  colorList[265] = new WikiColor(48 , 213, 200,"Turquoise");
  colorList[266] = new WikiColor(124, 48 , 48 ,"Tuscany");
  colorList[267] = new WikiColor(102, 2  , 60 ,"Tyrian");
  colorList[268] = new WikiColor(136, 120, 195,"Ube");
  colorList[269] = new WikiColor(18 , 10 , 143,"Ultramarine");
  colorList[270] = new WikiColor(99 , 81 , 71 ,"Umber");
  colorList[271] = new WikiColor(225, 173, 33 ,"Urobilin");
  colorList[272] = new WikiColor(243, 229, 171,"Vanilla");
  colorList[273] = new WikiColor(67 , 179, 174, "Verdigris");
  colorList[274] = new WikiColor(217, 56 , 30 ,"Vermilion");
  colorList[275] = new WikiColor(160, 32 , 240,"Veronica");
  colorList[276] = new WikiColor(143, 0  , 255,"Violet");
  colorList[277] = new WikiColor(64 , 130, 109,"Viridian");
  colorList[278] = new WikiColor(100, 84 , 82 ,"Wenge");
  colorList[279] = new WikiColor(114, 47 , 55 ,"Wine");
  colorList[280] = new WikiColor(201, 160, 220,"Wisteria");
  colorList[281] = new WikiColor(115, 134, 120,"Xanadu");
  colorList[282] = new WikiColor(255, 255, 0  ,"Yellow");
  colorList[283] = new WikiColor(0  , 20 , 168,"Zaffre");


  
  currentColor = colorList[floor(random(n))];
  wrongColor = colorList[floor(random(n))];
  while(wrongColor.n == currentColor.n){
    wrongColor = colorList[floor(random(n))];
  }
  
}

void draw(){
  background(currentColor.r, currentColor.g, currentColor.b);
  textSize(50);
  fill(255);
  textAlign(RIGHT);
  
  if(op == 0){
    textAlign(RIGHT);
    text(currentColor.n, x-20, y/2);
    textAlign(LEFT);
    text(wrongColor.n, 20, y/2);
  }
  else{
    textAlign(RIGHT);
    text(wrongColor.n, x-20, y/2);
    textAlign(LEFT);
    text(currentColor.n, 20, y/2);
  }
  strokeWeight(5);
  stroke(255);
  line(x/2, 0, x/2, y); 
  
  fill(255);
  rect(0, y-20, x, y);
  fill(0);
  textSize(15);
  textAlign(LEFT);
  text("Correct: ", 10, y-5);
  text(correct, 110, y-5);
  text("Incorrect: ", x/2+10, y-5);
  text(incorrect, x/2 + 110, y-5);
}

void mouseClicked() {
  if((mouseX < x/2 && op == 1) || (mouseX > x/2 && op == 0)){
    currentColor = colorList[floor(random(n))];
    wrongColor = colorList[floor(random(n))];
    while(wrongColor.n == currentColor.n){
      wrongColor = colorList[floor(random(n))];
    }
    op = floor(random(2));
    correct += 1;
  }
  else{
    incorrect += 1;
  }
}

void keyPressed() {
  if (key == CODED) {
    if ((keyCode == LEFT && op == 1)||(keyCode == RIGHT && op == 0)) {
       currentColor = colorList[floor(random(n))];
      wrongColor = colorList[floor(random(n))];
      while(wrongColor.n == currentColor.n){
        wrongColor = colorList[floor(random(n))];
      }
      op = floor(random(2));
      correct += 1;
    }
    else{
      incorrect += 1;
    }
  }
}

class WikiColor {
  float r, g, b;
  String n;
  WikiColor (float rr, float gg, float bb, String nn) {
    r = rr;
    g = gg;
    b = bb;
    n = nn;
  }
}
