# YAML lists and dictionaries

YAML lists and dictionaries are full of [Midi-chlorians](https://starwars.fandom.com/wiki/Midi-chlorian). Very powerful.

## YAML Lists 

A list of Jedi Masters:

```YAML
jedimasters:
    - Yoda
    - Obi-Wan Kenobi
    - Mace Windu
    - Qui-Gon Jinn
```
## YAML Dictionaries

Dictionaries can contain lists.

Information about a starship:

```YAML
starship:
    name: Millennium Falcon
    model: YT-1300 light freighter
    captain: Han Solo
    weapons: 
    - laser cannons
    - concussion missiles
```


## Dictionaries with Sub-items (Nested Dictionaries)

Think of these as dictionaries within dictionaries. They allow you to organize more complex information in a structured way.

Information about Darth Vader:

```yaml
darth_vader:
  name: Anakin Skywalker
  sith_name: Darth Vader
  affiliation: Galactic Empire
  powers:               
    force_choke: True
    lightsaber_combat: master
    telekinetic_push: True
  known_apprentices:    # Sub-list
    - Ahsoka Tano (former)
    - Galen Marek (Starkiller)
  lightsaber:           # Sub-dictionary
    color: red
    type: dual-phase
    hilt_material: durasteel
```


known_apprentices sub-list, listing some of Darth Vader's notable apprentices.
lightsaber sub-dictionary, providing details about his iconic weapon.

### Key Points about Dictionaries with Sub-items

Organization: They provide a way to group related data together, improving readability and structure.
Flexibility: You can nest dictionaries to any depth, creating complex hierarchies if needed.
Access: Sub-items are accessed using their key within the parent dictionary. For example, to get Darth Vader's lightsaber combat skill, you'd use darth_vader['powers']['lightsaber_combat'].
