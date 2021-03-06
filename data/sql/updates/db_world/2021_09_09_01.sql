-- Add NPCs into Naxxramas
SET @guid:=134935;
DELETE FROM `creature` WHERE `id` IN (30083);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
-- Group 1 / Located at right-side at Gluth's door outside
(@guid+0, 30083, 533, 0, 0, 3, 1, 0, 0, 3410.94, -3084.66, 294.662, 2.42642, 7200, 0, 0, 156396, 0, 2, 0, 0, 0, 0), -- GUID 134935 leader
(@guid+1, 30083, 533, 0, 0, 3, 1, 0, 0, 3409.51, -3086.2, 294.662, 2.39107, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+2, 30083, 533, 0, 0, 3, 1, 0, 0, 3410.88, -3087.48, 294.662, 2.39107, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+3, 30083, 533, 0, 0, 3, 1, 0, 0, 3412.31, -3086.29, 294.662, 2.26934, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+4, 30083, 533, 0, 0, 3, 1, 0, 0, 3414.18, -3084.71, 294.662, 2.27326, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+5, 30083, 533, 0, 0, 3, 1, 0, 0, 3412.91, -3083.21, 294.662, 2.27326, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+6, 30083, 533, 0, 0, 3, 1, 0, 0, 3411.25, -3081.24, 294.662, 2.27326, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+7, 30083, 533, 0, 0, 3, 1, 0, 0, 3409.55, -3082.68, 294.662, 2.27326, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+8, 30083, 533, 0, 0, 3, 1, 0, 0, 3407.67, -3084.26, 294.662, 2.26934, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),

-- Group 2 / Located in Abo wing and close to the spider wing
(@guid+9, 30083, 533, 0, 0, 3, 1, 0, 0, 3452.91, -3281.6, 267.594, 4.66245, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0), -- GUID 134944 leader
(@guid+10, 30083, 533, 0, 0, 3, 1, 0, 0, 3453.04, -3278.97, 267.594, 4.66245, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+11, 30083, 533, 0, 0, 3, 1, 0, 0, 3450.75, -3280.6, 267.594, 3.74353, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+12, 30083, 533, 0, 0, 3, 1, 0, 0, 3451.24, -3284.51, 267.594, 5.49497, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+13, 30083, 533, 0, 0, 3, 1, 0, 0, 3455.13, -3283.77, 267.594, 0.146405, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+14, 30083, 533, 0, 0, 3, 1, 0, 0, 3455.5, -3279.58, 267.594, 1.45409, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+15, 30083, 533, 0, 0, 3, 1, 0, 0, 3450.28, -3277.25, 267.594, 2.73037, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+16, 30083, 533, 0, 0, 3, 1, 0, 0, 3447.2, -3281.45, 267.594, 4.43075, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),

-- Group 3 / Located In Abo wing and close to the militar wing
(@guid+17, 30083, 533, 0, 0, 3, 1, 0, 0, 3163.76, -2984.34, 267.594, 3.11914, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0), -- GUID 134952 leader
(@guid+18, 30083, 533, 0, 0, 3, 1, 0, 0, 3161.41, -2980.58, 267.594, 2.12953, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+19, 30083, 533, 0, 0, 3, 1, 0, 0, 3159.66, -2984.66, 267.594, 4.30116, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+20, 30083, 533, 0, 0, 3, 1, 0, 0, 3162.34, -2987.89, 267.594, 5.40464, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+21, 30083, 533, 0, 0, 3, 1, 0, 0, 3166.4, -2986.91, 267.594, 0.181745, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+22, 30083, 533, 0, 0, 3, 1, 0, 0, 3168.48, -2983.26, 267.594, 1.05354, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+23, 30083, 533, 0, 0, 3, 1, 0, 0, 3164.23, -2990.77, 267.594, 4.14801, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0),
(@guid+24, 30083, 533, 0, 0, 3, 1, 0, 0, 3155.26, -2985.87, 267.594, 2.75393, 7200, 0, 0, 156396, 0, 0, 0, 0, 0, 0);


-- Assign path_ids to leaders
DELETE FROM `creature_addon` WHERE `guid` IN (134935, 134944, 134952);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`) VALUES 
(134935, 134935, 0, 0, 1, 0, 0),
(134944, 134944, 0, 0, 1, 0, 0),
(134952, 134952, 0, 0, 1, 0, 0);


-- Create groups
SET @guid:=134935;
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (@guid, @guid+9, @guid+17);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
-- Group 1 134946
(@guid, @guid, 5, 0, 2, 0, 0), -- self
(@guid, @guid+1, 5, 0, 2, 0, 0),
(@guid, @guid+2, 5, 60, 2, 0, 0),
(@guid, @guid+3, 5, 120, 2, 0, 0),
(@guid, @guid+4, 5, 170, 2, 0, 0),
(@guid, @guid+5, 5, 220, 2, 0, 0),
(@guid, @guid+6, 5, 270, 2, 0, 0),
(@guid, @guid+7, 5, 310, 2, 0, 0),
(@guid, @guid+8, 5, 330, 2, 0, 0),
-- Group 2
(@guid+9, @guid+9, 5, 0, 2, 0, 0), -- self
(@guid+9, @guid+10, 5, 40, 2, 0, 0),
(@guid+9, @guid+11, 5, 80, 2, 0, 0),
(@guid+9, @guid+12, 5, 120, 2, 0, 0),
(@guid+9, @guid+13, 5, 170, 2, 0, 0),
(@guid+9, @guid+14, 5, 220, 2, 0, 0),
(@guid+9, @guid+15, 5, 270, 2, 0, 0),
(@guid+9, @guid+16, 5, 320, 2, 0, 0),
-- Group 3
(@guid+17, @guid+17, 5, 0, 2, 0, 0), -- self
(@guid+17, @guid+18, 5, 40, 2, 0, 0),
(@guid+17, @guid+19, 5, 80, 2, 0, 0),
(@guid+17, @guid+20, 5, 120, 2, 0, 0),
(@guid+17, @guid+21, 5, 160, 2, 0, 0),
(@guid+17, @guid+22, 5, 210, 2, 0, 0),
(@guid+17, @guid+23, 5, 260, 2, 0, 0),
(@guid+17, @guid+24, 5, 310, 2, 0, 0);


-- Create WPs into the path_ids
DELETE FROM `waypoint_data` WHERE `id` IN (134935, 134944, 134952);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES 
-- For leader on group 1
(134935, 1, 3341.91, -3012.74, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 2, 3339.66, -2995.4, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 3, 3337.08, -2977.52, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 4, 3323.94, -2963.5, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 5, 3299.76, -2962.28, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 6, 3286.44, -2972.35, 294.659, 0, 0, 1, 0, 100, 0),
(134935, 7, 3280.71, -2995.57, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 8, 3288.47, -3011.65, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 9, 3307.81, -3020.18, 294.659, 0, 0, 1, 0, 100, 0),
(134935, 10, 3325.23, -3018.35, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 11, 3338.51, -3016.63, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 12, 3344.34, -3020.25, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 13, 3400.81, -3075.22, 294.663, 0, 0, 1, 0, 100, 0),
(134935, 14, 3423.61, -3104.25, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 15, 3424.38, -3123, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 16, 3428.68, -3145.68, 294.659, 0, 0, 1, 0, 100, 0),
(134935, 17, 3444.72, -3157.38, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 18, 3466.77, -3155.3, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 19, 3481.49, -3139.17, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 20, 3480.31, -3114.89, 294.66, 0, 0, 1, 0, 100, 0),
(134935, 21, 3467.19, -3102.66, 294.659, 0, 0, 1, 0, 100, 0),
(134935, 22, 3448.53, -3099.57, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 23, 3428.41, -3099.18, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 24, 3420.9, -3094.74, 294.661, 0, 0, 1, 0, 100, 0),
(134935, 25, 3401.06, -3074.81, 294.663, 0, 0, 1, 0, 100, 0),
(134935, 26, 3378.62, -3052.37, 294.666, 0, 0, 1, 0, 100, 0),
(134935, 27, 3352.98, -3027.29, 294.661, 0, 0, 1, 0, 100, 0),
-- For leader on group 2
(134944,1,3454.43,-3187.95,294.661,0,0,1,0,100,0),
(134944,2,3453.84,-3215.98,284.005,0,0,1,0,100,0),
(134944,3,3453.85,-3237.72,272.597,0,0,1,0,100,0),
(134944,4,3453.71,-3262.58,267.594,0,0,1,0,100,0),
(134944,5,3453.51,-3285.88,267.592,0,0,1,0,100,0),
(134944,6,3450.01,-3299.01,267.593,0,0,1,0,100,0),
(134944,7,3434.54,-3314.6,267.592,0,0,1,0,100,0),
(134944,8,3423.14,-3338.3,267.593,0,0,1,0,100,0),
(134944,9,3430.53,-3358.82,267.592,0,0,1,0,100,0),
(134944,10,3450.6,-3369.07,267.593,0,0,1,0,100,0),
(134944,11,3472.3,-3362.29,267.599,0,0,1,0,100,0),
(134944,12,3483.6,-3341.97,267.594,0,0,1,0,100,0),
(134944,13,3477.42,-3326.69,267.593,0,0,1,0,100,0),
(134944,14,3466.75,-3312.54,267.592,0,0,1,0,100,0),
(134944,15,3455.72,-3299.39,267.593,0,0,1,0,100,0),
(134944,16,3453.99,-3285.85,267.592,0,0,1,0,100,0),
(134944,17,3454.24,-3262.38,267.594,0,0,1,0,100,0),
(134944,18,3454.45,-3237.65,272.634,0,0,1,0,100,0),
(134944,19,3454.14,-3215.84,284.079,0,0,1,0,100,0),
(134944,21,3453.24,-3128.74,294.661,0,0,1,0,100,0),
(134944,20,3310.69,-2989.38,294.660,0,0,1,0,100,0),
-- For leader on group 3
(134952,1,3250.64,-2986.46,294.661,0,0,1,0,100,0),
(134952,2,3218.22,-2985.76,281.267,0,0,1,0,100,0),
(134952,3,3198.77,-2985.64,271.064,0,0,1,0,100,0),
(134952,4,3178.06,-2985.43,267.594,0,0,1,0,100,0),
(134952,5,3159.36,-2985.34,267.593,0,0,1,0,100,0),
(134952,6,3139.7,-2981.85,267.593,0,0,1,0,100,0),
(134952,7,3126.55,-2971.71,267.592,0,0,1,0,100,0),
(134952,8,3114.56,-2959.22,267.593,0,0,1,0,100,0),
(134952,9,3095.3,-2956.31,267.592,0,0,1,0,100,0),
(134952,10,3078.46,-2964.79,267.592,0,0,1,0,100,0),
(134952,11,3070.6,-2982.7,267.593,0,0,1,0,100,0),
(134952,12,3076.85,-3004.05,267.592,0,0,1,0,100,0),
(134952,13,3096.73,-3015.38,267.593,0,0,1,0,100,0),
(134952,14,3115.12,-3011.5,267.592,0,0,1,0,100,0),
(134952,15,3127.6,-2998.09,267.592,0,0,1,0,100,0),
(134952,16,3139.45,-2989.03,267.593,0,0,1,0,100,0),
(134952,17,3159.26,-2985.91,267.593,0,0,1,0,100,0),
(134952,18,3178.11,-2985.84,267.594,0,0,1,0,100,0),
(134952,19,3198.91,-2986.18,271.135,0,0,1,0,100,0),
(134952,20,3218.02,-2986.24,281.163,0,0,1,0,100,0),
(134952,21,3310.69,-2989.38,294.660,0,0,1,0,100,0),
(134952,22,3453.24,-3128.74,294.661,0,0,1,0,100,0);


-- Update movement type to use WPs
UPDATE `creature` SET `MovementType`=2 WHERE `guid`IN (134935, 134944, 134952);