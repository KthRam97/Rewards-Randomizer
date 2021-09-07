-- SYNTAX:
--
-- BindReward( <name>, <filename>, <reward type>, <quest type>, <level> );
--
-- or
--
-- BindReward( <name>, <filename>, <reward type>, "forsale", <level>, <coin cost>, <seller> );
--

-- Level 1
-- TOTAL Cost: $750
-- Default_L1 Next Line
dcar = level_rewards[7][7]
Game.BindReward( dcar, "art\\cars\\"..dcar..".p3d", "car", "defaultcar", 1 );
--BindReward( "cletu_v", "art\cars\cletu_v.p3d", "car", "bonusmission", 1 );
--BindReward( "elect_v", "art\cars\elect_v.p3d", "car", "streetrace", 1 ); // Car_L1 Next Line
Game.BindReward( level_rewards[1][12], "art\\cars\\"..level_rewards[1][12]..".p3d", "car", "forsale", 1, math.floor(multiplier*150), "simpson" ); -- Gil_L11 Next Line
Game.BindReward( level_rewards[1][13], "art\\cars\\"..level_rewards[1][13]..".p3d", "car", "forsale", 1, math.floor(multiplier*125), "gil" ); -- Gil_L12 Next Line
Game.BindReward( level_rewards[1][14], "art\\cars\\"..level_rewards[1][14]..".p3d", "car", "forsale", 1, math.floor(multiplier*100), "gil" );

Game.BindReward( "homer", "art\\chars\\homer_m.p3d", "skin", "defaultskin", 1 );
Game.BindReward( "beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", 1, 100000, "interior" );

Game.SetTotalGags( 1, 15 );

-- Level 2
-- TOTAL Cost: $1200
-- Default_L2 Next Line
--BindReward( "gramp_v", "art\cars\gramp_v.p3d", "car", "bonusmission", 2 );
--BindReward( "moe_v", "art\cars\moe_v.p3d", "car", "streetrace", 2 ); // Car_L2 Next Line
Game.BindReward( level_rewards[2][12], "art\\cars\\"..level_rewards[2][12]..".p3d", "car", "forsale", 2, math.floor(multiplier*200), "simpson" ); -- Gil_L21 Next Line
Game.BindReward( level_rewards[2][13], "art\\cars\\"..level_rewards[2][13]..".p3d", "car", "forsale", 2, math.floor(multiplier*150), "gil" ); -- Gil_L22 Next Line
Game.BindReward( level_rewards[2][14], "art\\cars\\"..level_rewards[2][14]..".p3d", "car", "forsale", 2, math.floor(multiplier*250), "gil" );

Game.BindReward( "bart", "art\\chars\\bart_m.p3d", "skin", "defaultskin", 2 );
Game.BindReward( "beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", 2, 100000, "interior" );

Game.SetTotalGags( 2, 11 );

-- Level 3
-- TOTAL Cost: $1600
-- Default_L3 Next Line
--BindReward( "skinn_v", "art\cars\skinn_v.p3d", "car", "bonusmission", 3 );
--BindReward( "bookb_v", "art\cars\bookb_v.p3d", "car", "streetrace", 3 ); // Car_L3 Next Line
Game.BindReward( level_rewards[3][12], "art\\cars\\"..level_rewards[3][12]..".p3d", "car", "forsale", 3, math.floor(multiplier*300), "simpson" ); -- Gil_L31 Next Line
Game.BindReward( level_rewards[3][13], "art\\cars\\"..level_rewards[3][13]..".p3d", "car", "forsale", 3, math.floor(multiplier*250), "gil" ); -- Gil_L32 Next Line
Game.BindReward( level_rewards[3][14], "art\\cars\\"..level_rewards[3][14]..".p3d", "car", "forsale", 3, math.floor(multiplier*250), "gil" );

Game.BindReward( "lisa", "art\\chars\\lisa_m.p3d", "skin", "defaultskin", 3 );
Game.BindReward( "beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", 3, 100000, "interior" );

Game.SetTotalGags( 3, 11 );

-- Level 4
-- TOTAL Cost: $2100
-- Default_L4 Next Line
--BindReward( "comic_v", "art\\cars\\comic_v.p3d", "car", "bonusmission", 4 );
--BindReward( "krust_v", "art\\cars\\krust_v.p3d", "car", "streetrace", 4 ); // Car_L4 Next Line
Game.BindReward( level_rewards[4][12], "art\\cars\\"..level_rewards[4][12]..".p3d", "car", "forsale", 4, math.floor(multiplier*400), "simpson" ); -- Gil_L41 Next Line
Game.BindReward( level_rewards[4][13], "art\\cars\\"..level_rewards[4][13]..".p3d", "car", "forsale", 4, math.floor(multiplier*350), "gil" ); -- Gil_L42 Next Line
Game.BindReward( level_rewards[4][14], "art\\cars\\"..level_rewards[4][14]..".p3d", "car", "forsale", 4, math.floor(multiplier*300), "gil" );

Game.BindReward( "marge", "art\\chars\\marge_m.p3d", "skin", "defaultskin", 4 );
Game.BindReward( "beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", 4, 100000, "interior" );

Game.SetTotalGags( 4, 15 );

-- Level 5
-- TOTAL Cost: $2550
-- Default_L5 Next Line
--BindReward( "frink_v", "art\cars\frink_v.p3d", "car", "bonusmission", 5 );
--BindReward( "bbman_v", "art\cars\bbman_v.p3d", "car", "streetrace", 5 ); // Car_L5 Next Line
Game.BindReward( level_rewards[5][12], "art\\cars\\"..level_rewards[5][12]..".p3d", "car", "forsale", 5, math.floor(multiplier*500), "simpson" ); -- Gil_L51 Next Line
Game.BindReward( level_rewards[5][13], "art\\cars\\"..level_rewards[5][13]..".p3d", "car", "forsale", 5, math.floor(multiplier*425), "gil" ); -- Gil_L52 Next Line
Game.BindReward( level_rewards[5][14], "art\\cars\\"..level_rewards[5][14]..".p3d", "car", "forsale", 5, math.floor(multiplier*350), "gil" );

Game.BindReward( "apu", "art\\chars\\apu_m.p3d", "skin", "defaultskin", 5 );
Game.BindReward( "beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", 5, 100000, "interior" );

Game.SetTotalGags( 5, 6 );

-- Level 6
-- TOTAL Cost: $3000
-- Default_L6 Next Line
--BindReward( "snake_v", "art\cars\snake_v.p3d", "car", "bonusmission", 6 );
--BindReward( "burns_v", "art\cars\burns_v.p3d", "car", "streetrace", 6 ); // Car_L6 Next Line
Game.BindReward( level_rewards[6][12], "art\\cars\\"..level_rewards[6][12]..".p3d", "car", "forsale", 6, math.floor(multiplier*600), "simpson" ); -- Gil_L61 Next Line
Game.BindReward( level_rewards[6][13], "art\\cars\\"..level_rewards[6][13]..".p3d", "car", "forsale", 6, math.floor(multiplier*400), "gil" ); -- Gil_L62 Next Line
Game.BindReward( level_rewards[6][14], "art\\cars\\"..level_rewards[6][14]..".p3d", "car", "forsale", 6, math.floor(multiplier*500), "gil" );

Game.BindReward( "bart", "art\\chars\\bart_m.p3d", "skin", "defaultskin", 6 );
Game.BindReward( "beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", 6, 100000, "interior" );

Game.SetTotalGags( 6, 11 );

-- Level 7
-- TOTAL Cost: $3600
-- Default_L7 Next Line
--BindReward( "smith_v", "art\cars\smith_v.p3d", "car", "bonusmission", 7 );
--BindReward( "fone_v", "art\cars\fone_v.p3d", "car", "streetrace", 7 ); // Car_L7 Next Line
Game.BindReward( level_rewards[7][12], "art\\cars\\"..level_rewards[7][12]..".p3d", "car", "forsale", 7, math.floor(multiplier*500), "simpson" ); -- Gil_L71 Next Line
Game.BindReward( level_rewards[7][13], "art\\cars\\"..level_rewards[7][13]..".p3d", "car", "forsale", 7, math.floor(multiplier*1000), "gil" ); -- Gil_L72 Next Line
Game.BindReward( level_rewards[7][14], "art\\cars\\"..level_rewards[7][14]..".p3d", "car", "forsale", 7, math.floor(multiplier*750), "gil" );

Game.BindReward( "homer", "art\\chars\\homer_m.p3d", "skin", "defaultskin", 7 );

Game.BindReward( "beeman", "art\\chars\\beeman_m.p3d", "skin", "forsale", 7, 100000, "interior" );

Game.SetTotalGags( 7, 15 );


-- Car Attributes (top speed, acceleration, toughness, handling)
-- Level 1
Game.SetCarAttributes( "famil_v", 1, 1.5, 2.5, 4 );
Game.SetCarAttributes( "cletu_v", 1, 1, 3.5, 2.5 );
Game.SetCarAttributes( "elect_v", 2, 1.5, 1.5, 4 );
Game.SetCarAttributes( "plowk_v", 1.5, 0.5, 5, 1.5 );
Game.SetCarAttributes( "cDuff", 0.5, 0.5, 4, 1 );
Game.SetCarAttributes( "cVan", 1.5, 1.5, 3.5, 3 );

-- Level 2
Game.SetCarAttributes( "honor_v", 1.5, 2, 1.5, 5 );
Game.SetCarAttributes( "gramp_v", 1.5, 1.5, 3.5, 3 );
Game.SetCarAttributes( "moe_v", 2, 1.5, 2.5, 3.5 );
Game.SetCarAttributes( "mrplo_v", 2, 1.5, 3.5, 3 );
Game.SetCarAttributes( "cLimo", 1.5, 1.5, 3.5, 2.5 );
Game.SetCarAttributes( "cFire_v", 3, 0.5, 5, 1 );

-- Level 3
--
Game.SetCarAttributes( "lisa_v", 2.5, 3, 1.5, 4.5 );
Game.SetCarAttributes( "skinn_v", 2, 2, 2.5, 3 );
Game.SetCarAttributes( "bookb_v", 2, 1.5, 3.5, 2.5 );
Game.SetCarAttributes( "otto_v", 2, 1, 5, 2 );
Game.SetCarAttributes( "cDonut", 0.5, 1.5, 3, 3 );
Game.SetCarAttributes( "cNerd", 1.5, 2.5, 2.5, 4 );

-- Level 4
--
Game.SetCarAttributes( "marge_v", 2.5, 1.5, 4, 3 );
Game.SetCarAttributes( "comic_v", 2.5, 2, 3, 4 );
Game.SetCarAttributes( "krust_v", 3, 3, 1.5, 5 );
Game.SetCarAttributes( "willi_v", 3, 2.5, 3.5, 3.5 );
Game.SetCarAttributes( "cKlimo", 2.5, 2, 4, 2.5 );
Game.SetCarAttributes( "cCurator", 2.5, 3, 2.5, 4.5 );

-- Level 5
--
Game.SetCarAttributes( "apu_v", 3.5, 3.5, 2.5, 3.5 );
Game.SetCarAttributes( "frink_v", 4, 4, 1, 3 );
Game.SetCarAttributes( "bbman_v", 4, 3, 2.5, 3.5 );
Game.SetCarAttributes( "carhom_v", 4.5, 3.5, 3.5, 3 );
Game.SetCarAttributes( "wiggu_v", 4, 3.5, 3, 4 );
Game.SetCarAttributes( "cCola", 3, 1, 5, 1 );

-- Level 6
--
Game.SetCarAttributes( "bart_v", 4, 4, 1.5, 5 );
Game.SetCarAttributes( "snake_v", 4.5, 4, 2.5, 4.5 );
Game.SetCarAttributes( "burns_v", 4, 2.5, 3.5, 4 );
Game.SetCarAttributes( "scorp_v", 4.5, 4.5, 1.5, 4 );
Game.SetCarAttributes( "cArmor", 1.5, 1.5, 5, 1.5 );
Game.SetCarAttributes( "cSedan", 4, 4.5, 3, 4.5 );

-- Level 7
--
Game.SetCarAttributes( "homer_v", 4.5, 4.5, 2.0, 4 );
Game.SetCarAttributes( "smith_v", 4.5, 3, 4.5, 3.5 );
Game.SetCarAttributes( "fone_v", 5, 5, 0.5, 5 );
Game.SetCarAttributes( "zombi_v", 4.5, 5, 1.5, 4.5 );
Game.SetCarAttributes( "hbike_v", 5, 4.5, 1, 3.5 );
Game.SetCarAttributes( "cHears", 4.5, 4.5, 3.5, 4 );

--other vehicles
Game.SetCarAttributes( "ambul", 0, 0, 0, 0 );
Game.SetCarAttributes( "atv_v", 3, 3, 1.5, 2 );
Game.SetCarAttributes( "burnsarm", 0, 0, 0, 0 );
Game.SetCarAttributes( "cBlbart", 4.5, 5, 1.5, 5 );
Game.SetCarAttributes( "cBone", 0.5, 0.5, 0.5, 1 );
Game.SetCarAttributes( "cCellD", 2, 2, 2.5, 4 );
Game.SetCarAttributes( "cCube", 0.5, 0.5, 3.5, 1 );
Game.SetCarAttributes( "cMilk", 0.5, 0.5, 3.5, 3 );
Game.SetCarAttributes( "cNonup", 0.5, 1, 5, 2 );
Game.SetCarAttributes( "coffin", 0, 0, 0, 0 );
Game.SetCarAttributes( "compactA", 0, 0, 0, 0 );
Game.SetCarAttributes( "cPolice", 4.5, 3.5, 3.5, 4.5 );
Game.SetCarAttributes( "dune_v", 0.5, 3, 0.5, 1.5 );
Game.SetCarAttributes( "fishtruc", 0, 0, 0, 0 );
Game.SetCarAttributes( "garbage", 0, 0, 0, 0 );
Game.SetCarAttributes( "glastruck", 0, 0, 0, 0 );
Game.SetCarAttributes( "gramR_v", 5, 5, 3.5, 3 );
Game.SetCarAttributes( "hallo", 0, 0, 0, 0 );
Game.SetCarAttributes( "hype_v", 4, 4.5, 1.5, 4 );
Game.SetCarAttributes( "icecream", 1, 1, 0.5, 2.5 );
Game.SetCarAttributes( "IStruck", 0, 0, 0, 0 );
Game.SetCarAttributes( "knigh_v", 3.5, 3.5, 2.5, 2.5 );
Game.SetCarAttributes( "minivanA", 0, 0, 0, 0 );
Game.SetCarAttributes( "mono_v", 0.5, 0.5, 2, 0.5 );
Game.SetCarAttributes( "nuctruck", 0, 0, 0, 0 );
Game.SetCarAttributes( "oblit_v", 0.5, 2.5, 5, 2.5 );
Game.SetCarAttributes( "pickupA", 1.5, 1, 0.5, 2.5 );
Game.SetCarAttributes( "pizza", 0, 0, 0, 0 );
Game.SetCarAttributes( "redbrick", 4.5, 4.5, 1.5, 1.5 );
Game.SetCarAttributes( "rocke_v", 5, 5, 0.5, 1 );
Game.SetCarAttributes( "schoolbu", 1, 0.5, 0.5, 1 );
Game.SetCarAttributes( "sedanA", 2, 2.5, 0.5, 3.5 );
Game.SetCarAttributes( "ship", 0, 0, 0, 0 );
Game.SetCarAttributes( "sportsA", 2.5, 2.5, 0.5, 4.5 );
Game.SetCarAttributes( "SUVA", 0, 0, 0, 0 );
Game.SetCarAttributes( "taxiA", 2.5, 1.5, 0.5, 3.5 );
Game.SetCarAttributes( "votetruc", 0, 0, 0, 0 );
Game.SetCarAttributes( "wagonA", 0, 0, 0, 0 );
Game.SetCarAttributes( "witchcar", 0, 0, 0, 0 );
