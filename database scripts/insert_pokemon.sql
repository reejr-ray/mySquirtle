# RUN INSERT_TYPES SCRIPT FIRST!!!

--
-- pokemon INSERT 31 tuple
--

# reset table before adding updated tuples
# this will also delete all poke_locations
DELETE FROM pokemon WHERE (pokemon_id > 0);

# adds a default value to progress index
ALTER TABLE `pokedex`.`pokemon` 
CHANGE COLUMN `progress_index` `progress_index` INT(11) NOT NULL DEFAULT 0 ;

INSERT INTO pokemon(pokemon_id, name, description, height, weight, type_1_id, type_2_id)
VALUES
	(1, 'Bulbasaur', 'It can go for days without eating a single morsel. In the bulb
             on its back, it stores energy.', 0.70, 6.90, 5, 8),
	(2, 'Ivysaur', 'The bulb on its back grows by drawing energy. It gives off an aroma when it is ready to bloom.', 1.0, 13, 5, 8),
	(3, 'Venasaur', 'The flower on its back catches the sun\'s rays. The sunlight is then absorbed and used for energy.', 2.0, 100, 5, 8),
    
    (4, 'Charmander', 'The flame at the tip of its tail makes a sound as it burns. You
             can only hear it in quiet places.', 0.6, 8.5, 2, NULL),
	(5, 'Charmeleon', 'Tough fights could excite this Pokémon. When excited, it may
             blow out bluish-white flames.', 1.1, 19, 2, NULL),
	(6, 'Charizard', 'When expelling a blast of super hot fire, the red flame on the
             tip of its tail burns more intensely.', 1.7, 90.5, 2, NULL),
	
    (7, 'Squirtle', 'Shoots water at prey while in the water. Withdraws into its
             shell when in danger.', 0.5, 9, 3, NULL),
	(8, 'Wartortle', 'When tapped, this Pokémon will pull in its head, but its tail
             will still stick out a little bit.', 1, 22.5, 3, NULL),
	(9, 'Blastoise', 'Once it takes aim at its enemy, it blasts out water with even
             more force than a firehose.', 1.6, 85.5, 3, NULL),
	
    (11, 'Metapod', 'Hardens its shell to protect itself. However, a large impact
              may cause it to pop out of its shell', 0.7, 9.9, 12, NULL),
	(12, 'Butterfree', 'Its wings, covered with poisonous powders, repel water. This
              allows it to fly in the rain.', 1.1, 32, 12, 10),
	
    (16, 'Pidgey', 'Very docile. If attacked, it will often kick up sand to protect
              itself rather than fight back.', 0.3, 1.8, 1, 10),
	(17, 'Pidgeotto', 'This Pokémon is full of vitality. It constantly flies around
              its large territory in search of prey.', 1.1, 30, 1, 10),
	(18, 'Pidgeot', 'This Pokémon flies at Mach 2 speed, seeking prey. Its large
              talons are feared as wicked weapons.', 1.5, 39.5, 1, 10),
	
    (25, 'Pikachu', 'It keeps its tail raised to monitor its surroundings. If you
              yank its tail, it will try to bite you.', 0.4, 6, 4, NULL),
	(26, 'Raichu', 'When electricity builds up inside its body, it becomes feisty.
              It also glows in the dark.', 0.8, 30, 4, NULL),
	
    (27, 'Sandshrew', 'Its body is dry. When it gets cold at night, its hide is said
              to become coated with a fine dew.', 0.6, 12, 4, NULL),
	(28, 'Sandslash', 'It is skilled at slashing enemies with his claws. If broken,
              they start to grow back in a day.', 1, 29.5, 4, NULL),
	
    (74, 'Geodude', 'Often mistaken for rocks. If you step on it, it will get angry.', 0.4, 20, 13, 9),
    (75, 'Graveler', 'Often seen rolling down mountain trails. Obstacles are just
              things to roll straight over, not avoid.', 1, 105, 13, 9),
    (76, 'Golem', 'Once it sheds its skin, its body turns tender and whitish. Its
              hide hardens when it\'s exposed to air.', 1.4, 300, 13, 9),
	
    (87, 'Dewgong', 'Its entire body is a snowy-white. Unharmed by even intense
              cold, it swims powerfully in icy waters.', 1.7, 120, 3, 6),
	
    (92, 'Gastly', 'Said to appear in decrepit, deserted buildings. It has no real
              shape as it appears to be made of gas.', 1.3, 0.1, 14, 8),
	(93, 'Haunter', 'By licking, it saps the victim\'s life. It causes shaking that
              won\'t stop until the victim\'s demise.', 1.6, 0.1, 14, 8),
	(94, 'Gengar', 'A Gengar is close by if you feel a sudden chill. It may be
              trying to lay a curse on you.', 1.5, 40.5, 14, 8),
	
    (106, 'Hitmonlee', 'When kicking, the sole of its foot turns as hard as a diamond
               on impact and destroys its enemy.', 1.5, 49.8, 7, NULL),
	(107, 'Hitmonchan', 'Punches in cork-screw fashion. It can punch its way through a
               concrete wall the same way as a drill.', 1.4, 50.2, 7, NULL),
	
    (122, 'Mr. Mime', 'Always practices its pantomime act. It makes enemies believe
               something exists that really doesn\'t.', 1.3, 54.5, 11, NULL),
	
    (147, 'Dratini', 'The existence of this mythical Pokémon was only recently
               confirmed by a fisherman who caught one.', 1.8, 3.3, 15, NULL),
	(148, 'Dragonair', 'According to a witness, its body was surrounded by a strange
               aura that gave it a mystical look.', 4, 16.5, 15, NULL),
	(149, 'Dragonite', 'It is said that this Pokémon lives somewhere in the sea and
               that it flies. However, it is only a rumor.', 2.2, 210, 15, 7);	