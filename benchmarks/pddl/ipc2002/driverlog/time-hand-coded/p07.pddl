(define (problem DLOG-30-30-60)
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
	driver21 - driver
	driver22 - driver
	driver23 - driver
	driver24 - driver
	driver25 - driver
	driver26 - driver
	driver27 - driver
	driver28 - driver
	driver29 - driver
	driver30 - driver
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
	p0-5 - location
	p0-18 - location
	p1-10 - location
	p1-12 - location
	p3-7 - location
	p3-15 - location
	p3-29 - location
	p4-1 - location
	p4-8 - location
	p4-9 - location
	p4-17 - location
	p4-20 - location
	p4-28 - location
	p5-4 - location
	p5-7 - location
	p5-22 - location
	p6-0 - location
	p6-25 - location
	p6-27 - location
	p7-22 - location
	p7-25 - location
	p8-3 - location
	p8-13 - location
	p8-14 - location
	p9-6 - location
	p10-20 - location
	p11-16 - location
	p13-6 - location
	p14-9 - location
	p14-12 - location
	p15-17 - location
	p15-20 - location
	p15-21 - location
	p15-26 - location
	p16-19 - location
	p16-22 - location
	p16-24 - location
	p18-3 - location
	p18-9 - location
	p18-21 - location
	p19-24 - location
	p20-1 - location
	p20-6 - location
	p20-17 - location
	p20-21 - location
	p20-28 - location
	p23-3 - location
	p23-11 - location
	p23-13 - location
	p23-29 - location
	p24-23 - location
	p24-26 - location
	p25-2 - location
	p25-9 - location
	p29-15 - location
	p29-25 - location
	)
	(:init
	(at driver1 s6)
	(at driver2 s18)
	(at driver3 s22)
	(at driver4 s6)
	(at driver5 s16)
	(at driver6 s5)
	(at driver7 s9)
	(at driver8 s27)
	(at driver9 s14)
	(at driver10 s23)
	(at driver11 s29)
	(at driver12 s0)
	(at driver13 s10)
	(at driver14 s22)
	(at driver15 s10)
	(at driver16 s23)
	(at driver17 s23)
	(at driver18 s19)
	(at driver19 s1)
	(at driver20 s5)
	(at driver21 s3)
	(at driver22 s27)
	(at driver23 s15)
	(at driver24 s21)
	(at driver25 s5)
	(at driver26 s23)
	(at driver27 s15)
	(at driver28 s17)
	(at driver29 s10)
	(at driver30 s21)
	(at truck1 s2)
	(empty truck1)
	(at truck2 s21)
	(empty truck2)
	(at truck3 s5)
	(empty truck3)
	(at truck4 s8)
	(empty truck4)
	(at truck5 s6)
	(empty truck5)
	(at truck6 s15)
	(empty truck6)
	(at truck7 s10)
	(empty truck7)
	(at truck8 s1)
	(empty truck8)
	(at truck9 s16)
	(empty truck9)
	(at truck10 s8)
	(empty truck10)
	(at truck11 s1)
	(empty truck11)
	(at truck12 s25)
	(empty truck12)
	(at truck13 s20)
	(empty truck13)
	(at truck14 s26)
	(empty truck14)
	(at truck15 s5)
	(empty truck15)
	(at truck16 s28)
	(empty truck16)
	(at truck17 s27)
	(empty truck17)
	(at truck18 s27)
	(empty truck18)
	(at truck19 s17)
	(empty truck19)
	(at truck20 s29)
	(empty truck20)
	(at truck21 s7)
	(empty truck21)
	(at truck22 s15)
	(empty truck22)
	(at truck23 s21)
	(empty truck23)
	(at truck24 s10)
	(empty truck24)
	(at truck25 s4)
	(empty truck25)
	(at truck26 s8)
	(empty truck26)
	(at truck27 s15)
	(empty truck27)
	(at truck28 s11)
	(empty truck28)
	(at truck29 s13)
	(empty truck29)
	(at truck30 s2)
	(empty truck30)
	(at package1 s0)
	(at package2 s9)
	(at package3 s20)
	(at package4 s10)
	(at package5 s18)
	(at package6 s19)
	(at package7 s0)
	(at package8 s0)
	(at package9 s21)
	(at package10 s20)
	(at package11 s5)
	(at package12 s9)
	(at package13 s26)
	(at package14 s17)
	(at package15 s8)
	(at package16 s5)
	(at package17 s6)
	(at package18 s8)
	(at package19 s9)
	(at package20 s26)
	(at package21 s29)
	(at package22 s26)
	(at package23 s3)
	(at package24 s11)
	(at package25 s1)
	(at package26 s8)
	(at package27 s9)
	(at package28 s20)
	(at package29 s22)
	(at package30 s1)
	(at package31 s17)
	(at package32 s12)
	(at package33 s25)
	(at package34 s16)
	(at package35 s27)
	(at package36 s16)
	(at package37 s2)
	(at package38 s16)
	(at package39 s29)
	(at package40 s1)
	(at package41 s14)
	(at package42 s14)
	(at package43 s8)
	(at package44 s24)
	(at package45 s19)
	(at package46 s1)
	(at package47 s6)
	(at package48 s11)
	(at package49 s24)
	(at package50 s24)
	(at package51 s8)
	(at package52 s5)
	(at package53 s13)
	(at package54 s4)
	(at package55 s22)
	(at package56 s7)
	(at package57 s27)
	(at package58 s2)
	(at package59 s11)
	(at package60 s18)
	(path s0 p0-5)
	(path p0-5 s0)
	(path s5 p0-5)
	(path p0-5 s5)
	(= (time-to-walk s0 p0-5) 80)
	(= (time-to-walk p0-5 s0) 80)
	(= (time-to-walk s5 p0-5) 82)
	(= (time-to-walk p0-5 s5) 82)
	(path s0 p0-18)
	(path p0-18 s0)
	(path s18 p0-18)
	(path p0-18 s18)
	(= (time-to-walk s0 p0-18) 33)
	(= (time-to-walk p0-18 s0) 33)
	(= (time-to-walk s18 p0-18) 51)
	(= (time-to-walk p0-18 s18) 51)
	(path s1 p1-10)
	(path p1-10 s1)
	(path s10 p1-10)
	(path p1-10 s10)
	(= (time-to-walk s1 p1-10) 99)
	(= (time-to-walk p1-10 s1) 99)
	(= (time-to-walk s10 p1-10) 80)
	(= (time-to-walk p1-10 s10) 80)
	(path s1 p1-12)
	(path p1-12 s1)
	(path s12 p1-12)
	(path p1-12 s12)
	(= (time-to-walk s1 p1-12) 18)
	(= (time-to-walk p1-12 s1) 18)
	(= (time-to-walk s12 p1-12) 43)
	(= (time-to-walk p1-12 s12) 43)
	(path s3 p3-7)
	(path p3-7 s3)
	(path s7 p3-7)
	(path p3-7 s7)
	(= (time-to-walk s3 p3-7) 56)
	(= (time-to-walk p3-7 s3) 56)
	(= (time-to-walk s7 p3-7) 64)
	(= (time-to-walk p3-7 s7) 64)
	(path s3 p3-15)
	(path p3-15 s3)
	(path s15 p3-15)
	(path p3-15 s15)
	(= (time-to-walk s3 p3-15) 60)
	(= (time-to-walk p3-15 s3) 60)
	(= (time-to-walk s15 p3-15) 13)
	(= (time-to-walk p3-15 s15) 13)
	(path s3 p3-29)
	(path p3-29 s3)
	(path s29 p3-29)
	(path p3-29 s29)
	(= (time-to-walk s3 p3-29) 46)
	(= (time-to-walk p3-29 s3) 46)
	(= (time-to-walk s29 p3-29) 35)
	(= (time-to-walk p3-29 s29) 35)
	(path s4 p4-1)
	(path p4-1 s4)
	(path s1 p4-1)
	(path p4-1 s1)
	(= (time-to-walk s4 p4-1) 35)
	(= (time-to-walk p4-1 s4) 35)
	(= (time-to-walk s1 p4-1) 58)
	(= (time-to-walk p4-1 s1) 58)
	(path s4 p4-8)
	(path p4-8 s4)
	(path s8 p4-8)
	(path p4-8 s8)
	(= (time-to-walk s4 p4-8) 59)
	(= (time-to-walk p4-8 s4) 59)
	(= (time-to-walk s8 p4-8) 63)
	(= (time-to-walk p4-8 s8) 63)
	(path s4 p4-9)
	(path p4-9 s4)
	(path s9 p4-9)
	(path p4-9 s9)
	(= (time-to-walk s4 p4-9) 53)
	(= (time-to-walk p4-9 s4) 53)
	(= (time-to-walk s9 p4-9) 52)
	(= (time-to-walk p4-9 s9) 52)
	(path s4 p4-17)
	(path p4-17 s4)
	(path s17 p4-17)
	(path p4-17 s17)
	(= (time-to-walk s4 p4-17) 13)
	(= (time-to-walk p4-17 s4) 13)
	(= (time-to-walk s17 p4-17) 40)
	(= (time-to-walk p4-17 s17) 40)
	(path s4 p4-20)
	(path p4-20 s4)
	(path s20 p4-20)
	(path p4-20 s20)
	(= (time-to-walk s4 p4-20) 60)
	(= (time-to-walk p4-20 s4) 60)
	(= (time-to-walk s20 p4-20) 3)
	(= (time-to-walk p4-20 s20) 3)
	(path s4 p4-28)
	(path p4-28 s4)
	(path s28 p4-28)
	(path p4-28 s28)
	(= (time-to-walk s4 p4-28) 75)
	(= (time-to-walk p4-28 s4) 75)
	(= (time-to-walk s28 p4-28) 99)
	(= (time-to-walk p4-28 s28) 99)
	(path s5 p5-4)
	(path p5-4 s5)
	(path s4 p5-4)
	(path p5-4 s4)
	(= (time-to-walk s5 p5-4) 75)
	(= (time-to-walk p5-4 s5) 75)
	(= (time-to-walk s4 p5-4) 56)
	(= (time-to-walk p5-4 s4) 56)
	(path s5 p5-7)
	(path p5-7 s5)
	(path s7 p5-7)
	(path p5-7 s7)
	(= (time-to-walk s5 p5-7) 61)
	(= (time-to-walk p5-7 s5) 61)
	(= (time-to-walk s7 p5-7) 29)
	(= (time-to-walk p5-7 s7) 29)
	(path s5 p5-22)
	(path p5-22 s5)
	(path s22 p5-22)
	(path p5-22 s22)
	(= (time-to-walk s5 p5-22) 87)
	(= (time-to-walk p5-22 s5) 87)
	(= (time-to-walk s22 p5-22) 41)
	(= (time-to-walk p5-22 s22) 41)
	(path s6 p6-0)
	(path p6-0 s6)
	(path s0 p6-0)
	(path p6-0 s0)
	(= (time-to-walk s6 p6-0) 10)
	(= (time-to-walk p6-0 s6) 10)
	(= (time-to-walk s0 p6-0) 20)
	(= (time-to-walk p6-0 s0) 20)
	(path s6 p6-25)
	(path p6-25 s6)
	(path s25 p6-25)
	(path p6-25 s25)
	(= (time-to-walk s6 p6-25) 92)
	(= (time-to-walk p6-25 s6) 92)
	(= (time-to-walk s25 p6-25) 9)
	(= (time-to-walk p6-25 s25) 9)
	(path s6 p6-27)
	(path p6-27 s6)
	(path s27 p6-27)
	(path p6-27 s27)
	(= (time-to-walk s6 p6-27) 99)
	(= (time-to-walk p6-27 s6) 99)
	(= (time-to-walk s27 p6-27) 9)
	(= (time-to-walk p6-27 s27) 9)
	(path s7 p7-22)
	(path p7-22 s7)
	(path s22 p7-22)
	(path p7-22 s22)
	(= (time-to-walk s7 p7-22) 52)
	(= (time-to-walk p7-22 s7) 52)
	(= (time-to-walk s22 p7-22) 54)
	(= (time-to-walk p7-22 s22) 54)
	(path s7 p7-25)
	(path p7-25 s7)
	(path s25 p7-25)
	(path p7-25 s25)
	(= (time-to-walk s7 p7-25) 72)
	(= (time-to-walk p7-25 s7) 72)
	(= (time-to-walk s25 p7-25) 11)
	(= (time-to-walk p7-25 s25) 11)
	(path s8 p8-3)
	(path p8-3 s8)
	(path s3 p8-3)
	(path p8-3 s3)
	(= (time-to-walk s8 p8-3) 67)
	(= (time-to-walk p8-3 s8) 67)
	(= (time-to-walk s3 p8-3) 18)
	(= (time-to-walk p8-3 s3) 18)
	(path s8 p8-13)
	(path p8-13 s8)
	(path s13 p8-13)
	(path p8-13 s13)
	(= (time-to-walk s8 p8-13) 45)
	(= (time-to-walk p8-13 s8) 45)
	(= (time-to-walk s13 p8-13) 2)
	(= (time-to-walk p8-13 s13) 2)
	(path s8 p8-14)
	(path p8-14 s8)
	(path s14 p8-14)
	(path p8-14 s14)
	(= (time-to-walk s8 p8-14) 75)
	(= (time-to-walk p8-14 s8) 75)
	(= (time-to-walk s14 p8-14) 4)
	(= (time-to-walk p8-14 s14) 4)
	(path s9 p9-6)
	(path p9-6 s9)
	(path s6 p9-6)
	(path p9-6 s6)
	(= (time-to-walk s9 p9-6) 64)
	(= (time-to-walk p9-6 s9) 64)
	(= (time-to-walk s6 p9-6) 28)
	(= (time-to-walk p9-6 s6) 28)
	(path s10 p10-20)
	(path p10-20 s10)
	(path s20 p10-20)
	(path p10-20 s20)
	(= (time-to-walk s10 p10-20) 55)
	(= (time-to-walk p10-20 s10) 55)
	(= (time-to-walk s20 p10-20) 76)
	(= (time-to-walk p10-20 s20) 76)
	(path s11 p11-16)
	(path p11-16 s11)
	(path s16 p11-16)
	(path p11-16 s16)
	(= (time-to-walk s11 p11-16) 67)
	(= (time-to-walk p11-16 s11) 67)
	(= (time-to-walk s16 p11-16) 15)
	(= (time-to-walk p11-16 s16) 15)
	(path s13 p13-6)
	(path p13-6 s13)
	(path s6 p13-6)
	(path p13-6 s6)
	(= (time-to-walk s13 p13-6) 79)
	(= (time-to-walk p13-6 s13) 79)
	(= (time-to-walk s6 p13-6) 42)
	(= (time-to-walk p13-6 s6) 42)
	(path s14 p14-9)
	(path p14-9 s14)
	(path s9 p14-9)
	(path p14-9 s9)
	(= (time-to-walk s14 p14-9) 14)
	(= (time-to-walk p14-9 s14) 14)
	(= (time-to-walk s9 p14-9) 53)
	(= (time-to-walk p14-9 s9) 53)
	(path s14 p14-12)
	(path p14-12 s14)
	(path s12 p14-12)
	(path p14-12 s12)
	(= (time-to-walk s14 p14-12) 97)
	(= (time-to-walk p14-12 s14) 97)
	(= (time-to-walk s12 p14-12) 74)
	(= (time-to-walk p14-12 s12) 74)
	(path s15 p15-17)
	(path p15-17 s15)
	(path s17 p15-17)
	(path p15-17 s17)
	(= (time-to-walk s15 p15-17) 82)
	(= (time-to-walk p15-17 s15) 82)
	(= (time-to-walk s17 p15-17) 84)
	(= (time-to-walk p15-17 s17) 84)
	(path s15 p15-20)
	(path p15-20 s15)
	(path s20 p15-20)
	(path p15-20 s20)
	(= (time-to-walk s15 p15-20) 15)
	(= (time-to-walk p15-20 s15) 15)
	(= (time-to-walk s20 p15-20) 91)
	(= (time-to-walk p15-20 s20) 91)
	(path s15 p15-21)
	(path p15-21 s15)
	(path s21 p15-21)
	(path p15-21 s21)
	(= (time-to-walk s15 p15-21) 3)
	(= (time-to-walk p15-21 s15) 3)
	(= (time-to-walk s21 p15-21) 6)
	(= (time-to-walk p15-21 s21) 6)
	(path s15 p15-26)
	(path p15-26 s15)
	(path s26 p15-26)
	(path p15-26 s26)
	(= (time-to-walk s15 p15-26) 100)
	(= (time-to-walk p15-26 s15) 100)
	(= (time-to-walk s26 p15-26) 2)
	(= (time-to-walk p15-26 s26) 2)
	(path s16 p16-19)
	(path p16-19 s16)
	(path s19 p16-19)
	(path p16-19 s19)
	(= (time-to-walk s16 p16-19) 14)
	(= (time-to-walk p16-19 s16) 14)
	(= (time-to-walk s19 p16-19) 51)
	(= (time-to-walk p16-19 s19) 51)
	(path s16 p16-22)
	(path p16-22 s16)
	(path s22 p16-22)
	(path p16-22 s22)
	(= (time-to-walk s16 p16-22) 55)
	(= (time-to-walk p16-22 s16) 55)
	(= (time-to-walk s22 p16-22) 86)
	(= (time-to-walk p16-22 s22) 86)
	(path s16 p16-24)
	(path p16-24 s16)
	(path s24 p16-24)
	(path p16-24 s24)
	(= (time-to-walk s16 p16-24) 61)
	(= (time-to-walk p16-24 s16) 61)
	(= (time-to-walk s24 p16-24) 22)
	(= (time-to-walk p16-24 s24) 22)
	(path s18 p18-3)
	(path p18-3 s18)
	(path s3 p18-3)
	(path p18-3 s3)
	(= (time-to-walk s18 p18-3) 3)
	(= (time-to-walk p18-3 s18) 3)
	(= (time-to-walk s3 p18-3) 5)
	(= (time-to-walk p18-3 s3) 5)
	(path s18 p18-9)
	(path p18-9 s18)
	(path s9 p18-9)
	(path p18-9 s9)
	(= (time-to-walk s18 p18-9) 23)
	(= (time-to-walk p18-9 s18) 23)
	(= (time-to-walk s9 p18-9) 78)
	(= (time-to-walk p18-9 s9) 78)
	(path s18 p18-21)
	(path p18-21 s18)
	(path s21 p18-21)
	(path p18-21 s21)
	(= (time-to-walk s18 p18-21) 8)
	(= (time-to-walk p18-21 s18) 8)
	(= (time-to-walk s21 p18-21) 87)
	(= (time-to-walk p18-21 s21) 87)
	(path s19 p19-24)
	(path p19-24 s19)
	(path s24 p19-24)
	(path p19-24 s24)
	(= (time-to-walk s19 p19-24) 6)
	(= (time-to-walk p19-24 s19) 6)
	(= (time-to-walk s24 p19-24) 63)
	(= (time-to-walk p19-24 s24) 63)
	(path s20 p20-1)
	(path p20-1 s20)
	(path s1 p20-1)
	(path p20-1 s1)
	(= (time-to-walk s20 p20-1) 63)
	(= (time-to-walk p20-1 s20) 63)
	(= (time-to-walk s1 p20-1) 73)
	(= (time-to-walk p20-1 s1) 73)
	(path s20 p20-6)
	(path p20-6 s20)
	(path s6 p20-6)
	(path p20-6 s6)
	(= (time-to-walk s20 p20-6) 77)
	(= (time-to-walk p20-6 s20) 77)
	(= (time-to-walk s6 p20-6) 41)
	(= (time-to-walk p20-6 s6) 41)
	(path s20 p20-17)
	(path p20-17 s20)
	(path s17 p20-17)
	(path p20-17 s17)
	(= (time-to-walk s20 p20-17) 14)
	(= (time-to-walk p20-17 s20) 14)
	(= (time-to-walk s17 p20-17) 91)
	(= (time-to-walk p20-17 s17) 91)
	(path s20 p20-21)
	(path p20-21 s20)
	(path s21 p20-21)
	(path p20-21 s21)
	(= (time-to-walk s20 p20-21) 94)
	(= (time-to-walk p20-21 s20) 94)
	(= (time-to-walk s21 p20-21) 11)
	(= (time-to-walk p20-21 s21) 11)
	(path s20 p20-28)
	(path p20-28 s20)
	(path s28 p20-28)
	(path p20-28 s28)
	(= (time-to-walk s20 p20-28) 65)
	(= (time-to-walk p20-28 s20) 65)
	(= (time-to-walk s28 p20-28) 75)
	(= (time-to-walk p20-28 s28) 75)
	(path s23 p23-3)
	(path p23-3 s23)
	(path s3 p23-3)
	(path p23-3 s3)
	(= (time-to-walk s23 p23-3) 94)
	(= (time-to-walk p23-3 s23) 94)
	(= (time-to-walk s3 p23-3) 79)
	(= (time-to-walk p23-3 s3) 79)
	(path s23 p23-11)
	(path p23-11 s23)
	(path s11 p23-11)
	(path p23-11 s11)
	(= (time-to-walk s23 p23-11) 66)
	(= (time-to-walk p23-11 s23) 66)
	(= (time-to-walk s11 p23-11) 97)
	(= (time-to-walk p23-11 s11) 97)
	(path s23 p23-13)
	(path p23-13 s23)
	(path s13 p23-13)
	(path p23-13 s13)
	(= (time-to-walk s23 p23-13) 84)
	(= (time-to-walk p23-13 s23) 84)
	(= (time-to-walk s13 p23-13) 65)
	(= (time-to-walk p23-13 s13) 65)
	(path s23 p23-29)
	(path p23-29 s23)
	(path s29 p23-29)
	(path p23-29 s29)
	(= (time-to-walk s23 p23-29) 98)
	(= (time-to-walk p23-29 s23) 98)
	(= (time-to-walk s29 p23-29) 98)
	(= (time-to-walk p23-29 s29) 98)
	(path s24 p24-23)
	(path p24-23 s24)
	(path s23 p24-23)
	(path p24-23 s23)
	(= (time-to-walk s24 p24-23) 15)
	(= (time-to-walk p24-23 s24) 15)
	(= (time-to-walk s23 p24-23) 53)
	(= (time-to-walk p24-23 s23) 53)
	(path s24 p24-26)
	(path p24-26 s24)
	(path s26 p24-26)
	(path p24-26 s26)
	(= (time-to-walk s24 p24-26) 83)
	(= (time-to-walk p24-26 s24) 83)
	(= (time-to-walk s26 p24-26) 76)
	(= (time-to-walk p24-26 s26) 76)
	(path s25 p25-2)
	(path p25-2 s25)
	(path s2 p25-2)
	(path p25-2 s2)
	(= (time-to-walk s25 p25-2) 75)
	(= (time-to-walk p25-2 s25) 75)
	(= (time-to-walk s2 p25-2) 86)
	(= (time-to-walk p25-2 s2) 86)
	(path s25 p25-9)
	(path p25-9 s25)
	(path s9 p25-9)
	(path p25-9 s9)
	(= (time-to-walk s25 p25-9) 80)
	(= (time-to-walk p25-9 s25) 80)
	(= (time-to-walk s9 p25-9) 98)
	(= (time-to-walk p25-9 s9) 98)
	(path s29 p29-15)
	(path p29-15 s29)
	(path s15 p29-15)
	(path p29-15 s15)
	(= (time-to-walk s29 p29-15) 64)
	(= (time-to-walk p29-15 s29) 64)
	(= (time-to-walk s15 p29-15) 88)
	(= (time-to-walk p29-15 s15) 88)
	(path s29 p29-25)
	(path p29-25 s29)
	(path s25 p29-25)
	(path p29-25 s25)
	(= (time-to-walk s29 p29-25) 84)
	(= (time-to-walk p29-25 s29) 84)
	(= (time-to-walk s25 p29-25) 69)
	(= (time-to-walk p29-25 s25) 69)
	(link s0 s14)
	(link s14 s0)
	(= (time-to-drive s0 s14) 51)
	(= (time-to-drive s14 s0) 51)
	(link s0 s21)
	(link s21 s0)
	(= (time-to-drive s0 s21) 46)
	(= (time-to-drive s21 s0) 46)
	(link s0 s23)
	(link s23 s0)
	(= (time-to-drive s0 s23) 42)
	(= (time-to-drive s23 s0) 42)
	(link s1 s9)
	(link s9 s1)
	(= (time-to-drive s1 s9) 28)
	(= (time-to-drive s9 s1) 28)
	(link s1 s16)
	(link s16 s1)
	(= (time-to-drive s1 s16) 87)
	(= (time-to-drive s16 s1) 87)
	(link s1 s18)
	(link s18 s1)
	(= (time-to-drive s1 s18) 55)
	(= (time-to-drive s18 s1) 55)
	(link s2 s1)
	(link s1 s2)
	(= (time-to-drive s2 s1) 18)
	(= (time-to-drive s1 s2) 18)
	(link s2 s3)
	(link s3 s2)
	(= (time-to-drive s2 s3) 80)
	(= (time-to-drive s3 s2) 80)
	(link s2 s11)
	(link s11 s2)
	(= (time-to-drive s2 s11) 66)
	(= (time-to-drive s11 s2) 66)
	(link s2 s24)
	(link s24 s2)
	(= (time-to-drive s2 s24) 82)
	(= (time-to-drive s24 s2) 82)
	(link s3 s20)
	(link s20 s3)
	(= (time-to-drive s3 s20) 54)
	(= (time-to-drive s20 s3) 54)
	(link s4 s1)
	(link s1 s4)
	(= (time-to-drive s4 s1) 60)
	(= (time-to-drive s1 s4) 60)
	(link s4 s24)
	(link s24 s4)
	(= (time-to-drive s4 s24) 61)
	(= (time-to-drive s24 s4) 61)
	(link s5 s4)
	(link s4 s5)
	(= (time-to-drive s5 s4) 20)
	(= (time-to-drive s4 s5) 20)
	(link s6 s2)
	(link s2 s6)
	(= (time-to-drive s6 s2) 56)
	(= (time-to-drive s2 s6) 56)
	(link s6 s9)
	(link s9 s6)
	(= (time-to-drive s6 s9) 44)
	(= (time-to-drive s9 s6) 44)
	(link s6 s17)
	(link s17 s6)
	(= (time-to-drive s6 s17) 84)
	(= (time-to-drive s17 s6) 84)
	(link s6 s23)
	(link s23 s6)
	(= (time-to-drive s6 s23) 54)
	(= (time-to-drive s23 s6) 54)
	(link s6 s25)
	(link s25 s6)
	(= (time-to-drive s6 s25) 42)
	(= (time-to-drive s25 s6) 42)
	(link s7 s10)
	(link s10 s7)
	(= (time-to-drive s7 s10) 99)
	(= (time-to-drive s10 s7) 99)
	(link s7 s14)
	(link s14 s7)
	(= (time-to-drive s7 s14) 6)
	(= (time-to-drive s14 s7) 6)
	(link s7 s24)
	(link s24 s7)
	(= (time-to-drive s7 s24) 24)
	(= (time-to-drive s24 s7) 24)
	(link s8 s13)
	(link s13 s8)
	(= (time-to-drive s8 s13) 74)
	(= (time-to-drive s13 s8) 74)
	(link s8 s24)
	(link s24 s8)
	(= (time-to-drive s8 s24) 81)
	(= (time-to-drive s24 s8) 81)
	(link s9 s2)
	(link s2 s9)
	(= (time-to-drive s9 s2) 10)
	(= (time-to-drive s2 s9) 10)
	(link s9 s13)
	(link s13 s9)
	(= (time-to-drive s9 s13) 53)
	(= (time-to-drive s13 s9) 53)
	(link s9 s22)
	(link s22 s9)
	(= (time-to-drive s9 s22) 78)
	(= (time-to-drive s22 s9) 78)
	(link s10 s2)
	(link s2 s10)
	(= (time-to-drive s10 s2) 73)
	(= (time-to-drive s2 s10) 73)
	(link s10 s3)
	(link s3 s10)
	(= (time-to-drive s10 s3) 41)
	(= (time-to-drive s3 s10) 41)
	(link s10 s15)
	(link s15 s10)
	(= (time-to-drive s10 s15) 61)
	(= (time-to-drive s15 s10) 61)
	(link s10 s23)
	(link s23 s10)
	(= (time-to-drive s10 s23) 42)
	(= (time-to-drive s23 s10) 42)
	(link s11 s0)
	(link s0 s11)
	(= (time-to-drive s11 s0) 91)
	(= (time-to-drive s0 s11) 91)
	(link s11 s17)
	(link s17 s11)
	(= (time-to-drive s11 s17) 7)
	(= (time-to-drive s17 s11) 7)
	(link s12 s16)
	(link s16 s12)
	(= (time-to-drive s12 s16) 83)
	(= (time-to-drive s16 s12) 83)
	(link s12 s17)
	(link s17 s12)
	(= (time-to-drive s12 s17) 19)
	(= (time-to-drive s17 s12) 19)
	(link s12 s18)
	(link s18 s12)
	(= (time-to-drive s12 s18) 93)
	(= (time-to-drive s18 s12) 93)
	(link s12 s19)
	(link s19 s12)
	(= (time-to-drive s12 s19) 38)
	(= (time-to-drive s19 s12) 38)
	(link s12 s20)
	(link s20 s12)
	(= (time-to-drive s12 s20) 36)
	(= (time-to-drive s20 s12) 36)
	(link s12 s26)
	(link s26 s12)
	(= (time-to-drive s12 s26) 72)
	(= (time-to-drive s26 s12) 72)
	(link s13 s2)
	(link s2 s13)
	(= (time-to-drive s13 s2) 3)
	(= (time-to-drive s2 s13) 3)
	(link s13 s7)
	(link s7 s13)
	(= (time-to-drive s13 s7) 18)
	(= (time-to-drive s7 s13) 18)
	(link s13 s14)
	(link s14 s13)
	(= (time-to-drive s13 s14) 26)
	(= (time-to-drive s14 s13) 26)
	(link s13 s18)
	(link s18 s13)
	(= (time-to-drive s13 s18) 62)
	(= (time-to-drive s18 s13) 62)
	(link s14 s1)
	(link s1 s14)
	(= (time-to-drive s14 s1) 78)
	(= (time-to-drive s1 s14) 78)
	(link s14 s8)
	(link s8 s14)
	(= (time-to-drive s14 s8) 45)
	(= (time-to-drive s8 s14) 45)
	(link s14 s22)
	(link s22 s14)
	(= (time-to-drive s14 s22) 18)
	(= (time-to-drive s22 s14) 18)
	(link s15 s0)
	(link s0 s15)
	(= (time-to-drive s15 s0) 22)
	(= (time-to-drive s0 s15) 22)
	(link s15 s12)
	(link s12 s15)
	(= (time-to-drive s15 s12) 28)
	(= (time-to-drive s12 s15) 28)
	(link s16 s3)
	(link s3 s16)
	(= (time-to-drive s16 s3) 71)
	(= (time-to-drive s3 s16) 71)
	(link s16 s14)
	(link s14 s16)
	(= (time-to-drive s16 s14) 63)
	(= (time-to-drive s14 s16) 63)
	(link s16 s15)
	(link s15 s16)
	(= (time-to-drive s16 s15) 26)
	(= (time-to-drive s15 s16) 26)
	(link s17 s1)
	(link s1 s17)
	(= (time-to-drive s17 s1) 77)
	(= (time-to-drive s1 s17) 77)
	(link s17 s2)
	(link s2 s17)
	(= (time-to-drive s17 s2) 87)
	(= (time-to-drive s2 s17) 87)
	(link s17 s10)
	(link s10 s17)
	(= (time-to-drive s17 s10) 99)
	(= (time-to-drive s10 s17) 99)
	(link s17 s20)
	(link s20 s17)
	(= (time-to-drive s17 s20) 57)
	(= (time-to-drive s20 s17) 57)
	(link s17 s28)
	(link s28 s17)
	(= (time-to-drive s17 s28) 96)
	(= (time-to-drive s28 s17) 96)
	(link s17 s29)
	(link s29 s17)
	(= (time-to-drive s17 s29) 52)
	(= (time-to-drive s29 s17) 52)
	(link s18 s0)
	(link s0 s18)
	(= (time-to-drive s18 s0) 34)
	(= (time-to-drive s0 s18) 34)
	(link s19 s0)
	(link s0 s19)
	(= (time-to-drive s19 s0) 69)
	(= (time-to-drive s0 s19) 69)
	(link s19 s16)
	(link s16 s19)
	(= (time-to-drive s19 s16) 93)
	(= (time-to-drive s16 s19) 93)
	(link s19 s28)
	(link s28 s19)
	(= (time-to-drive s19 s28) 95)
	(= (time-to-drive s28 s19) 95)
	(link s20 s10)
	(link s10 s20)
	(= (time-to-drive s20 s10) 10)
	(= (time-to-drive s10 s20) 10)
	(link s20 s14)
	(link s14 s20)
	(= (time-to-drive s20 s14) 83)
	(= (time-to-drive s14 s20) 83)
	(link s20 s28)
	(link s28 s20)
	(= (time-to-drive s20 s28) 1)
	(= (time-to-drive s28 s20) 1)
	(link s21 s7)
	(link s7 s21)
	(= (time-to-drive s21 s7) 93)
	(= (time-to-drive s7 s21) 93)
	(link s21 s13)
	(link s13 s21)
	(= (time-to-drive s21 s13) 2)
	(= (time-to-drive s13 s21) 2)
	(link s21 s16)
	(link s16 s21)
	(= (time-to-drive s21 s16) 93)
	(= (time-to-drive s16 s21) 93)
	(link s21 s18)
	(link s18 s21)
	(= (time-to-drive s21 s18) 30)
	(= (time-to-drive s18 s21) 30)
	(link s21 s26)
	(link s26 s21)
	(= (time-to-drive s21 s26) 38)
	(= (time-to-drive s26 s21) 38)
	(link s22 s4)
	(link s4 s22)
	(= (time-to-drive s22 s4) 64)
	(= (time-to-drive s4 s22) 64)
	(link s22 s15)
	(link s15 s22)
	(= (time-to-drive s22 s15) 32)
	(= (time-to-drive s15 s22) 32)
	(link s23 s2)
	(link s2 s23)
	(= (time-to-drive s23 s2) 55)
	(= (time-to-drive s2 s23) 55)
	(link s23 s3)
	(link s3 s23)
	(= (time-to-drive s23 s3) 89)
	(= (time-to-drive s3 s23) 89)
	(link s23 s13)
	(link s13 s23)
	(= (time-to-drive s23 s13) 94)
	(= (time-to-drive s13 s23) 94)
	(link s23 s16)
	(link s16 s23)
	(= (time-to-drive s23 s16) 33)
	(= (time-to-drive s16 s23) 33)
	(link s24 s3)
	(link s3 s24)
	(= (time-to-drive s24 s3) 33)
	(= (time-to-drive s3 s24) 33)
	(link s24 s18)
	(link s18 s24)
	(= (time-to-drive s24 s18) 12)
	(= (time-to-drive s18 s24) 12)
	(link s24 s22)
	(link s22 s24)
	(= (time-to-drive s24 s22) 54)
	(= (time-to-drive s22 s24) 54)
	(link s25 s2)
	(link s2 s25)
	(= (time-to-drive s25 s2) 61)
	(= (time-to-drive s2 s25) 61)
	(link s26 s0)
	(link s0 s26)
	(= (time-to-drive s26 s0) 82)
	(= (time-to-drive s0 s26) 82)
	(link s26 s2)
	(link s2 s26)
	(= (time-to-drive s26 s2) 16)
	(= (time-to-drive s2 s26) 16)
	(link s26 s14)
	(link s14 s26)
	(= (time-to-drive s26 s14) 86)
	(= (time-to-drive s14 s26) 86)
	(link s26 s22)
	(link s22 s26)
	(= (time-to-drive s26 s22) 59)
	(= (time-to-drive s22 s26) 59)
	(link s27 s3)
	(link s3 s27)
	(= (time-to-drive s27 s3) 2)
	(= (time-to-drive s3 s27) 2)
	(link s27 s12)
	(link s12 s27)
	(= (time-to-drive s27 s12) 85)
	(= (time-to-drive s12 s27) 85)
	(link s27 s13)
	(link s13 s27)
	(= (time-to-drive s27 s13) 16)
	(= (time-to-drive s13 s27) 16)
	(link s28 s0)
	(link s0 s28)
	(= (time-to-drive s28 s0) 98)
	(= (time-to-drive s0 s28) 98)
	(link s28 s4)
	(link s4 s28)
	(= (time-to-drive s28 s4) 37)
	(= (time-to-drive s4 s28) 37)
	(link s28 s9)
	(link s9 s28)
	(= (time-to-drive s28 s9) 49)
	(= (time-to-drive s9 s28) 49)
	(link s28 s24)
	(link s24 s28)
	(= (time-to-drive s28 s24) 66)
	(= (time-to-drive s24 s28) 66)
	(link s28 s27)
	(link s27 s28)
	(= (time-to-drive s28 s27) 29)
	(= (time-to-drive s27 s28) 29)
	(link s29 s0)
	(link s0 s29)
	(= (time-to-drive s29 s0) 44)
	(= (time-to-drive s0 s29) 44)
	(link s29 s5)
	(link s5 s29)
	(= (time-to-drive s29 s5) 75)
	(= (time-to-drive s5 s29) 75)
	(link s29 s20)
	(link s20 s29)
	(= (time-to-drive s29 s20) 11)
	(= (time-to-drive s20 s29) 11)
	(link s29 s21)
	(link s21 s29)
	(= (time-to-drive s29 s21) 44)
	(= (time-to-drive s21 s29) 44)
	(link s29 s27)
	(link s27 s29)
	(= (time-to-drive s29 s27) 67)
	(= (time-to-drive s27 s29) 67)
)
	(:goal (and
	(at driver2 s23)
	(at driver3 s18)
	(at driver4 s7)
	(at driver5 s5)
	(at driver7 s10)
	(at driver8 s21)
	(at driver10 s0)
	(at driver11 s7)
	(at driver12 s25)
	(at driver14 s24)
	(at driver15 s10)
	(at driver16 s16)
	(at driver18 s23)
	(at driver19 s7)
	(at driver20 s1)
	(at driver21 s0)
	(at driver22 s0)
	(at driver24 s3)
	(at driver26 s6)
	(at driver27 s0)
	(at driver28 s20)
	(at driver29 s21)
	(at driver30 s26)
	(at truck1 s29)
	(at truck2 s27)
	(at truck4 s4)
	(at truck5 s9)
	(at truck6 s3)
	(at truck7 s18)
	(at truck8 s6)
	(at truck9 s16)
	(at truck13 s8)
	(at truck14 s17)
	(at truck17 s19)
	(at truck19 s7)
	(at truck20 s16)
	(at truck22 s13)
	(at truck23 s4)
	(at truck26 s3)
	(at truck28 s28)
	(at truck29 s16)
	(at truck30 s15)
	(at package1 s23)
	(at package2 s9)
	(at package3 s1)
	(at package4 s11)
	(at package5 s16)
	(at package7 s10)
	(at package9 s5)
	(at package10 s8)
	(at package11 s8)
	(at package12 s17)
	(at package13 s8)
	(at package14 s19)
	(at package15 s7)
	(at package17 s27)
	(at package18 s28)
	(at package19 s19)
	(at package20 s10)
	(at package21 s16)
	(at package22 s25)
	(at package23 s21)
	(at package24 s8)
	(at package25 s17)
	(at package26 s23)
	(at package27 s29)
	(at package28 s7)
	(at package29 s17)
	(at package30 s13)
	(at package31 s13)
	(at package32 s10)
	(at package33 s14)
	(at package34 s25)
	(at package35 s27)
	(at package36 s5)
	(at package37 s14)
	(at package38 s4)
	(at package39 s27)
	(at package40 s28)
	(at package41 s16)
	(at package42 s28)
	(at package43 s23)
	(at package44 s10)
	(at package45 s8)
	(at package46 s25)
	(at package47 s27)
	(at package48 s14)
	(at package49 s13)
	(at package50 s15)
	(at package51 s0)
	(at package52 s14)
	(at package53 s22)
	(at package54 s17)
	(at package55 s6)
	(at package56 s8)
	(at package57 s15)
	(at package58 s26)
	(at package59 s21)
	(at package60 s16)
	))

(:metric minimize (total-time))

)