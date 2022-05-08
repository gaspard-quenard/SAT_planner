(define (problem depotprob7512) (:domain Depot)
(:objects
	depot0 depot1 depot2 depot3 depot4 depot5 depot6 depot7 depot8 depot9 - Depot
	distributor0 distributor1 distributor2 distributor3 distributor4 distributor5 distributor6 distributor7 distributor8 distributor9 - Distributor
	truck0 truck1 truck2 truck3 truck4 truck5 - Truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 pallet10 pallet11 pallet12 pallet13 pallet14 pallet15 pallet16 pallet17 pallet18 pallet19 pallet20 pallet21 pallet22 pallet23 pallet24 pallet25 pallet26 pallet27 pallet28 pallet29 - Pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 crate15 crate16 crate17 crate18 crate19 crate20 crate21 crate22 crate23 crate24 crate25 crate26 crate27 crate28 crate29 crate30 crate31 crate32 crate33 crate34 crate35 crate36 crate37 crate38 crate39 - Crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 hoist8 hoist9 hoist10 hoist11 hoist12 hoist13 hoist14 hoist15 hoist16 hoist17 hoist18 hoist19 hoist20 hoist21 hoist22 hoist23 hoist24 hoist25 hoist26 hoist27 hoist28 hoist29 - Hoist)
(:init
	(at pallet0 depot0)
	(clear crate1)
	(at pallet1 depot1)
	(clear pallet1)
	(at pallet2 depot2)
	(clear crate34)
	(at pallet3 depot3)
	(clear crate21)
	(at pallet4 depot4)
	(clear crate37)
	(at pallet5 depot5)
	(clear pallet5)
	(at pallet6 depot6)
	(clear pallet6)
	(at pallet7 depot7)
	(clear crate25)
	(at pallet8 depot8)
	(clear crate32)
	(at pallet9 depot9)
	(clear crate31)
	(at pallet10 distributor0)
	(clear pallet10)
	(at pallet11 distributor1)
	(clear crate30)
	(at pallet12 distributor2)
	(clear crate8)
	(at pallet13 distributor3)
	(clear crate22)
	(at pallet14 distributor4)
	(clear crate12)
	(at pallet15 distributor5)
	(clear crate9)
	(at pallet16 distributor6)
	(clear crate10)
	(at pallet17 distributor7)
	(clear crate23)
	(at pallet18 distributor8)
	(clear crate29)
	(at pallet19 distributor9)
	(clear crate36)
	(at pallet20 distributor3)
	(clear crate24)
	(at pallet21 depot6)
	(clear crate38)
	(at pallet22 distributor4)
	(clear pallet22)
	(at pallet23 distributor6)
	(clear crate35)
	(at pallet24 distributor2)
	(clear pallet24)
	(at pallet25 depot4)
	(clear crate20)
	(at pallet26 depot4)
	(clear pallet26)
	(at pallet27 distributor3)
	(clear crate0)
	(at pallet28 depot1)
	(clear crate26)
	(at pallet29 distributor2)
	(clear crate39)
	(at truck0 distributor7)
	(at truck1 distributor7)
	(at truck2 distributor4)
	(at truck3 depot3)
	(at truck4 distributor2)
	(at truck5 distributor3)
	(at hoist0 depot0)
	(available hoist0)
	(at hoist1 depot1)
	(available hoist1)
	(at hoist2 depot2)
	(available hoist2)
	(at hoist3 depot3)
	(available hoist3)
	(at hoist4 depot4)
	(available hoist4)
	(at hoist5 depot5)
	(available hoist5)
	(at hoist6 depot6)
	(available hoist6)
	(at hoist7 depot7)
	(available hoist7)
	(at hoist8 depot8)
	(available hoist8)
	(at hoist9 depot9)
	(available hoist9)
	(at hoist10 distributor0)
	(available hoist10)
	(at hoist11 distributor1)
	(available hoist11)
	(at hoist12 distributor2)
	(available hoist12)
	(at hoist13 distributor3)
	(available hoist13)
	(at hoist14 distributor4)
	(available hoist14)
	(at hoist15 distributor5)
	(available hoist15)
	(at hoist16 distributor6)
	(available hoist16)
	(at hoist17 distributor7)
	(available hoist17)
	(at hoist18 distributor8)
	(available hoist18)
	(at hoist19 distributor9)
	(available hoist19)
	(at hoist20 distributor0)
	(available hoist20)
	(at hoist21 depot8)
	(available hoist21)
	(at hoist22 distributor9)
	(available hoist22)
	(at hoist23 distributor7)
	(available hoist23)
	(at hoist24 depot6)
	(available hoist24)
	(at hoist25 depot3)
	(available hoist25)
	(at hoist26 depot2)
	(available hoist26)
	(at hoist27 distributor0)
	(available hoist27)
	(at hoist28 depot0)
	(available hoist28)
	(at hoist29 depot7)
	(available hoist29)
	(at crate0 distributor3)
	(on crate0 pallet27)
	(at crate1 depot0)
	(on crate1 pallet0)
	(at crate2 depot8)
	(on crate2 pallet8)
	(at crate3 depot3)
	(on crate3 pallet3)
	(at crate4 depot2)
	(on crate4 pallet2)
	(at crate5 depot7)
	(on crate5 pallet7)
	(at crate6 distributor1)
	(on crate6 pallet11)
	(at crate7 distributor3)
	(on crate7 pallet20)
	(at crate8 distributor2)
	(on crate8 pallet12)
	(at crate9 distributor5)
	(on crate9 pallet15)
	(at crate10 distributor6)
	(on crate10 pallet16)
	(at crate11 depot2)
	(on crate11 crate4)
	(at crate12 distributor4)
	(on crate12 pallet14)
	(at crate13 distributor7)
	(on crate13 pallet17)
	(at crate14 distributor1)
	(on crate14 crate6)
	(at crate15 depot9)
	(on crate15 pallet9)
	(at crate16 distributor2)
	(on crate16 pallet29)
	(at crate17 depot9)
	(on crate17 crate15)
	(at crate18 depot6)
	(on crate18 pallet21)
	(at crate19 distributor1)
	(on crate19 crate14)
	(at crate20 depot4)
	(on crate20 pallet25)
	(at crate21 depot3)
	(on crate21 crate3)
	(at crate22 distributor3)
	(on crate22 pallet13)
	(at crate23 distributor7)
	(on crate23 crate13)
	(at crate24 distributor3)
	(on crate24 crate7)
	(at crate25 depot7)
	(on crate25 crate5)
	(at crate26 depot1)
	(on crate26 pallet28)
	(at crate27 distributor8)
	(on crate27 pallet18)
	(at crate28 distributor9)
	(on crate28 pallet19)
	(at crate29 distributor8)
	(on crate29 crate27)
	(at crate30 distributor1)
	(on crate30 crate19)
	(at crate31 depot9)
	(on crate31 crate17)
	(at crate32 depot8)
	(on crate32 crate2)
	(at crate33 distributor9)
	(on crate33 crate28)
	(at crate34 depot2)
	(on crate34 crate11)
	(at crate35 distributor6)
	(on crate35 pallet23)
	(at crate36 distributor9)
	(on crate36 crate33)
	(at crate37 depot4)
	(on crate37 pallet4)
	(at crate38 depot6)
	(on crate38 crate18)
	(at crate39 distributor2)
	(on crate39 crate16)
)

(:goal (and
		(on crate0 crate21)
		(on crate1 pallet21)
		(on crate2 pallet8)
		(on crate3 pallet5)
		(on crate5 pallet23)
		(on crate7 pallet13)
		(on crate8 crate31)
		(on crate9 pallet18)
		(on crate11 pallet1)
		(on crate13 pallet12)
		(on crate15 pallet24)
		(on crate16 crate18)
		(on crate18 pallet20)
		(on crate19 crate28)
		(on crate20 crate2)
		(on crate21 crate34)
		(on crate22 pallet15)
		(on crate23 crate26)
		(on crate24 pallet25)
		(on crate26 crate7)
		(on crate27 pallet19)
		(on crate28 pallet27)
		(on crate29 pallet11)
		(on crate30 pallet0)
		(on crate31 pallet16)
		(on crate32 crate0)
		(on crate33 crate15)
		(on crate34 pallet6)
		(on crate35 pallet29)
		(on crate36 crate33)
		(on crate37 crate8)
	)
))
