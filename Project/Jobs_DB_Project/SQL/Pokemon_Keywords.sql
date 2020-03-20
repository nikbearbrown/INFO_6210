-- phpMyAdmin SQL Dump
-- version 4.0.3
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2015 at 08:41 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gsmp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Pokemon_Keywords`
--

CREATE TABLE IF NOT EXISTS `Pokemon_Keywords` (
  `keyword` varchar(255) DEFAULT NULL,
  `category_id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Pokemon_Keywords`
--

INSERT INTO `Pokemon_Keywords` (`keyword`, `category_id`) VALUES
('abomasnow', 0),
('abomasnow-mega', 0),
('abra', 0),
('absol', 0),
('absol-mega', 0),
('accelgor', 0),
('aegislash-blade', 0),
('aegislash-shield', 0),
('aerodactyl', 0),
('aerodactyl-mega', 0),
('aggron', 0),
('aggron-mega', 0),
('aipom', 0),
('alakazam', 0),
('alakazam-mega', 0),
('alomomola', 0),
('altaria', 0),
('amaura', 0),
('ambipom', 0),
('amoonguss', 0),
('ampharos', 0),
('ampharos-mega', 0),
('anorith', 0),
('arbok', 0),
('arcanine', 0),
('arceus', 0),
('archen', 0),
('archeops', 0),
('ariados', 0),
('armaldo', 0),
('aromatisse', 0),
('aron', 0),
('articuno', 0),
('audino', 0),
('aurorus', 0),
('avalugg', 0),
('axew', 0),
('azelf', 0),
('azumarill', 0),
('azurill', 0),
('bagon', 0),
('baltoy', 0),
('banette', 0),
('banette-mega', 0),
('barbaracle', 0),
('barboach', 0),
('basculin-blue-stripe', 0),
('basculin-red-striped', 0),
('bastiodon', 0),
('bayleef', 0),
('beartic', 0),
('beautifly', 0),
('beedrill', 0),
('beheeyem', 0),
('beldum', 0),
('bellossom', 0),
('bellsprout', 0),
('bergmite', 0),
('bibarel', 0),
('bidoof', 0),
('binacle', 0),
('bisharp', 0),
('blastoise', 0),
('blastoise-mega', 0),
('blaziken', 0),
('blaziken-mega', 0),
('blissey', 0),
('blitzle', 0),
('boldore', 0),
('bonsly', 0),
('bouffalant', 0),
('braixen', 0),
('braviary', 0),
('breloom', 0),
('bronzong', 0),
('bronzor', 0),
('budew', 0),
('buizel', 0),
('bulbasaur', 0),
('buneary', 0),
('bunnelby', 0),
('burmy', 0),
('butterfree', 0),
('cacnea', 0),
('cacturne', 0),
('camerupt', 0),
('carbink', 0),
('carnivine', 0),
('carracosta', 0),
('carvanha', 0),
('cascoon', 0),
('castform', 0),
('castform-rainy', 0),
('castform-snowy', 0),
('castform-sunny', 0),
('caterpie', 0),
('celebi', 0),
('chandelure', 0),
('chansey', 0),
('charizard', 0),
('charizard-mega-x', 0),
('charizard-mega-y', 0),
('charmander', 0),
('charmeleon', 0),
('chatot', 0),
('cherrim', 0),
('cherubi', 0),
('chesnaught', 0),
('chespin', 0),
('chikorita', 0),
('chimchar', 0),
('chimecho', 0),
('chinchou', 0),
('chingling', 0),
('cinccino', 0),
('clamperl', 0),
('clauncher', 0),
('clawitzer', 0),
('claydol', 0),
('clefable', 0),
('clefairy', 0),
('cleffa', 0),
('cloyster', 0),
('cobalion', 0),
('cofagrigus', 0),
('combee', 0),
('combusken', 0),
('conkeldurr', 0),
('corphish', 0),
('corsola', 0),
('cottonee', 0),
('cradily', 0),
('cranidos', 0),
('crawdaunt', 0),
('cresselia', 0),
('croagunk', 0),
('crobat', 0),
('croconaw', 0),
('crustle', 0),
('cryogonal', 0),
('cubchoo', 0),
('cubone', 0),
('cyndaquil', 0),
('darkrai', 0),
('darmanitan-standard', 0),
('darmanitan-zen', 0),
('darumaka', 0),
('dedenne', 0),
('deerling', 0),
('deino', 0),
('delcatty', 0),
('delibird', 0),
('delphox', 0),
('deoxys-attack', 0),
('deoxys-defense', 0),
('deoxys-normal', 0),
('deoxys-speed', 0),
('dewgong', 0),
('dewott', 0),
('dialga', 0),
('diancie', 0),
('diggersby', 0),
('diglett', 0),
('ditto', 0),
('dodrio', 0),
('doduo', 0),
('donphan', 0),
('doublade', 0),
('dragalge', 0),
('dragonair', 0),
('dragonite', 0),
('drapion', 0),
('dratini', 0),
('drifblim', 0),
('drifloon', 0),
('drilbur', 0),
('drowzee', 0),
('druddigon', 0),
('ducklett', 0),
('dugtrio', 0),
('dunsparce', 0),
('duosion', 0),
('durant', 0),
('dusclops', 0),
('dusknoir', 0),
('duskull', 0),
('dustox', 0),
('dwebble', 0),
('eelektrik', 0),
('eelektross', 0),
('eevee', 0),
('ekans', 0),
('electabuzz', 0),
('electivire', 0),
('electrike', 0),
('electrode', 0),
('elekid', 0),
('elgyem', 0),
('emboar', 0),
('emolga', 0),
('empoleon', 0),
('entei', 0),
('escavalier', 0),
('espeon', 0),
('espurr', 0),
('excadrill', 0),
('exeggcute', 0),
('exeggutor', 0),
('exploud', 0),
('farfetchd', 0),
('fearow', 0),
('feebas', 0),
('fennekin', 0),
('feraligatr', 0),
('ferroseed', 0),
('ferrothorn', 0),
('finneon', 0),
('flaaffy', 0),
('flabebe', 0),
('flareon', 0),
('fletchinder', 0),
('fletchling', 0),
('floatzel', 0),
('floette', 0),
('floette-eternal', 0),
('florges', 0),
('flygon', 0),
('foongus', 0),
('forretress', 0),
('fraxure', 0),
('frillish', 0),
('froakie', 0),
('frogadier', 0),
('froslass', 0),
('furfrou', 0),
('furret', 0),
('gabite', 0),
('gallade', 0),
('galvantula', 0),
('garbodor', 0),
('garchomp', 0),
('garchomp-mega', 0),
('gardevoir', 0),
('gardevoir-mega', 0),
('gastly', 0),
('gastrodon', 0),
('genesect', 0),
('gengar', 0),
('gengar-mega', 0),
('geodude', 0),
('gible', 0),
('gigalith', 0),
('girafarig', 0),
('giratina-altered', 0),
('giratina-origin', 0),
('glaceon', 0),
('glalie', 0),
('glameow', 0),
('gligar', 0),
('gliscor', 0),
('gloom', 0),
('gogoat', 0),
('golbat', 0),
('goldeen', 0),
('golduck', 0),
('golem', 0),
('golett', 0),
('golurk', 0),
('goodra', 0),
('goomy', 0),
('gorebyss', 0),
('gothita', 0),
('gothitelle', 0),
('gothorita', 0),
('gourgeist-average', 0),
('gourgeist-large', 0),
('gourgeist-small', 0),
('gourgeist-super', 0),
('granbull', 0),
('graveler', 0),
('greninja', 0),
('grimer', 0),
('grotle', 0),
('groudon', 0),
('grovyle', 0),
('growlithe', 0),
('grumpig', 0),
('gulpin', 0),
('gurdurr', 0),
('gyarados', 0),
('gyarados-mega', 0),
('happiny', 0),
('hariyama', 0),
('haunter', 0),
('hawlucha', 0),
('haxorus', 0),
('heatmor', 0),
('heatran', 0),
('heliolisk', 0),
('helioptile', 0),
('heracross', 0),
('heracross-mega', 0),
('herdier', 0),
('hippopotas', 0),
('hippowdon', 0),
('hitmonchan', 0),
('hitmonlee', 0),
('hitmontop', 0),
('ho-oh', 0),
('honchkrow', 0),
('honedge', 0),
('hoopa', 0),
('hoothoot', 0),
('hoppip', 0),
('horsea', 0),
('houndoom', 0),
('houndoom-mega', 0),
('houndour', 0),
('huntail', 0),
('hydreigon', 0),
('hypno', 0),
('igglybuff', 0),
('illumise', 0),
('infernape', 0),
('inkay', 0),
('ivysaur', 0),
('jellicent', 0),
('jigglypuff', 0),
('jirachi', 0),
('jolteon', 0),
('joltik', 0),
('jumpluff', 0),
('jynx', 0),
('kabuto', 0),
('kabutops', 0),
('kadabra', 0),
('kakuna', 0),
('kangaskhan', 0),
('kangaskhan-mega', 0),
('karrablast', 0),
('kecleon', 0),
('keldeo-ordinary', 0),
('keldeo-resolute', 0),
('kingdra', 0),
('kingler', 0),
('kirlia', 0),
('klang', 0),
('klefki', 0),
('klink', 0),
('klinklang', 0),
('koffing', 0),
('krabby', 0),
('kricketot', 0),
('kricketune', 0),
('krokorok', 0),
('krookodile', 0),
('kyogre', 0),
('kyurem', 0),
('kyurem-black', 0),
('kyurem-white', 0),
('lairon', 0),
('lampent', 0),
('landorus-incarnate', 0),
('landorus-therian', 0),
('lanturn', 0),
('lapras', 0),
('larvesta', 0),
('larvitar', 0),
('latias', 0),
('latias-mega', 0),
('latios', 0),
('latios-mega', 0),
('leafeon', 0),
('leavanny', 0),
('ledian', 0),
('ledyba', 0),
('lickilicky', 0),
('lickitung', 0),
('liepard', 0),
('lileep', 0),
('lilligant', 0),
('lillipup', 0),
('linoone', 0),
('litleo', 0),
('litwick', 0),
('lombre', 0),
('lopunny', 0),
('lotad', 0),
('loudred', 0),
('lucario', 0),
('lucario-mega', 0),
('ludicolo', 0),
('lugia', 0),
('lumineon', 0),
('lunatone', 0),
('luvdisc', 0),
('luxio', 0),
('luxray', 0),
('machamp', 0),
('machoke', 0),
('machop', 0),
('magby', 0),
('magcargo', 0),
('magikarp', 0),
('magmar', 0),
('magmortar', 0),
('magnemite', 0),
('magneton', 0),
('magnezone', 0),
('makuhita', 0),
('malamar', 0),
('mamoswine', 0),
('manaphy', 0),
('mandibuzz', 0),
('manectric', 0),
('manectric-mega', 0),
('mankey', 0),
('mantine', 0),
('mantyke', 0),
('maractus', 0),
('mareep', 0),
('marill', 0),
('marowak', 0),
('marshtomp', 0),
('masquerain', 0),
('mawile', 0),
('mawile-mega', 0),
('medicham', 0),
('medicham-mega', 0),
('meditite', 0),
('meganium', 0),
('meloetta-aria', 0),
('meloetta-pirouette', 0),
('meowstic-female', 0),
('meowstic-male', 0),
('meowth', 0),
('mesprit', 0),
('metagross', 0),
('metang', 0),
('metapod', 0),
('mew', 0),
('mewtwo', 0),
('mewtwo-mega-x', 0),
('mewtwo-mega-y', 0),
('mienfoo', 0),
('mienshao', 0),
('mightyena', 0),
('milotic', 0),
('miltank', 0),
('mime-jr', 0),
('minccino', 0),
('minun', 0),
('misdreavus', 0),
('mismagius', 0),
('moltres', 0),
('monferno', 0),
('mothim', 0),
('mr-mime', 0),
('mudkip', 0),
('muk', 0),
('munchlax', 0),
('munna', 0),
('murkrow', 0),
('musharna', 0),
('natu', 0),
('nidoking', 0),
('nidoqueen', 0),
('nidoran-f', 0),
('nidoran-m', 0),
('nidorina', 0),
('nidorino', 0),
('nincada', 0),
('ninetales', 0),
('ninjask', 0),
('noctowl', 0),
('noibat', 0),
('noivern', 0),
('nosepass', 0),
('numel', 0),
('nuzleaf', 0),
('octillery', 0),
('oddish', 0),
('omanyte', 0),
('omastar', 0),
('onix', 0),
('oshawott', 0),
('pachirisu', 0),
('palkia', 0),
('palpitoad', 0),
('pancham', 0),
('pangoro', 0),
('panpour', 0),
('pansage', 0),
('pansear', 0),
('paras', 0),
('parasect', 0),
('patrat', 0),
('pawniard', 0),
('pelipper', 0),
('persian', 0),
('petilil', 0),
('phanpy', 0),
('phantump', 0),
('phione', 0),
('pichu', 0),
('pidgeot', 0),
('pidgeotto', 0),
('pidgey', 0),
('pidove', 0),
('pignite', 0),
('pikachu', 0),
('piloswine', 0),
('pineco', 0),
('pinsir', 0),
('pinsir-mega', 0),
('piplup', 0),
('plusle', 0),
('politoed', 0),
('poliwag', 0),
('poliwhirl', 0),
('poliwrath', 0),
('ponyta', 0),
('poochyena', 0),
('porygon', 0),
('porygon-z', 0),
('porygon2', 0),
('primeape', 0),
('prinplup', 0),
('probopass', 0),
('psyduck', 0),
('pumpkaboo-average', 0),
('pumpkaboo-large', 0),
('pumpkaboo-small', 0),
('pumpkaboo-super', 0),
('pupitar', 0),
('purrloin', 0),
('purugly', 0),
('pyroar', 0),
('quagsire', 0),
('quilava', 0),
('quilladin', 0),
('qwilfish', 0),
('raichu', 0),
('raikou', 0),
('ralts', 0),
('rampardos', 0),
('rapidash', 0),
('raticate', 0),
('rattata', 0),
('rayquaza', 0),
('regice', 0),
('regigigas', 0),
('regirock', 0),
('registeel', 0),
('relicanth', 0),
('remoraid', 0),
('reshiram', 0),
('reuniclus', 0),
('rhydon', 0),
('rhyhorn', 0),
('rhyperior', 0),
('riolu', 0),
('roggenrola', 0),
('roselia', 0),
('roserade', 0),
('rotom', 0),
('rotom-fan', 0),
('rotom-frost', 0),
('rotom-heat', 0),
('rotom-mow', 0),
('rotom-wash', 0),
('rufflet', 0),
('sableye', 0),
('salamence', 0),
('samurott', 0),
('sandile', 0),
('sandshrew', 0),
('sandslash', 0),
('sawk', 0),
('sawsbuck', 0),
('scatterbug', 0),
('sceptile', 0),
('scizor', 0),
('scizor-mega', 0),
('scolipede', 0),
('scrafty', 0),
('scraggy', 0),
('scyther', 0),
('seadra', 0),
('seaking', 0),
('sealeo', 0),
('seedot', 0),
('seel', 0),
('seismitoad', 0),
('sentret', 0),
('serperior', 0),
('servine', 0),
('seviper', 0),
('sewaddle', 0),
('sharpedo', 0),
('shaymin-land', 0),
('shaymin-sky', 0),
('shedinja', 0),
('shelgon', 0),
('shellder', 0),
('shellos', 0),
('shelmet', 0),
('shieldon', 0),
('shiftry', 0),
('shinx', 0),
('shroomish', 0),
('shuckle', 0),
('shuppet', 0),
('sigilyph', 0),
('silcoon', 0),
('simipour', 0),
('simisage', 0),
('simisear', 0),
('skarmory', 0),
('skiddo', 0),
('skiploom', 0),
('skitty', 0),
('skorupi', 0),
('skrelp', 0),
('skuntank', 0),
('slaking', 0),
('slakoth', 0),
('sliggoo', 0),
('slowbro', 0),
('slowking', 0),
('slowpoke', 0),
('slugma', 0),
('slurpuff', 0),
('smeargle', 0),
('smoochum', 0),
('sneasel', 0),
('snivy', 0),
('snorlax', 0),
('snorunt', 0),
('snover', 0),
('snubbull', 0),
('solosis', 0),
('solrock', 0),
('spearow', 0),
('spewpa', 0),
('spheal', 0),
('spinarak', 0),
('spinda', 0),
('spiritomb', 0),
('spoink', 0),
('spritzee', 0),
('squirtle', 0),
('stantler', 0),
('staraptor', 0),
('staravia', 0),
('starly', 0),
('starmie', 0),
('staryu', 0),
('steelix', 0),
('stoutland', 0),
('stunfisk', 0),
('stunky', 0),
('sudowoodo', 0),
('suicune', 0),
('sunflora', 0),
('sunkern', 0),
('surskit', 0),
('swablu', 0),
('swadloon', 0),
('swalot', 0),
('swampert', 0),
('swanna', 0),
('swellow', 0),
('swinub', 0),
('swirlix', 0),
('swoobat', 0),
('sylveon', 0),
('taillow', 0),
('talonflame', 0),
('tangela', 0),
('tangrowth', 0),
('tauros', 0),
('teddiursa', 0),
('tentacool', 0),
('tentacruel', 0),
('tepig', 0),
('terrakion', 0),
('throh', 0),
('thundurus-incarnate', 0),
('thundurus-therian', 0),
('timburr', 0),
('tirtouga', 0),
('togekiss', 0),
('togepi', 0),
('togetic', 0),
('torchic', 0),
('torkoal', 0),
('tornadus-incarnate', 0),
('tornadus-therian', 0),
('torterra', 0),
('totodile', 0),
('toxicroak', 0),
('tranquill', 0),
('trapinch', 0),
('treecko', 0),
('trevenant', 0),
('tropius', 0),
('trubbish', 0),
('turtwig', 0),
('tympole', 0),
('tynamo', 0),
('typhlosion', 0),
('tyranitar', 0),
('tyranitar-mega', 0),
('tyrantrum', 0),
('tyrogue', 0),
('tyrunt', 0),
('umbreon', 0),
('unfezant', 0),
('unown', 0),
('ursaring', 0),
('uxie', 0),
('vanillish', 0),
('vanillite', 0),
('vanilluxe', 0),
('vaporeon', 0),
('venipede', 0),
('venomoth', 0),
('venonat', 0),
('venusaur', 0),
('venusaur-mega', 0),
('vespiquen', 0),
('vibrava', 0),
('victini', 0),
('victreebel', 0),
('vigoroth', 0),
('vileplume', 0),
('virizion', 0),
('vivillon', 0),
('volbeat', 0),
('volcanion', 0),
('volcarona', 0),
('voltorb', 0),
('vullaby', 0),
('vulpix', 0),
('wailmer', 0),
('wailord', 0),
('walrein', 0),
('wartortle', 0),
('watchog', 0),
('weavile', 0),
('weedle', 0),
('weepinbell', 0),
('weezing', 0),
('whimsicott', 0),
('whirlipede', 0),
('whiscash', 0),
('whismur', 0),
('wigglytuff', 0),
('wingull', 0),
('wobbuffet', 0),
('woobat', 0),
('wooper', 0),
('wormadam-plant', 0),
('wormadam-sandy', 0),
('wormadam-trash', 0),
('wurmple', 0),
('wynaut', 0),
('xatu', 0),
('xerneas', 0),
('yamask', 0),
('yanma', 0),
('yanmega', 0),
('yveltal', 0),
('zangoose', 0),
('zapdos', 0),
('zebstrika', 0),
('zekrom', 0),
('zigzagoon', 0),
('zoroark', 0),
('zorua', 0),
('zubat', 0),
('zweilous', 0),
('zygarde', 0),
('pound', 1),
('karate-chop', 1),
('double-slap', 1),
('comet-punch', 1),
('mega-punch', 1),
('pay-day', 1),
('fire-punch', 1),
('ice-punch', 1),
('thunder-punch', 1),
('scratch', 1),
('vice-grip', 1),
('guillotine', 1),
('razor-wind', 1),
('swords-dance', 1),
('cut', 1),
('gust', 1),
('wing-attack', 1),
('whirlwind', 1),
('fly', 1),
('bind', 1),
('slam', 1),
('vine-whip', 1),
('stomp', 1),
('double-kick', 1),
('mega-kick', 1),
('jump-kick', 1),
('rolling-kick', 1),
('sand-attack', 1),
('headbutt', 1),
('horn-attack', 1),
('fury-attack', 1),
('horn-drill', 1),
('tackle', 1),
('body-slam', 1),
('wrap', 1),
('take-down', 1),
('thrash', 1),
('double-edge', 1),
('tail-whip', 1),
('poison-sting', 1),
('twineedle', 1),
('pin-missile', 1),
('leer', 1),
('bite', 1),
('growl', 1),
('roar', 1),
('sing', 1),
('supersonic', 1),
('sonic-boom', 1),
('disable', 1),
('acid', 1),
('ember', 1),
('flamethrower', 1),
('mist', 1),
('water-gun', 1),
('hydro-pump', 1),
('surf', 1),
('ice-beam', 1),
('blizzard', 1),
('psybeam', 1),
('bubble-beam', 1),
('aurora-beam', 1),
('hyper-beam', 1),
('peck', 1),
('drill-peck', 1),
('submission', 1),
('low-kick', 1),
('counter', 1),
('seismic-toss', 1),
('strength', 1),
('absorb', 1),
('mega-drain', 1),
('leech-seed', 1),
('growth', 1),
('razor-leaf', 1),
('solar-beam', 1),
('poison-powder', 1),
('stun-spore', 1),
('sleep-powder', 1),
('petal-dance', 1),
('string-shot', 1),
('dragon-rage', 1),
('fire-spin', 1),
('thunder-shock', 1),
('thunderbolt', 1),
('thunder-wave', 1),
('thunder', 1),
('rock-throw', 1),
('earthquake', 1),
('fissure', 1),
('dig', 1),
('toxic', 1),
('confusion', 1),
('psychic', 1),
('hypnosis', 1),
('meditate', 1),
('agility', 1),
('quick-attack', 1),
('rage', 1),
('teleport', 1),
('night-shade', 1),
('mimic', 1),
('screech', 1),
('double-team', 1),
('recover', 1),
('harden', 1),
('minimize', 1),
('smokescreen', 1),
('confuse-ray', 1),
('withdraw', 1),
('defense-curl', 1),
('barrier', 1),
('light-screen', 1),
('haze', 1),
('reflect', 1),
('focus-energy', 1),
('bide', 1),
('metronome', 1),
('mirror-move', 1),
('self-destruct', 1),
('egg-bomb', 1),
('lick', 1),
('smog', 1),
('sludge', 1),
('bone-club', 1),
('fire-blast', 1),
('waterfall', 1),
('clamp', 1),
('swift', 1),
('skull-bash', 1),
('spike-cannon', 1),
('constrict', 1),
('amnesia', 1),
('kinesis', 1),
('soft-boiled', 1),
('high-jump-kick', 1),
('glare', 1),
('dream-eater', 1),
('poison-gas', 1),
('barrage', 1),
('leech-life', 1),
('lovely-kiss', 1),
('sky-attack', 1),
('transform', 1),
('bubble', 1),
('dizzy-punch', 1),
('spore', 1),
('flash', 1),
('psywave', 1),
('splash', 1),
('acid-armor', 1),
('crabhammer', 1),
('explosion', 1),
('fury-swipes', 1),
('bonemerang', 1),
('rest', 1),
('rock-slide', 1),
('hyper-fang', 1),
('sharpen', 1),
('conversion', 1),
('tri-attack', 1),
('super-fang', 1),
('slash', 1),
('substitute', 1),
('struggle', 1),
('sketch', 1),
('triple-kick', 1),
('thief', 1),
('spider-web', 1),
('mind-reader', 1),
('nightmare', 1),
('flame-wheel', 1),
('snore', 1),
('curse', 1),
('flail', 1),
('conversion-2', 1),
('aeroblast', 1),
('cotton-spore', 1),
('reversal', 1),
('spite', 1),
('powder-snow', 1),
('protect', 1),
('mach-punch', 1),
('scary-face', 1),
('feint-attack', 1),
('sweet-kiss', 1),
('belly-drum', 1),
('sludge-bomb', 1),
('mud-slap', 1),
('octazooka', 1),
('spikes', 1),
('zap-cannon', 1),
('foresight', 1),
('destiny-bond', 1),
('perish-song', 1),
('icy-wind', 1),
('detect', 1),
('bone-rush', 1),
('lock-on', 1),
('outrage', 1),
('sandstorm', 1),
('giga-drain', 1),
('endure', 1),
('charm', 1),
('rollout', 1),
('false-swipe', 1),
('swagger', 1),
('milk-drink', 1),
('spark', 1),
('fury-cutter', 1),
('steel-wing', 1),
('mean-look', 1),
('attract', 1),
('sleep-talk', 1),
('heal-bell', 1),
('return', 1),
('present', 1),
('frustration', 1),
('safeguard', 1),
('pain-split', 1),
('sacred-fire', 1),
('magnitude', 1),
('dynamic-punch', 1),
('megahorn', 1),
('dragon-breath', 1),
('baton-pass', 1),
('encore', 1),
('pursuit', 1),
('rapid-spin', 1),
('sweet-scent', 1),
('iron-tail', 1),
('metal-claw', 1),
('vital-throw', 1),
('morning-sun', 1),
('synthesis', 1),
('moonlight', 1),
('hidden-power', 1),
('cross-chop', 1),
('twister', 1),
('rain-dance', 1),
('sunny-day', 1),
('crunch', 1),
('mirror-coat', 1),
('psych-up', 1),
('extreme-speed', 1),
('ancient-power', 1),
('shadow-ball', 1),
('future-sight', 1),
('rock-smash', 1),
('whirlpool', 1),
('beat-up', 1),
('fake-out', 1),
('uproar', 1),
('stockpile', 1),
('spit-up', 1),
('swallow', 1),
('heat-wave', 1),
('hail', 1),
('torment', 1),
('flatter', 1),
('will-o-wisp', 1),
('memento', 1),
('facade', 1),
('focus-punch', 1),
('smelling-salts', 1),
('follow-me', 1),
('nature-power', 1),
('charge', 1),
('taunt', 1),
('helping-hand', 1),
('trick', 1),
('role-play', 1),
('wish', 1),
('assist', 1),
('ingrain', 1),
('superpower', 1),
('magic-coat', 1),
('recycle', 1),
('revenge', 1),
('brick-break', 1),
('yawn', 1),
('knock-off', 1),
('endeavor', 1),
('eruption', 1),
('skill-swap', 1),
('imprison', 1),
('refresh', 1),
('grudge', 1),
('snatch', 1),
('secret-power', 1),
('dive', 1),
('arm-thrust', 1),
('camouflage', 1),
('tail-glow', 1),
('luster-purge', 1),
('mist-ball', 1),
('feather-dance', 1),
('teeter-dance', 1),
('blaze-kick', 1),
('mud-sport', 1),
('ice-ball', 1),
('needle-arm', 1),
('slack-off', 1),
('hyper-voice', 1),
('poison-fang', 1),
('crush-claw', 1),
('blast-burn', 1),
('hydro-cannon', 1),
('meteor-mash', 1),
('astonish', 1),
('weather-ball', 1),
('aromatherapy', 1),
('fake-tears', 1),
('air-cutter', 1),
('overheat', 1),
('odor-sleuth', 1),
('rock-tomb', 1),
('silver-wind', 1),
('metal-sound', 1),
('grass-whistle', 1),
('tickle', 1),
('cosmic-power', 1),
('water-spout', 1),
('signal-beam', 1),
('shadow-punch', 1),
('extrasensory', 1),
('sky-uppercut', 1),
('sand-tomb', 1),
('sheer-cold', 1),
('muddy-water', 1),
('bullet-seed', 1),
('aerial-ace', 1),
('icicle-spear', 1),
('iron-defense', 1),
('block', 1),
('howl', 1),
('dragon-claw', 1),
('frenzy-plant', 1),
('bulk-up', 1),
('bounce', 1),
('mud-shot', 1),
('poison-tail', 1),
('covet', 1),
('volt-tackle', 1),
('magical-leaf', 1),
('water-sport', 1),
('calm-mind', 1),
('leaf-blade', 1),
('dragon-dance', 1),
('rock-blast', 1),
('shock-wave', 1),
('water-pulse', 1),
('doom-desire', 1),
('psycho-boost', 1),
('roost', 1),
('gravity', 1),
('miracle-eye', 1),
('wake-up-slap', 1),
('hammer-arm', 1),
('gyro-ball', 1),
('healing-wish', 1),
('brine', 1),
('natural-gift', 1),
('feint', 1),
('pluck', 1),
('tailwind', 1),
('acupressure', 1),
('metal-burst', 1),
('u-turn', 1),
('close-combat', 1),
('payback', 1),
('assurance', 1),
('embargo', 1),
('fling', 1),
('psycho-shift', 1),
('trump-card', 1),
('heal-block', 1),
('wring-out', 1),
('power-trick', 1),
('gastro-acid', 1),
('lucky-chant', 1),
('me-first', 1),
('copycat', 1),
('power-swap', 1),
('guard-swap', 1),
('punishment', 1),
('last-resort', 1),
('worry-seed', 1),
('sucker-punch', 1),
('toxic-spikes', 1),
('heart-swap', 1),
('aqua-ring', 1),
('magnet-rise', 1),
('flare-blitz', 1),
('force-palm', 1),
('aura-sphere', 1),
('rock-polish', 1),
('poison-jab', 1),
('dark-pulse', 1),
('night-slash', 1),
('aqua-tail', 1),
('seed-bomb', 1),
('air-slash', 1),
('x-scissor', 1),
('bug-buzz', 1),
('dragon-pulse', 1),
('dragon-rush', 1),
('power-gem', 1),
('drain-punch', 1),
('vacuum-wave', 1),
('focus-blast', 1),
('energy-ball', 1),
('brave-bird', 1),
('earth-power', 1),
('switcheroo', 1),
('giga-impact', 1),
('nasty-plot', 1),
('bullet-punch', 1),
('avalanche', 1),
('ice-shard', 1),
('shadow-claw', 1),
('thunder-fang', 1),
('ice-fang', 1),
('fire-fang', 1),
('shadow-sneak', 1),
('mud-bomb', 1),
('psycho-cut', 1),
('zen-headbutt', 1),
('mirror-shot', 1),
('flash-cannon', 1),
('rock-climb', 1),
('defog', 1),
('trick-room', 1),
('draco-meteor', 1),
('discharge', 1),
('lava-plume', 1),
('leaf-storm', 1),
('power-whip', 1),
('rock-wrecker', 1),
('cross-poison', 1),
('gunk-shot', 1),
('iron-head', 1),
('magnet-bomb', 1),
('stone-edge', 1),
('captivate', 1),
('stealth-rock', 1),
('grass-knot', 1),
('chatter', 1),
('judgment', 1),
('bug-bite', 1),
('charge-beam', 1),
('wood-hammer', 1),
('aqua-jet', 1),
('attack-order', 1),
('defend-order', 1),
('heal-order', 1),
('head-smash', 1),
('double-hit', 1),
('roar-of-time', 1),
('spacial-rend', 1),
('lunar-dance', 1),
('crush-grip', 1),
('magma-storm', 1),
('dark-void', 1),
('seed-flare', 1),
('ominous-wind', 1),
('shadow-force', 1),
('hone-claws', 1),
('wide-guard', 1),
('guard-split', 1),
('power-split', 1),
('wonder-room', 1),
('psyshock', 1),
('venoshock', 1),
('autotomize', 1),
('rage-powder', 1),
('telekinesis', 1),
('magic-room', 1),
('smack-down', 1),
('storm-throw', 1),
('flame-burst', 1),
('sludge-wave', 1),
('quiver-dance', 1),
('heavy-slam', 1),
('synchronoise', 1),
('electro-ball', 1),
('soak', 1),
('flame-charge', 1),
('coil', 1),
('low-sweep', 1),
('acid-spray', 1),
('foul-play', 1),
('simple-beam', 1),
('entrainment', 1),
('after-you', 1),
('round', 1),
('echoed-voice', 1),
('chip-away', 1),
('clear-smog', 1),
('stored-power', 1),
('quick-guard', 1),
('ally-switch', 1),
('scald', 1),
('shell-smash', 1),
('heal-pulse', 1),
('hex', 1),
('sky-drop', 1),
('shift-gear', 1),
('circle-throw', 1),
('incinerate', 1),
('quash', 1),
('acrobatics', 1),
('reflect-type', 1),
('retaliate', 1),
('final-gambit', 1),
('bestow', 1),
('inferno', 1),
('water-pledge', 1),
('fire-pledge', 1),
('grass-pledge', 1),
('volt-switch', 1),
('struggle-bug', 1),
('bulldoze', 1),
('frost-breath', 1),
('dragon-tail', 1),
('work-up', 1),
('electroweb', 1),
('wild-charge', 1),
('drill-run', 1),
('dual-chop', 1),
('heart-stamp', 1),
('horn-leech', 1),
('sacred-sword', 1),
('razor-shell', 1),
('heat-crash', 1),
('leaf-tornado', 1),
('steamroller', 1),
('cotton-guard', 1),
('night-daze', 1),
('psystrike', 1),
('tail-slap', 1),
('hurricane', 1),
('head-charge', 1),
('gear-grind', 1),
('searing-shot', 1),
('techno-blast', 1),
('relic-song', 1),
('secret-sword', 1),
('glaciate', 1),
('bolt-strike', 1),
('blue-flare', 1),
('fiery-dance', 1),
('freeze-shock', 1),
('ice-burn', 1),
('snarl', 1),
('icicle-crash', 1),
('v-create', 1),
('fusion-flare', 1),
('fusion-bolt', 1),
('flying-press', 1),
('mat-block', 1),
('belch', 1),
('rototiller', 1),
('sticky-web', 1),
('fell-stinger', 1),
('phantom-force', 1),
('trick-or-treat', 1),
('noble-roar', 1),
('ion-deluge', 1),
('parabolic-charge', 1),
('forests-curse', 1),
('petal-blizzard', 1),
('freeze-dry', 1),
('disarming-voice', 1),
('parting-shot', 1),
('topsy-turvy', 1),
('draining-kiss', 1),
('crafty-shield', 1),
('flower-shield', 1),
('grassy-terrain', 1),
('misty-terrain', 1),
('electrify', 1),
('play-rough', 1),
('fairy-wind', 1),
('moonblast', 1),
('boomburst', 1),
('fairy-lock', 1),
('kings-shield', 1),
('play-nice', 1),
('confide', 1),
('diamond-storm', 1),
('steam-eruption', 1),
('hyperspace-hole', 1),
('water-shuriken', 1),
('mystical-fire', 1),
('spiky-shield', 1),
('aromatic-mist', 1),
('eerie-impulse', 1),
('venom-drench', 1),
('powder', 1),
('geomancy', 1),
('magnetic-flux', 1),
('happy-hour', 1),
('electric-terrain', 1),
('dazzling-gleam', 1),
('celebrate', 1),
('hold-hands', 1),
('baby-doll-eyes', 1),
('nuzzle', 1),
('hold-back', 1),
('infestation', 1),
('power-up-punch', 1),
('oblivion-wing', 1),
('thousand-arrows', 1),
('thousand-waves', 1),
('lands-wrath', 1),
('light-of-ruin', 1),
('shadow-rush', 1),
('shadow-blast', 1),
('shadow-blitz', 1),
('shadow-bolt', 1),
('shadow-break', 1),
('shadow-chill', 1),
('shadow-end', 1),
('shadow-fire', 1),
('shadow-rave', 1),
('shadow-storm', 1),
('shadow-wave', 1),
('shadow-down', 1),
('shadow-half', 1),
('shadow-hold', 1),
('shadow-mist', 1),
('shadow-panic', 1),
('shadow-shed', 1),
('shadow-sky', 1),
('bug', 2),
('dark', 2),
('dragon', 2),
('electric', 2),
('fairy', 2),
('fighting', 2),
('fire', 2),
('flying', 2),
('ghost', 2),
('grass', 2),
('ground', 2),
('ice', 2),
('normal', 2),
('poison', 2),
('psychic', 2),
('rock', 2),
('shadow', 2),
('steel', 2),
('unknown', 2),
('water', 2),
('Kanto', 3),
('Johto', 3),
('Hoenn', 3),
('Sinnoh', 3),
('Unova', 3),
('Kalos', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;