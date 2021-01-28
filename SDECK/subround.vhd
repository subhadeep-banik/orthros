-- taken from Joan Daemen, Pedro Maat Costa Massolino, Alireza Mehrdad, and Yann
--Rotella. The subterranean 2.0 cipher suite. https://cs.ru.nl/~joan/subterranean.html.
library work;
 
		use work.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;	


entity subround is
port(
        a      : in  std_logic_vector(256 downto 0);
        dinp   : in  std_logic_vector(32 downto 0);
        o      : out std_logic_vector(256 downto 0);
        dop    : out  std_logic_vector(31 downto 0)
    );

end subround;

architecture rtl of subround is

 
signal a_after_chi_iota,temp:    std_logic_vector(256 downto 0);
signal a_after_theta:    std_logic_vector(256 downto 0);
signal din :    std_logic_vector(32 downto 0);
signal dout :    std_logic_vector(31 downto 0);


begin


d: for i in 0 to 32 generate
din(i)<= dinp( 32-i);
end generate;

 

-- Chi and iota steps

 a_after_chi_iota(0)     <=  (a(0)   xnor   (( not a(1))   and a(2)));

chi: for i in 1 to 254 generate
--a_after_chi_iota(254:1) <= a(254:1) xor   ((~a(255:2)) & a(256:3));

a_after_chi_iota(i)<= a(i) xor   ((not a(i+1)) and a(i+2));
end generate;

 a_after_chi_iota(255)   <= a(255)   xor   ((not a(256))   and a(0));
 a_after_chi_iota(256)   <= a(256)   xor   ((not a(0))     and a(1));

-- Theta step

 a_after_theta(12)  <= a_after_chi_iota(12)  xor a_after_chi_iota(15)  xor a_after_chi_iota(20)  xor din(0);
 a_after_theta(56)  <= a_after_chi_iota(56)  xor a_after_chi_iota(59)  xor a_after_chi_iota(64)  xor din(1);
 a_after_theta(90)  <= a_after_chi_iota(90)  xor a_after_chi_iota(93)  xor a_after_chi_iota(98)  xor din(2);
 a_after_theta(163) <= a_after_chi_iota(163) xor a_after_chi_iota(166) xor a_after_chi_iota(171) xor din(3);
 a_after_theta(161) <= a_after_chi_iota(161) xor a_after_chi_iota(164) xor a_after_chi_iota(169) xor din(4);
 a_after_theta(66)  <= a_after_chi_iota(66)  xor a_after_chi_iota(69)  xor a_after_chi_iota(74)  xor din(5);
 a_after_theta(51)  <= a_after_chi_iota(51)  xor a_after_chi_iota(54)  xor a_after_chi_iota(59)  xor din(6);
 a_after_theta(238) <= a_after_chi_iota(238) xor a_after_chi_iota(241) xor a_after_chi_iota(246) xor din(7);
 a_after_theta(254) <= a_after_chi_iota(254) xor a_after_chi_iota(0)   xor a_after_chi_iota(5)   xor din(8);
 a_after_theta(243) <= a_after_chi_iota(243) xor a_after_chi_iota(246) xor a_after_chi_iota(251) xor din(9);
 a_after_theta(106) <= a_after_chi_iota(106) xor a_after_chi_iota(109) xor a_after_chi_iota(114) xor din(10);
 a_after_theta(152) <= a_after_chi_iota(152) xor a_after_chi_iota(155) xor a_after_chi_iota(160) xor din(11);
 a_after_theta(24)  <= a_after_chi_iota(24)  xor a_after_chi_iota(27)  xor a_after_chi_iota(32)  xor din(12);
 a_after_theta(112) <= a_after_chi_iota(112) xor a_after_chi_iota(115) xor a_after_chi_iota(120) xor din(13);
 a_after_theta(180) <= a_after_chi_iota(180) xor a_after_chi_iota(183) xor a_after_chi_iota(188) xor din(14);
 a_after_theta(69)  <= a_after_chi_iota(69)  xor a_after_chi_iota(72)  xor a_after_chi_iota(77)  xor din(15);
 a_after_theta(65)  <= a_after_chi_iota(65)  xor a_after_chi_iota(68)  xor a_after_chi_iota(73)  xor din(16);
 a_after_theta(132) <= a_after_chi_iota(132) xor a_after_chi_iota(135) xor a_after_chi_iota(140) xor din(17);
 a_after_theta(102) <= a_after_chi_iota(102) xor a_after_chi_iota(105) xor a_after_chi_iota(110) xor din(18);
 a_after_theta(219) <= a_after_chi_iota(219) xor a_after_chi_iota(222) xor a_after_chi_iota(227) xor din(19);
 a_after_theta(251) <= a_after_chi_iota(251) xor a_after_chi_iota(254) xor a_after_chi_iota(2)   xor din(20);
 a_after_theta(229) <= a_after_chi_iota(229) xor a_after_chi_iota(232) xor a_after_chi_iota(237) xor din(21);
 a_after_theta(212) <= a_after_chi_iota(212) xor a_after_chi_iota(215) xor a_after_chi_iota(220) xor din(22);
 a_after_theta(47)  <= a_after_chi_iota(47)  xor a_after_chi_iota(50)  xor a_after_chi_iota(55)  xor din(23);
 a_after_theta(48)  <= a_after_chi_iota(48)  xor a_after_chi_iota(51)  xor a_after_chi_iota(56)  xor din(24);
 a_after_theta(224) <= a_after_chi_iota(224) xor a_after_chi_iota(227) xor a_after_chi_iota(232) xor din(25);
 a_after_theta(103) <= a_after_chi_iota(103) xor a_after_chi_iota(106) xor a_after_chi_iota(111) xor din(26);
 a_after_theta(138) <= a_after_chi_iota(138) xor a_after_chi_iota(141) xor a_after_chi_iota(146) xor din(27);
 a_after_theta(130) <= a_after_chi_iota(130) xor a_after_chi_iota(133) xor a_after_chi_iota(138) xor din(28);
 a_after_theta(7)   <= a_after_chi_iota(7)   xor a_after_chi_iota(10)  xor a_after_chi_iota(15)  xor din(29);
 a_after_theta(204) <= a_after_chi_iota(204) xor a_after_chi_iota(207) xor a_after_chi_iota(212) xor din(30);
 a_after_theta(181) <= a_after_chi_iota(181) xor a_after_chi_iota(184) xor a_after_chi_iota(189) xor din(31);
 a_after_theta(245) <= a_after_chi_iota(245) xor a_after_chi_iota(248) xor a_after_chi_iota(253) xor din(32);

 a_after_theta(0) <= a_after_chi_iota(0) xor a_after_chi_iota(3) xor a_after_chi_iota(8);
 a_after_theta(36) <= a_after_chi_iota(36) xor a_after_chi_iota(39) xor a_after_chi_iota(44);
 a_after_theta(60) <= a_after_chi_iota(60) xor a_after_chi_iota(63) xor a_after_chi_iota(68);
 a_after_theta(72) <= a_after_chi_iota(72) xor a_after_chi_iota(75) xor a_after_chi_iota(80);
 a_after_theta(84) <= a_after_chi_iota(84) xor a_after_chi_iota(87) xor a_after_chi_iota(92);
 a_after_theta(96) <= a_after_chi_iota(96) xor a_after_chi_iota(99) xor a_after_chi_iota(104);
 a_after_theta(108) <= a_after_chi_iota(108) xor a_after_chi_iota(111) xor a_after_chi_iota(116);
 a_after_theta(120) <= a_after_chi_iota(120) xor a_after_chi_iota(123) xor a_after_chi_iota(128);
 a_after_theta(144) <= a_after_chi_iota(144) xor a_after_chi_iota(147) xor a_after_chi_iota(152);
 a_after_theta(156) <= a_after_chi_iota(156) xor a_after_chi_iota(159) xor a_after_chi_iota(164);
 a_after_theta(168) <= a_after_chi_iota(168) xor a_after_chi_iota(171) xor a_after_chi_iota(176);
 a_after_theta(192) <= a_after_chi_iota(192) xor a_after_chi_iota(195) xor a_after_chi_iota(200);
 a_after_theta(216) <= a_after_chi_iota(216) xor a_after_chi_iota(219) xor a_after_chi_iota(224);
 a_after_theta(228) <= a_after_chi_iota(228) xor a_after_chi_iota(231) xor a_after_chi_iota(236);
 a_after_theta(240) <= a_after_chi_iota(240) xor a_after_chi_iota(243) xor a_after_chi_iota(248);
 a_after_theta(252) <= a_after_chi_iota(252) xor a_after_chi_iota(255) xor a_after_chi_iota(3);
 a_after_theta(19) <= a_after_chi_iota(19) xor a_after_chi_iota(22) xor a_after_chi_iota(27);
 a_after_theta(31) <= a_after_chi_iota(31) xor a_after_chi_iota(34) xor a_after_chi_iota(39);
 a_after_theta(43) <= a_after_chi_iota(43) xor a_after_chi_iota(46) xor a_after_chi_iota(51);
 a_after_theta(55) <= a_after_chi_iota(55) xor a_after_chi_iota(58) xor a_after_chi_iota(63);
 a_after_theta(67) <= a_after_chi_iota(67) xor a_after_chi_iota(70) xor a_after_chi_iota(75);
 a_after_theta(79) <= a_after_chi_iota(79) xor a_after_chi_iota(82) xor a_after_chi_iota(87);
 a_after_theta(91) <= a_after_chi_iota(91) xor a_after_chi_iota(94) xor a_after_chi_iota(99);
 a_after_theta(115) <= a_after_chi_iota(115) xor a_after_chi_iota(118) xor a_after_chi_iota(123);
 a_after_theta(127) <= a_after_chi_iota(127) xor a_after_chi_iota(130) xor a_after_chi_iota(135);
 a_after_theta(139) <= a_after_chi_iota(139) xor a_after_chi_iota(142) xor a_after_chi_iota(147);
 a_after_theta(151) <= a_after_chi_iota(151) xor a_after_chi_iota(154) xor a_after_chi_iota(159);
 a_after_theta(175) <= a_after_chi_iota(175) xor a_after_chi_iota(178) xor a_after_chi_iota(183);
 a_after_theta(187) <= a_after_chi_iota(187) xor a_after_chi_iota(190) xor a_after_chi_iota(195);
 a_after_theta(199) <= a_after_chi_iota(199) xor a_after_chi_iota(202) xor a_after_chi_iota(207);
 a_after_theta(211) <= a_after_chi_iota(211) xor a_after_chi_iota(214) xor a_after_chi_iota(219);
 a_after_theta(223) <= a_after_chi_iota(223) xor a_after_chi_iota(226) xor a_after_chi_iota(231);
 a_after_theta(235) <= a_after_chi_iota(235) xor a_after_chi_iota(238) xor a_after_chi_iota(243);
 a_after_theta(247) <= a_after_chi_iota(247) xor a_after_chi_iota(250) xor a_after_chi_iota(255);
 a_after_theta(2) <= a_after_chi_iota(2) xor a_after_chi_iota(5) xor a_after_chi_iota(10);
 a_after_theta(14) <= a_after_chi_iota(14) xor a_after_chi_iota(17) xor a_after_chi_iota(22);
 a_after_theta(26) <= a_after_chi_iota(26) xor a_after_chi_iota(29) xor a_after_chi_iota(34);
 a_after_theta(38) <= a_after_chi_iota(38) xor a_after_chi_iota(41) xor a_after_chi_iota(46);
 a_after_theta(50) <= a_after_chi_iota(50) xor a_after_chi_iota(53) xor a_after_chi_iota(58);
 a_after_theta(62) <= a_after_chi_iota(62) xor a_after_chi_iota(65) xor a_after_chi_iota(70);
 a_after_theta(74) <= a_after_chi_iota(74) xor a_after_chi_iota(77) xor a_after_chi_iota(82);
 a_after_theta(86) <= a_after_chi_iota(86) xor a_after_chi_iota(89) xor a_after_chi_iota(94);
 a_after_theta(98) <= a_after_chi_iota(98) xor a_after_chi_iota(101) xor a_after_chi_iota(106);
 a_after_theta(110) <= a_after_chi_iota(110) xor a_after_chi_iota(113) xor a_after_chi_iota(118);
 a_after_theta(122) <= a_after_chi_iota(122) xor a_after_chi_iota(125) xor a_after_chi_iota(130);
 a_after_theta(134) <= a_after_chi_iota(134) xor a_after_chi_iota(137) xor a_after_chi_iota(142);
 a_after_theta(146) <= a_after_chi_iota(146) xor a_after_chi_iota(149) xor a_after_chi_iota(154);
 a_after_theta(158) <= a_after_chi_iota(158) xor a_after_chi_iota(161) xor a_after_chi_iota(166);
 a_after_theta(170) <= a_after_chi_iota(170) xor a_after_chi_iota(173) xor a_after_chi_iota(178);
 a_after_theta(182) <= a_after_chi_iota(182) xor a_after_chi_iota(185) xor a_after_chi_iota(190);
 a_after_theta(194) <= a_after_chi_iota(194) xor a_after_chi_iota(197) xor a_after_chi_iota(202);
 a_after_theta(206) <= a_after_chi_iota(206) xor a_after_chi_iota(209) xor a_after_chi_iota(214);
 a_after_theta(218) <= a_after_chi_iota(218) xor a_after_chi_iota(221) xor a_after_chi_iota(226);
 a_after_theta(230) <= a_after_chi_iota(230) xor a_after_chi_iota(233) xor a_after_chi_iota(238);
 a_after_theta(242) <= a_after_chi_iota(242) xor a_after_chi_iota(245) xor a_after_chi_iota(250);
 a_after_theta(9) <= a_after_chi_iota(9) xor a_after_chi_iota(12) xor a_after_chi_iota(17);
 a_after_theta(21) <= a_after_chi_iota(21) xor a_after_chi_iota(24) xor a_after_chi_iota(29);
 a_after_theta(33) <= a_after_chi_iota(33) xor a_after_chi_iota(36) xor a_after_chi_iota(41);
 a_after_theta(45) <= a_after_chi_iota(45) xor a_after_chi_iota(48) xor a_after_chi_iota(53);
 a_after_theta(57) <= a_after_chi_iota(57) xor a_after_chi_iota(60) xor a_after_chi_iota(65);
 a_after_theta(81) <= a_after_chi_iota(81) xor a_after_chi_iota(84) xor a_after_chi_iota(89);
 a_after_theta(93) <= a_after_chi_iota(93) xor a_after_chi_iota(96) xor a_after_chi_iota(101);
 a_after_theta(105) <= a_after_chi_iota(105) xor a_after_chi_iota(108) xor a_after_chi_iota(113);
 a_after_theta(117) <= a_after_chi_iota(117) xor a_after_chi_iota(120) xor a_after_chi_iota(125);
 a_after_theta(129) <= a_after_chi_iota(129) xor a_after_chi_iota(132) xor a_after_chi_iota(137);
 a_after_theta(141) <= a_after_chi_iota(141) xor a_after_chi_iota(144) xor a_after_chi_iota(149);
 a_after_theta(153) <= a_after_chi_iota(153) xor a_after_chi_iota(156) xor a_after_chi_iota(161);
 a_after_theta(165) <= a_after_chi_iota(165) xor a_after_chi_iota(168) xor a_after_chi_iota(173);
 a_after_theta(177) <= a_after_chi_iota(177) xor a_after_chi_iota(180) xor a_after_chi_iota(185);
 a_after_theta(189) <= a_after_chi_iota(189) xor a_after_chi_iota(192) xor a_after_chi_iota(197);
 a_after_theta(201) <= a_after_chi_iota(201) xor a_after_chi_iota(204) xor a_after_chi_iota(209);
 a_after_theta(213) <= a_after_chi_iota(213) xor a_after_chi_iota(216) xor a_after_chi_iota(221);
 a_after_theta(225) <= a_after_chi_iota(225) xor a_after_chi_iota(228) xor a_after_chi_iota(233);
 a_after_theta(237) <= a_after_chi_iota(237) xor a_after_chi_iota(240) xor a_after_chi_iota(245);
 a_after_theta(249) <= a_after_chi_iota(249) xor a_after_chi_iota(252) xor a_after_chi_iota(0);
 a_after_theta(4) <= a_after_chi_iota(4) xor a_after_chi_iota(7) xor a_after_chi_iota(12);
 a_after_theta(16) <= a_after_chi_iota(16) xor a_after_chi_iota(19) xor a_after_chi_iota(24);
 a_after_theta(28) <= a_after_chi_iota(28) xor a_after_chi_iota(31) xor a_after_chi_iota(36);
 a_after_theta(40) <= a_after_chi_iota(40) xor a_after_chi_iota(43) xor a_after_chi_iota(48);
 a_after_theta(52) <= a_after_chi_iota(52) xor a_after_chi_iota(55) xor a_after_chi_iota(60);
 a_after_theta(64) <= a_after_chi_iota(64) xor a_after_chi_iota(67) xor a_after_chi_iota(72);
 a_after_theta(76) <= a_after_chi_iota(76) xor a_after_chi_iota(79) xor a_after_chi_iota(84);
 a_after_theta(88) <= a_after_chi_iota(88) xor a_after_chi_iota(91) xor a_after_chi_iota(96);
 a_after_theta(100) <= a_after_chi_iota(100) xor a_after_chi_iota(103) xor a_after_chi_iota(108);
 a_after_theta(124) <= a_after_chi_iota(124) xor a_after_chi_iota(127) xor a_after_chi_iota(132);
 a_after_theta(136) <= a_after_chi_iota(136) xor a_after_chi_iota(139) xor a_after_chi_iota(144);
 a_after_theta(148) <= a_after_chi_iota(148) xor a_after_chi_iota(151) xor a_after_chi_iota(156);
 a_after_theta(160) <= a_after_chi_iota(160) xor a_after_chi_iota(163) xor a_after_chi_iota(168);
 a_after_theta(172) <= a_after_chi_iota(172) xor a_after_chi_iota(175) xor a_after_chi_iota(180);
 a_after_theta(184) <= a_after_chi_iota(184) xor a_after_chi_iota(187) xor a_after_chi_iota(192);
 a_after_theta(196) <= a_after_chi_iota(196) xor a_after_chi_iota(199) xor a_after_chi_iota(204);
 a_after_theta(208) <= a_after_chi_iota(208) xor a_after_chi_iota(211) xor a_after_chi_iota(216);
 a_after_theta(220) <= a_after_chi_iota(220) xor a_after_chi_iota(223) xor a_after_chi_iota(228);
 a_after_theta(232) <= a_after_chi_iota(232) xor a_after_chi_iota(235) xor a_after_chi_iota(240);
 a_after_theta(244) <= a_after_chi_iota(244) xor a_after_chi_iota(247) xor a_after_chi_iota(252);
 a_after_theta(256) <= a_after_chi_iota(256) xor a_after_chi_iota(2) xor a_after_chi_iota(7);
 a_after_theta(11) <= a_after_chi_iota(11) xor a_after_chi_iota(14) xor a_after_chi_iota(19);
 a_after_theta(23) <= a_after_chi_iota(23) xor a_after_chi_iota(26) xor a_after_chi_iota(31);
 a_after_theta(35) <= a_after_chi_iota(35) xor a_after_chi_iota(38) xor a_after_chi_iota(43);
 a_after_theta(59) <= a_after_chi_iota(59) xor a_after_chi_iota(62) xor a_after_chi_iota(67);
 a_after_theta(71) <= a_after_chi_iota(71) xor a_after_chi_iota(74) xor a_after_chi_iota(79);
 a_after_theta(83) <= a_after_chi_iota(83) xor a_after_chi_iota(86) xor a_after_chi_iota(91);
 a_after_theta(95) <= a_after_chi_iota(95) xor a_after_chi_iota(98) xor a_after_chi_iota(103);
 a_after_theta(107) <= a_after_chi_iota(107) xor a_after_chi_iota(110) xor a_after_chi_iota(115);
 a_after_theta(119) <= a_after_chi_iota(119) xor a_after_chi_iota(122) xor a_after_chi_iota(127);
 a_after_theta(131) <= a_after_chi_iota(131) xor a_after_chi_iota(134) xor a_after_chi_iota(139);
 a_after_theta(143) <= a_after_chi_iota(143) xor a_after_chi_iota(146) xor a_after_chi_iota(151);
 a_after_theta(155) <= a_after_chi_iota(155) xor a_after_chi_iota(158) xor a_after_chi_iota(163);
 a_after_theta(167) <= a_after_chi_iota(167) xor a_after_chi_iota(170) xor a_after_chi_iota(175);
 a_after_theta(179) <= a_after_chi_iota(179) xor a_after_chi_iota(182) xor a_after_chi_iota(187);
 a_after_theta(191) <= a_after_chi_iota(191) xor a_after_chi_iota(194) xor a_after_chi_iota(199);
 a_after_theta(203) <= a_after_chi_iota(203) xor a_after_chi_iota(206) xor a_after_chi_iota(211);
 a_after_theta(215) <= a_after_chi_iota(215) xor a_after_chi_iota(218) xor a_after_chi_iota(223);
 a_after_theta(227) <= a_after_chi_iota(227) xor a_after_chi_iota(230) xor a_after_chi_iota(235);
 a_after_theta(239) <= a_after_chi_iota(239) xor a_after_chi_iota(242) xor a_after_chi_iota(247);
 a_after_theta(6) <= a_after_chi_iota(6) xor a_after_chi_iota(9) xor a_after_chi_iota(14);
 a_after_theta(18) <= a_after_chi_iota(18) xor a_after_chi_iota(21) xor a_after_chi_iota(26);
 a_after_theta(30) <= a_after_chi_iota(30) xor a_after_chi_iota(33) xor a_after_chi_iota(38);
 a_after_theta(42) <= a_after_chi_iota(42) xor a_after_chi_iota(45) xor a_after_chi_iota(50);
 a_after_theta(54) <= a_after_chi_iota(54) xor a_after_chi_iota(57) xor a_after_chi_iota(62);
 a_after_theta(78) <= a_after_chi_iota(78) xor a_after_chi_iota(81) xor a_after_chi_iota(86);
 a_after_theta(114) <= a_after_chi_iota(114) xor a_after_chi_iota(117) xor a_after_chi_iota(122);
 a_after_theta(126) <= a_after_chi_iota(126) xor a_after_chi_iota(129) xor a_after_chi_iota(134);
 a_after_theta(150) <= a_after_chi_iota(150) xor a_after_chi_iota(153) xor a_after_chi_iota(158);
 a_after_theta(162) <= a_after_chi_iota(162) xor a_after_chi_iota(165) xor a_after_chi_iota(170);
 a_after_theta(174) <= a_after_chi_iota(174) xor a_after_chi_iota(177) xor a_after_chi_iota(182);
 a_after_theta(186) <= a_after_chi_iota(186) xor a_after_chi_iota(189) xor a_after_chi_iota(194);
 a_after_theta(198) <= a_after_chi_iota(198) xor a_after_chi_iota(201) xor a_after_chi_iota(206);
 a_after_theta(210) <= a_after_chi_iota(210) xor a_after_chi_iota(213) xor a_after_chi_iota(218);
 a_after_theta(222) <= a_after_chi_iota(222) xor a_after_chi_iota(225) xor a_after_chi_iota(230);
 a_after_theta(234) <= a_after_chi_iota(234) xor a_after_chi_iota(237) xor a_after_chi_iota(242);
 a_after_theta(246) <= a_after_chi_iota(246) xor a_after_chi_iota(249) xor a_after_chi_iota(254);
 a_after_theta(1) <= a_after_chi_iota(1) xor a_after_chi_iota(4) xor a_after_chi_iota(9);
 a_after_theta(13) <= a_after_chi_iota(13) xor a_after_chi_iota(16) xor a_after_chi_iota(21);
 a_after_theta(25) <= a_after_chi_iota(25) xor a_after_chi_iota(28) xor a_after_chi_iota(33);
 a_after_theta(37) <= a_after_chi_iota(37) xor a_after_chi_iota(40) xor a_after_chi_iota(45);
 a_after_theta(49) <= a_after_chi_iota(49) xor a_after_chi_iota(52) xor a_after_chi_iota(57);
 a_after_theta(61) <= a_after_chi_iota(61) xor a_after_chi_iota(64) xor a_after_chi_iota(69);
 a_after_theta(73) <= a_after_chi_iota(73) xor a_after_chi_iota(76) xor a_after_chi_iota(81);
 a_after_theta(85) <= a_after_chi_iota(85) xor a_after_chi_iota(88) xor a_after_chi_iota(93);
 a_after_theta(97) <= a_after_chi_iota(97) xor a_after_chi_iota(100) xor a_after_chi_iota(105);
 a_after_theta(109) <= a_after_chi_iota(109) xor a_after_chi_iota(112) xor a_after_chi_iota(117);
 a_after_theta(121) <= a_after_chi_iota(121) xor a_after_chi_iota(124) xor a_after_chi_iota(129);
 a_after_theta(133) <= a_after_chi_iota(133) xor a_after_chi_iota(136) xor a_after_chi_iota(141);
 a_after_theta(145) <= a_after_chi_iota(145) xor a_after_chi_iota(148) xor a_after_chi_iota(153);
 a_after_theta(157) <= a_after_chi_iota(157) xor a_after_chi_iota(160) xor a_after_chi_iota(165);
 a_after_theta(169) <= a_after_chi_iota(169) xor a_after_chi_iota(172) xor a_after_chi_iota(177);
 a_after_theta(193) <= a_after_chi_iota(193) xor a_after_chi_iota(196) xor a_after_chi_iota(201);
 a_after_theta(205) <= a_after_chi_iota(205) xor a_after_chi_iota(208) xor a_after_chi_iota(213);
 a_after_theta(217) <= a_after_chi_iota(217) xor a_after_chi_iota(220) xor a_after_chi_iota(225);
 a_after_theta(241) <= a_after_chi_iota(241) xor a_after_chi_iota(244) xor a_after_chi_iota(249);
 a_after_theta(253) <= a_after_chi_iota(253) xor a_after_chi_iota(256) xor a_after_chi_iota(4);
 a_after_theta(8) <= a_after_chi_iota(8) xor a_after_chi_iota(11) xor a_after_chi_iota(16);
 a_after_theta(20) <= a_after_chi_iota(20) xor a_after_chi_iota(23) xor a_after_chi_iota(28);
 a_after_theta(32) <= a_after_chi_iota(32) xor a_after_chi_iota(35) xor a_after_chi_iota(40);
 a_after_theta(44) <= a_after_chi_iota(44) xor a_after_chi_iota(47) xor a_after_chi_iota(52);
 a_after_theta(68) <= a_after_chi_iota(68) xor a_after_chi_iota(71) xor a_after_chi_iota(76);
 a_after_theta(80) <= a_after_chi_iota(80) xor a_after_chi_iota(83) xor a_after_chi_iota(88);
 a_after_theta(92) <= a_after_chi_iota(92) xor a_after_chi_iota(95) xor a_after_chi_iota(100);
 a_after_theta(104) <= a_after_chi_iota(104) xor a_after_chi_iota(107) xor a_after_chi_iota(112);
 a_after_theta(116) <= a_after_chi_iota(116) xor a_after_chi_iota(119) xor a_after_chi_iota(124);
 a_after_theta(128) <= a_after_chi_iota(128) xor a_after_chi_iota(131) xor a_after_chi_iota(136);
 a_after_theta(140) <= a_after_chi_iota(140) xor a_after_chi_iota(143) xor a_after_chi_iota(148);
 a_after_theta(164) <= a_after_chi_iota(164) xor a_after_chi_iota(167) xor a_after_chi_iota(172);
 a_after_theta(176) <= a_after_chi_iota(176) xor a_after_chi_iota(179) xor a_after_chi_iota(184);
 a_after_theta(188) <= a_after_chi_iota(188) xor a_after_chi_iota(191) xor a_after_chi_iota(196);
 a_after_theta(200) <= a_after_chi_iota(200) xor a_after_chi_iota(203) xor a_after_chi_iota(208);
 a_after_theta(236) <= a_after_chi_iota(236) xor a_after_chi_iota(239) xor a_after_chi_iota(244);
 a_after_theta(248) <= a_after_chi_iota(248) xor a_after_chi_iota(251) xor a_after_chi_iota(256);
 a_after_theta(3) <= a_after_chi_iota(3) xor a_after_chi_iota(6) xor a_after_chi_iota(11);
 a_after_theta(15) <= a_after_chi_iota(15) xor a_after_chi_iota(18) xor a_after_chi_iota(23);
 a_after_theta(27) <= a_after_chi_iota(27) xor a_after_chi_iota(30) xor a_after_chi_iota(35);
 a_after_theta(39) <= a_after_chi_iota(39) xor a_after_chi_iota(42) xor a_after_chi_iota(47);
 a_after_theta(63) <= a_after_chi_iota(63) xor a_after_chi_iota(66) xor a_after_chi_iota(71);
 a_after_theta(75) <= a_after_chi_iota(75) xor a_after_chi_iota(78) xor a_after_chi_iota(83);
 a_after_theta(87) <= a_after_chi_iota(87) xor a_after_chi_iota(90) xor a_after_chi_iota(95);
 a_after_theta(99) <= a_after_chi_iota(99) xor a_after_chi_iota(102) xor a_after_chi_iota(107);
 a_after_theta(111) <= a_after_chi_iota(111) xor a_after_chi_iota(114) xor a_after_chi_iota(119);
 a_after_theta(123) <= a_after_chi_iota(123) xor a_after_chi_iota(126) xor a_after_chi_iota(131);
 a_after_theta(135) <= a_after_chi_iota(135) xor a_after_chi_iota(138) xor a_after_chi_iota(143);
 a_after_theta(147) <= a_after_chi_iota(147) xor a_after_chi_iota(150) xor a_after_chi_iota(155);
 a_after_theta(159) <= a_after_chi_iota(159) xor a_after_chi_iota(162) xor a_after_chi_iota(167);
 a_after_theta(171) <= a_after_chi_iota(171) xor a_after_chi_iota(174) xor a_after_chi_iota(179);
 a_after_theta(183) <= a_after_chi_iota(183) xor a_after_chi_iota(186) xor a_after_chi_iota(191);
 a_after_theta(195) <= a_after_chi_iota(195) xor a_after_chi_iota(198) xor a_after_chi_iota(203);
 a_after_theta(207) <= a_after_chi_iota(207) xor a_after_chi_iota(210) xor a_after_chi_iota(215);
 a_after_theta(231) <= a_after_chi_iota(231) xor a_after_chi_iota(234) xor a_after_chi_iota(239);
 a_after_theta(255) <= a_after_chi_iota(255) xor a_after_chi_iota(1) xor a_after_chi_iota(6);
 a_after_theta(10) <= a_after_chi_iota(10) xor a_after_chi_iota(13) xor a_after_chi_iota(18);
 a_after_theta(22) <= a_after_chi_iota(22) xor a_after_chi_iota(25) xor a_after_chi_iota(30);
 a_after_theta(34) <= a_after_chi_iota(34) xor a_after_chi_iota(37) xor a_after_chi_iota(42);
 a_after_theta(46) <= a_after_chi_iota(46) xor a_after_chi_iota(49) xor a_after_chi_iota(54);
 a_after_theta(58) <= a_after_chi_iota(58) xor a_after_chi_iota(61) xor a_after_chi_iota(66);
 a_after_theta(70) <= a_after_chi_iota(70) xor a_after_chi_iota(73) xor a_after_chi_iota(78);
 a_after_theta(82) <= a_after_chi_iota(82) xor a_after_chi_iota(85) xor a_after_chi_iota(90);
 a_after_theta(94) <= a_after_chi_iota(94) xor a_after_chi_iota(97) xor a_after_chi_iota(102);
 a_after_theta(118) <= a_after_chi_iota(118) xor a_after_chi_iota(121) xor a_after_chi_iota(126);
 a_after_theta(142) <= a_after_chi_iota(142) xor a_after_chi_iota(145) xor a_after_chi_iota(150);
 a_after_theta(154) <= a_after_chi_iota(154) xor a_after_chi_iota(157) xor a_after_chi_iota(162);
 a_after_theta(166) <= a_after_chi_iota(166) xor a_after_chi_iota(169) xor a_after_chi_iota(174);
 a_after_theta(178) <= a_after_chi_iota(178) xor a_after_chi_iota(181) xor a_after_chi_iota(186);
 a_after_theta(190) <= a_after_chi_iota(190) xor a_after_chi_iota(193) xor a_after_chi_iota(198);
 a_after_theta(202) <= a_after_chi_iota(202) xor a_after_chi_iota(205) xor a_after_chi_iota(210);
 a_after_theta(214) <= a_after_chi_iota(214) xor a_after_chi_iota(217) xor a_after_chi_iota(222);
 a_after_theta(226) <= a_after_chi_iota(226) xor a_after_chi_iota(229) xor a_after_chi_iota(234);
 a_after_theta(250) <= a_after_chi_iota(250) xor a_after_chi_iota(253) xor a_after_chi_iota(1);
 a_after_theta(5) <= a_after_chi_iota(5) xor a_after_chi_iota(8) xor a_after_chi_iota(13);
 a_after_theta(17) <= a_after_chi_iota(17) xor a_after_chi_iota(20) xor a_after_chi_iota(25);
 a_after_theta(29) <= a_after_chi_iota(29) xor a_after_chi_iota(32) xor a_after_chi_iota(37);
 a_after_theta(41) <= a_after_chi_iota(41) xor a_after_chi_iota(44) xor a_after_chi_iota(49);
 a_after_theta(53) <= a_after_chi_iota(53) xor a_after_chi_iota(56) xor a_after_chi_iota(61);
 a_after_theta(77) <= a_after_chi_iota(77) xor a_after_chi_iota(80) xor a_after_chi_iota(85);
 a_after_theta(89) <= a_after_chi_iota(89) xor a_after_chi_iota(92) xor a_after_chi_iota(97);
 a_after_theta(101) <= a_after_chi_iota(101) xor a_after_chi_iota(104) xor a_after_chi_iota(109);
 a_after_theta(113) <= a_after_chi_iota(113) xor a_after_chi_iota(116) xor a_after_chi_iota(121);
 a_after_theta(125) <= a_after_chi_iota(125) xor a_after_chi_iota(128) xor a_after_chi_iota(133);
 a_after_theta(137) <= a_after_chi_iota(137) xor a_after_chi_iota(140) xor a_after_chi_iota(145);
 a_after_theta(149) <= a_after_chi_iota(149) xor a_after_chi_iota(152) xor a_after_chi_iota(157);
 a_after_theta(173) <= a_after_chi_iota(173) xor a_after_chi_iota(176) xor a_after_chi_iota(181);
 a_after_theta(185) <= a_after_chi_iota(185) xor a_after_chi_iota(188) xor a_after_chi_iota(193);
 a_after_theta(197) <= a_after_chi_iota(197) xor a_after_chi_iota(200) xor a_after_chi_iota(205);
 a_after_theta(209) <= a_after_chi_iota(209) xor a_after_chi_iota(212) xor a_after_chi_iota(217);
 a_after_theta(221) <= a_after_chi_iota(221) xor a_after_chi_iota(224) xor a_after_chi_iota(229);
 a_after_theta(233) <= a_after_chi_iota(233) xor a_after_chi_iota(236) xor a_after_chi_iota(241);

-- Pi step and output

--generate
--   genvar gen_j;
--    for (gen_j <= 0; gen_j < 257; gen_j <= gen_j + 1) begin: pi_step
--         o(gen_j) <= a_after_theta((12*gen_j) % 257);
--    end
--endgenerate


a1: for j in 0 to 256 generate
   o(j) <= a_after_theta((12*j) mod 257);
   --temp(256-j) <= a_after_theta((12*j) mod 257);
end generate;
-- Extract output

 dout(0)  <= a(1)   xor a(256);
 dout(1)  <= a(176) xor a(81);
 dout(2)  <= a(136) xor a(121);
 dout(3)  <= a(35)  xor a(222);
 dout(4)  <= a(249) xor a(8);
 dout(5)  <= a(134) xor a(123);
 dout(6)  <= a(197) xor a(60);
 dout(7)  <= a(234) xor a(23);
 dout(8)  <= a(64)  xor a(193);
 dout(9)  <= a(213) xor a(44);
 dout(10) <= a(223) xor a(34);
 dout(11) <= a(184) xor a(73);
 dout(12) <= a(2)   xor a(255);
 dout(13) <= a(95)  xor a(162);
 dout(14) <= a(15)  xor a(242);
 dout(15) <= a(70)  xor a(187);
 dout(16) <= a(241) xor a(16);
 dout(17) <= a(11)  xor a(246);
 dout(18) <= a(137) xor a(120);
 dout(19) <= a(211) xor a(46);
 dout(20) <= a(128) xor a(129);
 dout(21) <= a(169) xor a(88);
 dout(22) <= a(189) xor a(68);
 dout(23) <= a(111) xor a(146);
 dout(24) <= a(4)   xor a(253);
 dout(25) <= a(190) xor a(67);
 dout(26) <= a(30)  xor a(227);
 dout(27) <= a(140) xor a(117);
 dout(28) <= a(225) xor a(32);
 dout(29) <= a(22)  xor a(235);
 dout(30) <= a(17)  xor a(240);
 dout(31) <= a(165) xor a(92);



op: for i in 0 to 31 generate
dop(i)<= dout(31-i);
end generate;

end architecture;
