(define (problem DLOG-20-30-60)
	(:domain driverlog)
	(:objects
	driver1 - driver
	driver2 - driver
	driver3 - driver
	driver4 - driver
	driver5 - driver
	driver6 - driver
	driver7 - driver
	driver8 - driver
	driver9 - driver
	driver10 - driver
	driver11 - driver
	driver12 - driver
	driver13 - driver
	driver14 - driver
	driver15 - driver
	driver16 - driver
	driver17 - driver
	driver18 - driver
	driver19 - driver
	driver20 - driver
	truck1 - truck
	truck2 - truck
	truck3 - truck
	truck4 - truck
	truck5 - truck
	truck6 - truck
	truck7 - truck
	truck8 - truck
	truck9 - truck
	truck10 - truck
	truck11 - truck
	truck12 - truck
	truck13 - truck
	truck14 - truck
	truck15 - truck
	truck16 - truck
	truck17 - truck
	truck18 - truck
	truck19 - truck
	truck20 - truck
	truck21 - truck
	truck22 - truck
	truck23 - truck
	truck24 - truck
	truck25 - truck
	truck26 - truck
	truck27 - truck
	truck28 - truck
	truck29 - truck
	truck30 - truck
	package1 - obj
	package2 - obj
	package3 - obj
	package4 - obj
	package5 - obj
	package6 - obj
	package7 - obj
	package8 - obj
	package9 - obj
	package10 - obj
	package11 - obj
	package12 - obj
	package13 - obj
	package14 - obj
	package15 - obj
	package16 - obj
	package17 - obj
	package18 - obj
	package19 - obj
	package20 - obj
	package21 - obj
	package22 - obj
	package23 - obj
	package24 - obj
	package25 - obj
	package26 - obj
	package27 - obj
	package28 - obj
	package29 - obj
	package30 - obj
	package31 - obj
	package32 - obj
	package33 - obj
	package34 - obj
	package35 - obj
	package36 - obj
	package37 - obj
	package38 - obj
	package39 - obj
	package40 - obj
	package41 - obj
	package42 - obj
	package43 - obj
	package44 - obj
	package45 - obj
	package46 - obj
	package47 - obj
	package48 - obj
	package49 - obj
	package50 - obj
	package51 - obj
	package52 - obj
	package53 - obj
	package54 - obj
	package55 - obj
	package56 - obj
	package57 - obj
	package58 - obj
	package59 - obj
	package60 - obj
	s0 - location
	s1 - location
	s2 - location
	s3 - location
	s4 - location
	s5 - location
	s6 - location
	s7 - location
	s8 - location
	s9 - location
	s10 - location
	s11 - location
	s12 - location
	s13 - location
	s14 - location
	s15 - location
	s16 - location
	s17 - location
	s18 - location
	s19 - location
	s20 - location
	s21 - location
	s22 - location
	s23 - location
	s24 - location
	s25 - location
	s26 - location
	s27 - location
	s28 - location
	s29 - location
	s30 - location
	s31 - location
	s32 - location
	s33 - location
	s34 - location
	s35 - location
	s36 - location
	s37 - location
	s38 - location
	s39 - location
	s40 - location
	s41 - location
	s42 - location
	s43 - location
	s44 - location
	s45 - location
	s46 - location
	s47 - location
	s48 - location
	s49 - location
	s50 - location
	s51 - location
	s52 - location
	s53 - location
	s54 - location
	s55 - location
	s56 - location
	s57 - location
	s58 - location
	s59 - location
	p0-6 - location
	p0-16 - location
	p0-38 - location
	p0-59 - location
	p1-13 - location
	p2-5 - location
	p2-7 - location
	p2-9 - location
	p2-16 - location
	p3-2 - location
	p3-17 - location
	p3-51 - location
	p3-58 - location
	p4-10 - location
	p4-36 - location
	p5-0 - location
	p5-44 - location
	p5-55 - location
	p6-3 - location
	p6-8 - location
	p6-23 - location
	p6-39 - location
	p7-18 - location
	p7-20 - location
	p7-28 - location
	p7-40 - location
	p7-42 - location
	p8-9 - location
	p8-11 - location
	p8-22 - location
	p8-28 - location
	p8-31 - location
	p10-3 - location
	p11-22 - location
	p11-28 - location
	p11-29 - location
	p11-33 - location
	p12-16 - location
	p12-27 - location
	p12-46 - location
	p13-36 - location
	p13-50 - location
	p14-49 - location
	p14-59 - location
	p15-40 - location
	p15-53 - location
	p16-40 - location
	p17-49 - location
	p19-21 - location
	p19-38 - location
	p19-41 - location
	p20-4 - location
	p20-18 - location
	p21-43 - location
	p22-14 - location
	p22-19 - location
	p22-53 - location
	p23-54 - location
	p24-1 - location
	p24-22 - location
	p25-17 - location
	p25-57 - location
	p26-12 - location
	p27-1 - location
	p27-35 - location
	p27-52 - location
	p28-3 - location
	p29-5 - location
	p29-30 - location
	p29-48 - location
	p30-32 - location
	p30-35 - location
	p31-24 - location
	p31-58 - location
	p32-5 - location
	p32-45 - location
	p32-50 - location
	p33-6 - location
	p33-41 - location
	p34-55 - location
	p35-20 - location
	p35-43 - location
	p35-44 - location
	p39-20 - location
	p39-38 - location
	p39-40 - location
	p40-12 - location
	p40-33 - location
	p41-21 - location
	p41-28 - location
	p41-34 - location
	p42-21 - location
	p42-25 - location
	p43-12 - location
	p43-26 - location
	p43-27 - location
	p43-47 - location
	p43-58 - location
	p44-6 - location
	p45-49 - location
	p45-50 - location
	p46-0 - location
	p46-52 - location
	p47-26 - location
	p47-50 - location
	p48-2 - location
	p49-6 - location
	p49-18 - location
	p50-4 - location
	p50-27 - location
	p50-43 - location
	p51-40 - location
	p51-59 - location
	p52-6 - location
	p52-15 - location
	p52-22 - location
	p52-37 - location
	p52-56 - location
	p53-12 - location
	p55-22 - location
	p55-33 - location
	p56-14 - location
	p58-51 - location
	)
	(:init
	(at driver1 s10)
	(at driver2 s43)
	(at driver3 s21)
	(at driver4 s58)
	(at driver5 s1)
	(at driver6 s38)
	(at driver7 s22)
	(at driver8 s15)
	(at driver9 s1)
	(at driver10 s49)
	(at driver11 s14)
	(at driver12 s20)
	(at driver13 s27)
	(at driver14 s51)
	(at driver15 s9)
	(at driver16 s3)
	(at driver17 s3)
	(at driver18 s20)
	(at driver19 s39)
	(at driver20 s49)
	(at truck1 s6)
	(empty truck1)
	(at truck2 s58)
	(empty truck2)
	(at truck3 s23)
	(empty truck3)
	(at truck4 s21)
	(empty truck4)
	(at truck5 s2)
	(empty truck5)
	(at truck6 s49)
	(empty truck6)
	(at truck7 s37)
	(empty truck7)
	(at truck8 s27)
	(empty truck8)
	(at truck9 s40)
	(empty truck9)
	(at truck10 s59)
	(empty truck10)
	(at truck11 s0)
	(empty truck11)
	(at truck12 s54)
	(empty truck12)
	(at truck13 s23)
	(empty truck13)
	(at truck14 s50)
	(empty truck14)
	(at truck15 s13)
	(empty truck15)
	(at truck16 s34)
	(empty truck16)
	(at truck17 s30)
	(empty truck17)
	(at truck18 s24)
	(empty truck18)
	(at truck19 s33)
	(empty truck19)
	(at truck20 s57)
	(empty truck20)
	(at truck21 s25)
	(empty truck21)
	(at truck22 s13)
	(empty truck22)
	(at truck23 s40)
	(empty truck23)
	(at truck24 s15)
	(empty truck24)
	(at truck25 s48)
	(empty truck25)
	(at truck26 s29)
	(empty truck26)
	(at truck27 s21)
	(empty truck27)
	(at truck28 s28)
	(empty truck28)
	(at truck29 s10)
	(empty truck29)
	(at truck30 s6)
	(empty truck30)
	(at package1 s6)
	(at package2 s16)
	(at package3 s35)
	(at package4 s26)
	(at package5 s11)
	(at package6 s51)
	(at package7 s17)
	(at package8 s5)
	(at package9 s43)
	(at package10 s51)
	(at package11 s29)
	(at package12 s37)
	(at package13 s9)
	(at package14 s29)
	(at package15 s27)
	(at package16 s18)
	(at package17 s36)
	(at package18 s51)
	(at package19 s26)
	(at package20 s56)
	(at package21 s18)
	(at package22 s56)
	(at package23 s5)
	(at package24 s26)
	(at package25 s13)
	(at package26 s15)
	(at package27 s1)
	(at package28 s53)
	(at package29 s18)
	(at package30 s28)
	(at package31 s28)
	(at package32 s24)
	(at package33 s34)
	(at package34 s34)
	(at package35 s50)
	(at package36 s33)
	(at package37 s35)
	(at package38 s14)
	(at package39 s34)
	(at package40 s19)
	(at package41 s21)
	(at package42 s9)
	(at package43 s20)
	(at package44 s4)
	(at package45 s50)
	(at package46 s5)
	(at package47 s9)
	(at package48 s37)
	(at package49 s23)
	(at package50 s51)
	(at package51 s0)
	(at package52 s8)
	(at package53 s11)
	(at package54 s14)
	(at package55 s46)
	(at package56 s58)
	(at package57 s6)
	(at package58 s13)
	(at package59 s11)
	(at package60 s18)
	(path s0 p0-6)
	(path p0-6 s0)
	(path s6 p0-6)
	(path p0-6 s6)
	(path s0 p0-16)
	(path p0-16 s0)
	(path s16 p0-16)
	(path p0-16 s16)
	(path s0 p0-38)
	(path p0-38 s0)
	(path s38 p0-38)
	(path p0-38 s38)
	(path s0 p0-59)
	(path p0-59 s0)
	(path s59 p0-59)
	(path p0-59 s59)
	(path s1 p1-13)
	(path p1-13 s1)
	(path s13 p1-13)
	(path p1-13 s13)
	(path s2 p2-5)
	(path p2-5 s2)
	(path s5 p2-5)
	(path p2-5 s5)
	(path s2 p2-7)
	(path p2-7 s2)
	(path s7 p2-7)
	(path p2-7 s7)
	(path s2 p2-9)
	(path p2-9 s2)
	(path s9 p2-9)
	(path p2-9 s9)
	(path s2 p2-16)
	(path p2-16 s2)
	(path s16 p2-16)
	(path p2-16 s16)
	(path s3 p3-2)
	(path p3-2 s3)
	(path s2 p3-2)
	(path p3-2 s2)
	(path s3 p3-17)
	(path p3-17 s3)
	(path s17 p3-17)
	(path p3-17 s17)
	(path s3 p3-51)
	(path p3-51 s3)
	(path s51 p3-51)
	(path p3-51 s51)
	(path s3 p3-58)
	(path p3-58 s3)
	(path s58 p3-58)
	(path p3-58 s58)
	(path s4 p4-10)
	(path p4-10 s4)
	(path s10 p4-10)
	(path p4-10 s10)
	(path s4 p4-36)
	(path p4-36 s4)
	(path s36 p4-36)
	(path p4-36 s36)
	(path s5 p5-0)
	(path p5-0 s5)
	(path s0 p5-0)
	(path p5-0 s0)
	(path s5 p5-44)
	(path p5-44 s5)
	(path s44 p5-44)
	(path p5-44 s44)
	(path s5 p5-55)
	(path p5-55 s5)
	(path s55 p5-55)
	(path p5-55 s55)
	(path s6 p6-3)
	(path p6-3 s6)
	(path s3 p6-3)
	(path p6-3 s3)
	(path s6 p6-8)
	(path p6-8 s6)
	(path s8 p6-8)
	(path p6-8 s8)
	(path s6 p6-23)
	(path p6-23 s6)
	(path s23 p6-23)
	(path p6-23 s23)
	(path s6 p6-39)
	(path p6-39 s6)
	(path s39 p6-39)
	(path p6-39 s39)
	(path s7 p7-18)
	(path p7-18 s7)
	(path s18 p7-18)
	(path p7-18 s18)
	(path s7 p7-20)
	(path p7-20 s7)
	(path s20 p7-20)
	(path p7-20 s20)
	(path s7 p7-28)
	(path p7-28 s7)
	(path s28 p7-28)
	(path p7-28 s28)
	(path s7 p7-40)
	(path p7-40 s7)
	(path s40 p7-40)
	(path p7-40 s40)
	(path s7 p7-42)
	(path p7-42 s7)
	(path s42 p7-42)
	(path p7-42 s42)
	(path s8 p8-9)
	(path p8-9 s8)
	(path s9 p8-9)
	(path p8-9 s9)
	(path s8 p8-11)
	(path p8-11 s8)
	(path s11 p8-11)
	(path p8-11 s11)
	(path s8 p8-22)
	(path p8-22 s8)
	(path s22 p8-22)
	(path p8-22 s22)
	(path s8 p8-28)
	(path p8-28 s8)
	(path s28 p8-28)
	(path p8-28 s28)
	(path s8 p8-31)
	(path p8-31 s8)
	(path s31 p8-31)
	(path p8-31 s31)
	(path s10 p10-3)
	(path p10-3 s10)
	(path s3 p10-3)
	(path p10-3 s3)
	(path s11 p11-22)
	(path p11-22 s11)
	(path s22 p11-22)
	(path p11-22 s22)
	(path s11 p11-28)
	(path p11-28 s11)
	(path s28 p11-28)
	(path p11-28 s28)
	(path s11 p11-29)
	(path p11-29 s11)
	(path s29 p11-29)
	(path p11-29 s29)
	(path s11 p11-33)
	(path p11-33 s11)
	(path s33 p11-33)
	(path p11-33 s33)
	(path s12 p12-16)
	(path p12-16 s12)
	(path s16 p12-16)
	(path p12-16 s16)
	(path s12 p12-27)
	(path p12-27 s12)
	(path s27 p12-27)
	(path p12-27 s27)
	(path s12 p12-46)
	(path p12-46 s12)
	(path s46 p12-46)
	(path p12-46 s46)
	(path s13 p13-36)
	(path p13-36 s13)
	(path s36 p13-36)
	(path p13-36 s36)
	(path s13 p13-50)
	(path p13-50 s13)
	(path s50 p13-50)
	(path p13-50 s50)
	(path s14 p14-49)
	(path p14-49 s14)
	(path s49 p14-49)
	(path p14-49 s49)
	(path s14 p14-59)
	(path p14-59 s14)
	(path s59 p14-59)
	(path p14-59 s59)
	(path s15 p15-40)
	(path p15-40 s15)
	(path s40 p15-40)
	(path p15-40 s40)
	(path s15 p15-53)
	(path p15-53 s15)
	(path s53 p15-53)
	(path p15-53 s53)
	(path s16 p16-40)
	(path p16-40 s16)
	(path s40 p16-40)
	(path p16-40 s40)
	(path s17 p17-49)
	(path p17-49 s17)
	(path s49 p17-49)
	(path p17-49 s49)
	(path s19 p19-21)
	(path p19-21 s19)
	(path s21 p19-21)
	(path p19-21 s21)
	(path s19 p19-38)
	(path p19-38 s19)
	(path s38 p19-38)
	(path p19-38 s38)
	(path s19 p19-41)
	(path p19-41 s19)
	(path s41 p19-41)
	(path p19-41 s41)
	(path s20 p20-4)
	(path p20-4 s20)
	(path s4 p20-4)
	(path p20-4 s4)
	(path s20 p20-18)
	(path p20-18 s20)
	(path s18 p20-18)
	(path p20-18 s18)
	(path s21 p21-43)
	(path p21-43 s21)
	(path s43 p21-43)
	(path p21-43 s43)
	(path s22 p22-14)
	(path p22-14 s22)
	(path s14 p22-14)
	(path p22-14 s14)
	(path s22 p22-19)
	(path p22-19 s22)
	(path s19 p22-19)
	(path p22-19 s19)
	(path s22 p22-53)
	(path p22-53 s22)
	(path s53 p22-53)
	(path p22-53 s53)
	(path s23 p23-54)
	(path p23-54 s23)
	(path s54 p23-54)
	(path p23-54 s54)
	(path s24 p24-1)
	(path p24-1 s24)
	(path s1 p24-1)
	(path p24-1 s1)
	(path s24 p24-22)
	(path p24-22 s24)
	(path s22 p24-22)
	(path p24-22 s22)
	(path s25 p25-17)
	(path p25-17 s25)
	(path s17 p25-17)
	(path p25-17 s17)
	(path s25 p25-57)
	(path p25-57 s25)
	(path s57 p25-57)
	(path p25-57 s57)
	(path s26 p26-12)
	(path p26-12 s26)
	(path s12 p26-12)
	(path p26-12 s12)
	(path s27 p27-1)
	(path p27-1 s27)
	(path s1 p27-1)
	(path p27-1 s1)
	(path s27 p27-35)
	(path p27-35 s27)
	(path s35 p27-35)
	(path p27-35 s35)
	(path s27 p27-52)
	(path p27-52 s27)
	(path s52 p27-52)
	(path p27-52 s52)
	(path s28 p28-3)
	(path p28-3 s28)
	(path s3 p28-3)
	(path p28-3 s3)
	(path s29 p29-5)
	(path p29-5 s29)
	(path s5 p29-5)
	(path p29-5 s5)
	(path s29 p29-30)
	(path p29-30 s29)
	(path s30 p29-30)
	(path p29-30 s30)
	(path s29 p29-48)
	(path p29-48 s29)
	(path s48 p29-48)
	(path p29-48 s48)
	(path s30 p30-32)
	(path p30-32 s30)
	(path s32 p30-32)
	(path p30-32 s32)
	(path s30 p30-35)
	(path p30-35 s30)
	(path s35 p30-35)
	(path p30-35 s35)
	(path s31 p31-24)
	(path p31-24 s31)
	(path s24 p31-24)
	(path p31-24 s24)
	(path s31 p31-58)
	(path p31-58 s31)
	(path s58 p31-58)
	(path p31-58 s58)
	(path s32 p32-5)
	(path p32-5 s32)
	(path s5 p32-5)
	(path p32-5 s5)
	(path s32 p32-45)
	(path p32-45 s32)
	(path s45 p32-45)
	(path p32-45 s45)
	(path s32 p32-50)
	(path p32-50 s32)
	(path s50 p32-50)
	(path p32-50 s50)
	(path s33 p33-6)
	(path p33-6 s33)
	(path s6 p33-6)
	(path p33-6 s6)
	(path s33 p33-41)
	(path p33-41 s33)
	(path s41 p33-41)
	(path p33-41 s41)
	(path s34 p34-55)
	(path p34-55 s34)
	(path s55 p34-55)
	(path p34-55 s55)
	(path s35 p35-20)
	(path p35-20 s35)
	(path s20 p35-20)
	(path p35-20 s20)
	(path s35 p35-43)
	(path p35-43 s35)
	(path s43 p35-43)
	(path p35-43 s43)
	(path s35 p35-44)
	(path p35-44 s35)
	(path s44 p35-44)
	(path p35-44 s44)
	(path s39 p39-20)
	(path p39-20 s39)
	(path s20 p39-20)
	(path p39-20 s20)
	(path s39 p39-38)
	(path p39-38 s39)
	(path s38 p39-38)
	(path p39-38 s38)
	(path s39 p39-40)
	(path p39-40 s39)
	(path s40 p39-40)
	(path p39-40 s40)
	(path s40 p40-12)
	(path p40-12 s40)
	(path s12 p40-12)
	(path p40-12 s12)
	(path s40 p40-33)
	(path p40-33 s40)
	(path s33 p40-33)
	(path p40-33 s33)
	(path s41 p41-21)
	(path p41-21 s41)
	(path s21 p41-21)
	(path p41-21 s21)
	(path s41 p41-28)
	(path p41-28 s41)
	(path s28 p41-28)
	(path p41-28 s28)
	(path s41 p41-34)
	(path p41-34 s41)
	(path s34 p41-34)
	(path p41-34 s34)
	(path s42 p42-21)
	(path p42-21 s42)
	(path s21 p42-21)
	(path p42-21 s21)
	(path s42 p42-25)
	(path p42-25 s42)
	(path s25 p42-25)
	(path p42-25 s25)
	(path s43 p43-12)
	(path p43-12 s43)
	(path s12 p43-12)
	(path p43-12 s12)
	(path s43 p43-26)
	(path p43-26 s43)
	(path s26 p43-26)
	(path p43-26 s26)
	(path s43 p43-27)
	(path p43-27 s43)
	(path s27 p43-27)
	(path p43-27 s27)
	(path s43 p43-47)
	(path p43-47 s43)
	(path s47 p43-47)
	(path p43-47 s47)
	(path s43 p43-58)
	(path p43-58 s43)
	(path s58 p43-58)
	(path p43-58 s58)
	(path s44 p44-6)
	(path p44-6 s44)
	(path s6 p44-6)
	(path p44-6 s6)
	(path s45 p45-49)
	(path p45-49 s45)
	(path s49 p45-49)
	(path p45-49 s49)
	(path s45 p45-50)
	(path p45-50 s45)
	(path s50 p45-50)
	(path p45-50 s50)
	(path s46 p46-0)
	(path p46-0 s46)
	(path s0 p46-0)
	(path p46-0 s0)
	(path s46 p46-52)
	(path p46-52 s46)
	(path s52 p46-52)
	(path p46-52 s52)
	(path s47 p47-26)
	(path p47-26 s47)
	(path s26 p47-26)
	(path p47-26 s26)
	(path s47 p47-50)
	(path p47-50 s47)
	(path s50 p47-50)
	(path p47-50 s50)
	(path s48 p48-2)
	(path p48-2 s48)
	(path s2 p48-2)
	(path p48-2 s2)
	(path s49 p49-6)
	(path p49-6 s49)
	(path s6 p49-6)
	(path p49-6 s6)
	(path s49 p49-18)
	(path p49-18 s49)
	(path s18 p49-18)
	(path p49-18 s18)
	(path s50 p50-4)
	(path p50-4 s50)
	(path s4 p50-4)
	(path p50-4 s4)
	(path s50 p50-27)
	(path p50-27 s50)
	(path s27 p50-27)
	(path p50-27 s27)
	(path s50 p50-43)
	(path p50-43 s50)
	(path s43 p50-43)
	(path p50-43 s43)
	(path s51 p51-40)
	(path p51-40 s51)
	(path s40 p51-40)
	(path p51-40 s40)
	(path s51 p51-59)
	(path p51-59 s51)
	(path s59 p51-59)
	(path p51-59 s59)
	(path s52 p52-6)
	(path p52-6 s52)
	(path s6 p52-6)
	(path p52-6 s6)
	(path s52 p52-15)
	(path p52-15 s52)
	(path s15 p52-15)
	(path p52-15 s15)
	(path s52 p52-22)
	(path p52-22 s52)
	(path s22 p52-22)
	(path p52-22 s22)
	(path s52 p52-37)
	(path p52-37 s52)
	(path s37 p52-37)
	(path p52-37 s37)
	(path s52 p52-56)
	(path p52-56 s52)
	(path s56 p52-56)
	(path p52-56 s56)
	(path s53 p53-12)
	(path p53-12 s53)
	(path s12 p53-12)
	(path p53-12 s12)
	(path s55 p55-22)
	(path p55-22 s55)
	(path s22 p55-22)
	(path p55-22 s22)
	(path s55 p55-33)
	(path p55-33 s55)
	(path s33 p55-33)
	(path p55-33 s33)
	(path s56 p56-14)
	(path p56-14 s56)
	(path s14 p56-14)
	(path p56-14 s14)
	(path s58 p58-51)
	(path p58-51 s58)
	(path s51 p58-51)
	(path p58-51 s51)
	(link s0 s7)
	(link s7 s0)
	(link s0 s32)
	(link s32 s0)
	(link s0 s36)
	(link s36 s0)
	(link s0 s40)
	(link s40 s0)
	(link s0 s42)
	(link s42 s0)
	(link s1 s18)
	(link s18 s1)
	(link s1 s53)
	(link s53 s1)
	(link s2 s15)
	(link s15 s2)
	(link s2 s17)
	(link s17 s2)
	(link s2 s32)
	(link s32 s2)
	(link s2 s45)
	(link s45 s2)
	(link s3 s1)
	(link s1 s3)
	(link s3 s54)
	(link s54 s3)
	(link s4 s11)
	(link s11 s4)
	(link s4 s13)
	(link s13 s4)
	(link s4 s15)
	(link s15 s4)
	(link s5 s2)
	(link s2 s5)
	(link s5 s33)
	(link s33 s5)
	(link s6 s4)
	(link s4 s6)
	(link s6 s7)
	(link s7 s6)
	(link s6 s21)
	(link s21 s6)
	(link s6 s36)
	(link s36 s6)
	(link s7 s9)
	(link s9 s7)
	(link s7 s17)
	(link s17 s7)
	(link s7 s41)
	(link s41 s7)
	(link s7 s46)
	(link s46 s7)
	(link s7 s55)
	(link s55 s7)
	(link s8 s32)
	(link s32 s8)
	(link s8 s51)
	(link s51 s8)
	(link s9 s19)
	(link s19 s9)
	(link s9 s30)
	(link s30 s9)
	(link s9 s38)
	(link s38 s9)
	(link s9 s48)
	(link s48 s9)
	(link s9 s57)
	(link s57 s9)
	(link s10 s1)
	(link s1 s10)
	(link s10 s7)
	(link s7 s10)
	(link s10 s15)
	(link s15 s10)
	(link s10 s52)
	(link s52 s10)
	(link s11 s8)
	(link s8 s11)
	(link s11 s18)
	(link s18 s11)
	(link s11 s57)
	(link s57 s11)
	(link s12 s41)
	(link s41 s12)
	(link s12 s43)
	(link s43 s12)
	(link s12 s49)
	(link s49 s12)
	(link s12 s53)
	(link s53 s12)
	(link s12 s54)
	(link s54 s12)
	(link s12 s56)
	(link s56 s12)
	(link s13 s10)
	(link s10 s13)
	(link s13 s12)
	(link s12 s13)
	(link s13 s19)
	(link s19 s13)
	(link s13 s27)
	(link s27 s13)
	(link s13 s38)
	(link s38 s13)
	(link s13 s47)
	(link s47 s13)
	(link s14 s39)
	(link s39 s14)
	(link s14 s55)
	(link s55 s14)
	(link s15 s18)
	(link s18 s15)
	(link s15 s34)
	(link s34 s15)
	(link s15 s58)
	(link s58 s15)
	(link s16 s5)
	(link s5 s16)
	(link s16 s6)
	(link s6 s16)
	(link s16 s25)
	(link s25 s16)
	(link s16 s27)
	(link s27 s16)
	(link s16 s38)
	(link s38 s16)
	(link s16 s44)
	(link s44 s16)
	(link s16 s45)
	(link s45 s16)
	(link s17 s14)
	(link s14 s17)
	(link s17 s28)
	(link s28 s17)
	(link s17 s29)
	(link s29 s17)
	(link s17 s39)
	(link s39 s17)
	(link s17 s53)
	(link s53 s17)
	(link s18 s6)
	(link s6 s18)
	(link s18 s33)
	(link s33 s18)
	(link s18 s43)
	(link s43 s18)
	(link s19 s16)
	(link s16 s19)
	(link s20 s13)
	(link s13 s20)
	(link s20 s41)
	(link s41 s20)
	(link s21 s5)
	(link s5 s21)
	(link s21 s35)
	(link s35 s21)
	(link s22 s28)
	(link s28 s22)
	(link s22 s32)
	(link s32 s22)
	(link s22 s35)
	(link s35 s22)
	(link s23 s33)
	(link s33 s23)
	(link s24 s12)
	(link s12 s24)
	(link s24 s34)
	(link s34 s24)
	(link s25 s4)
	(link s4 s25)
	(link s25 s10)
	(link s10 s25)
	(link s25 s15)
	(link s15 s25)
	(link s25 s31)
	(link s31 s25)
	(link s26 s21)
	(link s21 s26)
	(link s26 s34)
	(link s34 s26)
	(link s26 s35)
	(link s35 s26)
	(link s26 s38)
	(link s38 s26)
	(link s26 s57)
	(link s57 s26)
	(link s27 s8)
	(link s8 s27)
	(link s27 s14)
	(link s14 s27)
	(link s27 s17)
	(link s17 s27)
	(link s27 s18)
	(link s18 s27)
	(link s27 s23)
	(link s23 s27)
	(link s27 s35)
	(link s35 s27)
	(link s27 s52)
	(link s52 s27)
	(link s28 s7)
	(link s7 s28)
	(link s28 s20)
	(link s20 s28)
	(link s28 s33)
	(link s33 s28)
	(link s28 s40)
	(link s40 s28)
	(link s28 s51)
	(link s51 s28)
	(link s29 s8)
	(link s8 s29)
	(link s29 s15)
	(link s15 s29)
	(link s29 s21)
	(link s21 s29)
	(link s29 s42)
	(link s42 s29)
	(link s29 s52)
	(link s52 s29)
	(link s30 s3)
	(link s3 s30)
	(link s30 s21)
	(link s21 s30)
	(link s30 s28)
	(link s28 s30)
	(link s31 s1)
	(link s1 s31)
	(link s31 s12)
	(link s12 s31)
	(link s31 s14)
	(link s14 s31)
	(link s31 s26)
	(link s26 s31)
	(link s31 s33)
	(link s33 s31)
	(link s31 s37)
	(link s37 s31)
	(link s31 s39)
	(link s39 s31)
	(link s31 s57)
	(link s57 s31)
	(link s32 s3)
	(link s3 s32)
	(link s32 s11)
	(link s11 s32)
	(link s32 s16)
	(link s16 s32)
	(link s32 s25)
	(link s25 s32)
	(link s32 s26)
	(link s26 s32)
	(link s32 s44)
	(link s44 s32)
	(link s32 s57)
	(link s57 s32)
	(link s33 s12)
	(link s12 s33)
	(link s33 s14)
	(link s14 s33)
	(link s33 s15)
	(link s15 s33)
	(link s33 s36)
	(link s36 s33)
	(link s33 s40)
	(link s40 s33)
	(link s33 s50)
	(link s50 s33)
	(link s34 s22)
	(link s22 s34)
	(link s34 s50)
	(link s50 s34)
	(link s34 s59)
	(link s59 s34)
	(link s35 s40)
	(link s40 s35)
	(link s35 s41)
	(link s41 s35)
	(link s35 s45)
	(link s45 s35)
	(link s35 s52)
	(link s52 s35)
	(link s35 s55)
	(link s55 s35)
	(link s36 s10)
	(link s10 s36)
	(link s36 s19)
	(link s19 s36)
	(link s36 s24)
	(link s24 s36)
	(link s36 s25)
	(link s25 s36)
	(link s36 s26)
	(link s26 s36)
	(link s36 s34)
	(link s34 s36)
	(link s36 s53)
	(link s53 s36)
	(link s36 s56)
	(link s56 s36)
	(link s37 s25)
	(link s25 s37)
	(link s37 s34)
	(link s34 s37)
	(link s37 s43)
	(link s43 s37)
	(link s38 s23)
	(link s23 s38)
	(link s38 s30)
	(link s30 s38)
	(link s38 s45)
	(link s45 s38)
	(link s38 s56)
	(link s56 s38)
	(link s39 s3)
	(link s3 s39)
	(link s39 s34)
	(link s34 s39)
	(link s39 s52)
	(link s52 s39)
	(link s40 s25)
	(link s25 s40)
	(link s40 s54)
	(link s54 s40)
	(link s40 s59)
	(link s59 s40)
	(link s41 s13)
	(link s13 s41)
	(link s41 s24)
	(link s24 s41)
	(link s41 s49)
	(link s49 s41)
	(link s42 s50)
	(link s50 s42)
	(link s42 s56)
	(link s56 s42)
	(link s43 s22)
	(link s22 s43)
	(link s43 s27)
	(link s27 s43)
	(link s43 s55)
	(link s55 s43)
	(link s43 s59)
	(link s59 s43)
	(link s44 s28)
	(link s28 s44)
	(link s44 s42)
	(link s42 s44)
	(link s44 s59)
	(link s59 s44)
	(link s45 s8)
	(link s8 s45)
	(link s45 s23)
	(link s23 s45)
	(link s45 s28)
	(link s28 s45)
	(link s45 s29)
	(link s29 s45)
	(link s45 s40)
	(link s40 s45)
	(link s46 s3)
	(link s3 s46)
	(link s46 s16)
	(link s16 s46)
	(link s46 s42)
	(link s42 s46)
	(link s46 s59)
	(link s59 s46)
	(link s47 s24)
	(link s24 s47)
	(link s47 s36)
	(link s36 s47)
	(link s47 s49)
	(link s49 s47)
	(link s48 s16)
	(link s16 s48)
	(link s48 s18)
	(link s18 s48)
	(link s48 s33)
	(link s33 s48)
	(link s48 s55)
	(link s55 s48)
	(link s49 s2)
	(link s2 s49)
	(link s49 s27)
	(link s27 s49)
	(link s50 s19)
	(link s19 s50)
	(link s50 s30)
	(link s30 s50)
	(link s50 s41)
	(link s41 s50)
	(link s50 s48)
	(link s48 s50)
	(link s51 s0)
	(link s0 s51)
	(link s51 s12)
	(link s12 s51)
	(link s51 s20)
	(link s20 s51)
	(link s51 s26)
	(link s26 s51)
	(link s51 s45)
	(link s45 s51)
	(link s52 s19)
	(link s19 s52)
	(link s52 s45)
	(link s45 s52)
	(link s53 s9)
	(link s9 s53)
	(link s53 s15)
	(link s15 s53)
	(link s53 s42)
	(link s42 s53)
	(link s53 s44)
	(link s44 s53)
	(link s53 s48)
	(link s48 s53)
	(link s53 s58)
	(link s58 s53)
	(link s54 s5)
	(link s5 s54)
	(link s54 s14)
	(link s14 s54)
	(link s55 s33)
	(link s33 s55)
	(link s56 s8)
	(link s8 s56)
	(link s56 s44)
	(link s44 s56)
	(link s56 s46)
	(link s46 s56)
	(link s57 s8)
	(link s8 s57)
	(link s57 s41)
	(link s41 s57)
	(link s57 s43)
	(link s43 s57)
	(link s57 s54)
	(link s54 s57)
	(link s58 s1)
	(link s1 s58)
	(link s59 s4)
	(link s4 s59)
	(link s59 s48)
	(link s48 s59)
	(link s59 s50)
	(link s50 s59)
)
	(:goal (and
	(at driver3 s33)
	(at driver4 s43)
	(at driver5 s6)
	(at driver6 s59)
	(at driver8 s22)
	(at driver11 s52)
	(at driver12 s35)
	(at driver13 s57)
	(at driver14 s55)
	(at driver15 s57)
	(at driver16 s35)
	(at driver17 s58)
	(at driver19 s15)
	(at truck1 s19)
	(at truck2 s39)
	(at truck3 s7)
	(at truck4 s58)
	(at truck5 s8)
	(at truck6 s11)
	(at truck7 s14)
	(at truck9 s14)
	(at truck10 s3)
	(at truck11 s10)
	(at truck12 s8)
	(at truck13 s32)
	(at truck14 s53)
	(at truck15 s55)
	(at truck16 s45)
	(at truck18 s49)
	(at truck19 s30)
	(at truck20 s29)
	(at truck22 s24)
	(at truck23 s47)
	(at truck24 s38)
	(at truck25 s52)
	(at truck26 s26)
	(at truck27 s56)
	(at truck28 s21)
	(at truck30 s51)
	(at package1 s17)
	(at package2 s30)
	(at package3 s11)
	(at package4 s26)
	(at package5 s14)
	(at package6 s43)
	(at package7 s5)
	(at package8 s33)
	(at package9 s44)
	(at package10 s50)
	(at package11 s56)
	(at package12 s13)
	(at package13 s49)
	(at package14 s16)
	(at package16 s19)
	(at package17 s36)
	(at package18 s41)
	(at package19 s25)
	(at package20 s16)
	(at package21 s46)
	(at package22 s23)
	(at package23 s32)
	(at package24 s1)
	(at package25 s29)
	(at package27 s25)
	(at package28 s16)
	(at package29 s43)
	(at package31 s58)
	(at package32 s55)
	(at package33 s1)
	(at package34 s27)
	(at package35 s40)
	(at package36 s56)
	(at package37 s58)
	(at package38 s51)
	(at package39 s9)
	(at package40 s37)
	(at package41 s5)
	(at package43 s5)
	(at package44 s40)
	(at package45 s30)
	(at package46 s3)
	(at package47 s38)
	(at package48 s52)
	(at package49 s27)
	(at package50 s46)
	(at package51 s8)
	(at package52 s17)
	(at package53 s38)
	(at package54 s42)
	(at package55 s32)
	(at package56 s38)
	(at package57 s47)
	(at package58 s25)
	(at package59 s48)
	(at package60 s40)
	))

(:metric minimize (total-time))

)
