# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.6] - 2026-06-25

- Fix trials not ending properly when finishing the biome

## [1.0.5] - 2026-06-22

- Fix crash when unequipping Skull aspect before picking all skulls

## [1.0.4] - 2026-06-09

- Fix crash when other mods are not loaded afterwards

## [1.0.3] - 2026-06-07

- Fix weapon shop text not showing the upgrade statistics of the next rarity
- Fix rare crash caused when healing with staff aspect.

## [1.0.2] - 2026-06-05

- Fixed Posideon Axe special only activating once.
- Fixed bug where Aspect of Icarus disappears when the armor is gone
- Compat with WeaponFusion (by @Zerp on discord)
  

## [1.0.1] - 2026-06-04

- Fixed missing suit mesh on initialization.
- Fixed Posideon suit attack only activating once.

## [1.0.0] - 2026-06-04
- Added Suit Aspect of Young Melinoë
    - Replaces the attack and omega attack with tornados.
    - Trait grants starting armor
- Implemented dynamic texture swaps for the Staff/Dagger/Axe/Skull
- Updated Skull icon
- Added 7 minor prophecies
- Added 5 new hammer (10 total)
- Added 6 Chaos trials
- Added 6 conversations
- Added a set of Arcana backs
- Steps towards compat with Weapon-Fusion (By @Zerp on discord)

## [0.5.3] - 2026-05-20

- Added Combo UI
- Balance: increased Young mel skull ammo magnetism range

## [0.5.2] - 2026-05-16

- Fixed Special-Cast boons were too rare
- Fixed Special-Cast boons now work with sacrifice boons

## [0.5.1] - 2026-05-14

- Fixed boon graphic for 2nd hammer Special-cast
- Restrict omega-special hammer for torch with young mel

## [0.5.0] - 2026-05-13

- Added Torches Aspect of Young Melinoë
  - Replaces the special with a lobbed projectile which casts Special-Cast, an additional cast.
  - Replaces all special boons for the aspect to influence the Special-Cast.
  - Adds boons for secondary effects on Special-Cast
  - Trait increases damage from Olympian curses
- Added Skull hammer "UltimateCombo"
- DEV: merging WeaponProperty to WeaponProperties
- DEV: Changing overwrite requirement of existing hammers to table.insert

## [0.4.0] - 2026-05-08

- Added Skull Aspect of young Mel
  - Trait grants combo stacks upon attack hits
  - Combo is a stacking damage buff that is lost when not retrieving ammo
  - Reduced ammo magnetism and increased ammo drop spread.
- Fixed rank in different color in the shop
- Fixed icon sizes too small
- Temp fix, Added config option to choose whether to alter textures (set to false by default as they also impact base aspects)

## [0.3.3] - 2026-05-05

- Replacing Axe trait to +% attack damage after block
- Fixed hammer requierments 
- DEV: renaming new trick knives hammer

## [0.3.2] - 2026-05-04

- Fixed aspect icon not showing when loading or in run history
- DEV: Better compatibility with other aspect mods
- DEV: Added dependency on zerp-AspectExtender

## [0.3.1] - 2026-05-03

- Changed to Adding new Aspects instead of replacing
- Added Shop and Upgrade for new aspects

## [0.3.0] - 2026-05-02

- Replaces Dagger Aspect of Melinoe with Dagger Aspect of Young Melinoe.
  - changes Attack to a 2-hit combo that deals consistent damage
  - changes special to a non penetrating 1-way projectile that is deals more damage
  - changes omega special to a non-penetrating projectiles that deal more damage
  - Trait decreases Dash cooldown
- DEV: splitting ready.lua into modules
## [0.2.3] - 2026-04-29

- Added custom textures for Axe and Staff Aspects of Young Mel

## [0.2.2] - 2026-04-29

- Fixed Aspect icons disapearing during runs
- Replaced 'Siege Shredder' with 'Mirror Shield' Hammer for Axe Aspect of Young Mel

## [0.2.1] - 2026-04-27

 - fixed rare crash when returning from a brotherly dream. 

## [0.2.0] - 2026-04-27

 - Replaces Staff Aspect of Melinoe with Staff Aspect of Young Melinoe.
   -  changes special projectile to be weaker with lower cooldown, better homing and no      hit stun.
   - trait allows to absorb Omega special to recover health when health is below a threshold.
﻿
## [0.1.0] - 2026-04-25

- First version of the mod!

[unreleased]: https://github.com/Tal-lev/AspectYoungMel/compare/1.0.6...HEAD
[1.0.6]: https://github.com/Tal-lev/AspectYoungMel/compare/1.0.5...1.0.6
[1.0.5]: https://github.com/Tal-lev/AspectYoungMel/compare/1.0.4...1.0.5
[1.0.4]: https://github.com/Tal-lev/AspectYoungMel/compare/1.0.3...1.0.4
[1.0.3]: https://github.com/Tal-lev/AspectYoungMel/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/Tal-lev/AspectYoungMel/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/Tal-lev/AspectYoungMel/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/Tal-lev/AspectYoungMel/compare/0.5.3...1.0.0
[0.5.3]: https://github.com/Tal-lev/AspectYoungMel/compare/0.5.2...0.5.3
[0.5.2]: https://github.com/Tal-lev/AspectYoungMel/compare/0.5.1...0.5.2
[0.5.1]: https://github.com/Tal-lev/AspectYoungMel/compare/0.5.0...0.5.1
[0.5.0]: https://github.com/Tal-lev/AspectYoungMel/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/Tal-lev/AspectYoungMel/compare/0.3.3...0.4.0
[0.3.3]: https://github.com/Tal-lev/AspectYoungMel/compare/0.3.2...0.3.3
[0.3.2]: https://github.com/Tal-lev/AspectYoungMel/compare/0.3.1...0.3.2
[0.3.1]: https://github.com/Tal-lev/AspectYoungMel/compare/0.3.0...0.3.1
[0.3.0]: https://github.com/Tal-lev/AspectYoungMel/compare/0.2.3...0.3.0
[0.2.3]: https://github.com/Tal-lev/AspectYoungMel/compare/0.2.2...0.2.3
[0.2.2]: https://github.com/Tal-lev/AspectYoungMel/compare/0.2.1...0.2.2
[0.2.1]: https://github.com/Tal-lev/AspectYoungMel/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/Tal-lev/AspectYoungMel/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/Tal-lev/AspectYoungMel/compare/2a59f3eba279511760a4077aaa7e72010d51936c...0.1.0
