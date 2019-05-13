//
//  PlantManager.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/30/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation

class PlantManager{

    let plantArray = [
        Plant(plantID: 1, name: "Douglas Fir", latinName: "Pseudotsuga menziesii", desc: "Douglas-fir wood and bark was thought by most of the coastal groups to be an excellent fuel, but it had the reputation of throwing sparks and giving splinters to those handling it. The wood was also used to make items such as spear handles, harpoon shafts, spoons, dip-net poles, harpoon barbs, fire tongs, salmon weirs, caskets and halibut and cod hooks. START HERE --- Douglas-fir wood and bark was thought by most of the coastal groups to be an excellent fuel, but it had the reputation of throwing sparks and giving splinters to those handling it. The wood was also used to make items such as spear handles, harpoon shafts, spoons, dip-net poles, harpoon barbs, fire tongs, salmon weirs, caskets and halibut and cod hooks. Douglas-fir wood and bark was thought by most of the coastal groups to be an excellent fuel, but it had the reputation of throwing sparks and giving splinters to those handling it. The wood was also used to make items such as spear handles, harpoon shafts, spoons, dip-net poles, harpoon barbs, fire tongs, salmon weirs, caskets and halibut and cod hooks. Douglas-fir wood and bark was thought by most of the coastal groups to be an excellent fuel, but it had the reputation of throwing sparks and giving splinters to those handling it. The wood was also used to make items such as spear handles, harpoon shafts, spoons, dip-net poles, harpoon barbs, fire tongs, salmon weirs, caskets and halibut and cod hooks. Douglas-fir wood and bark was thought by most of the coastal groups to be an excellent fuel, but it had the reputation of throwing sparks and giving splinters to those handling it. The wood was also used to make items such as spear handles, harpoon shafts, spoons, dip-net poles, harpoon barbs, fire tongs, salmon weirs, caskets and halibut and cod hooks. --- END HERE"),
        Plant(plantID: 2, name: "Black Twinberry", latinName: "Lonicera involucrata", desc: "The shiny, black, bitter, twinned berries are not considered edible by most people. They were given names like 'raven's food,' 'crow berry,' and 'monster's food' by northwest coast peoples. There were some taboos against eating them. For example, the Kwakwaka'wakw: believed that eating the berries would cause one to become unable to speak."),
        Plant(plantID: 3, name: "Red-oiser Dogwood", latinName: "Cornus sericea", desc: "Although red-osier-dogwood berries are very bitter and contain a large central seed, they were eaten by interior aboriginal peoples, but not by coastal peoples. The bark was dried and used in smoking mixtures by aboriginal peoples to the East, but not on the Northwest Coast. The branches were sometimes used for salmon spreaders and basket rims."),
        Plant(plantID: 4, name: "Thimbleberry", latinName: "Rubus parviflorus", desc: "Thimbleberries were eaten by all Northwest Coast people. The Nuu-chah-nulth were known to collect shoots in bulk. Young shoots were eaten raw. The berries are coarse and seedy, lending themselves to drying. The Nuu-chah-nulth dried the berries with smoked clams."),
        Plant(plantID: 5, name: "Sitka Spruce", latinName: "Picea sitchensis", desc: "The sharp needles of spruce were believed to give it species paowers for protection against evil thoughts. The Ditidaht and other Nuu-chah-nulth peoples used the boughs in winter dance ceremonies to protect the dancers and to 'scare' spectators. Among the Haida, Tlingit, Tsimshian and other central and northern coastal peoples, the inner bark was eaten fresh or dried into cakes and eaten with berries. The Makah were said to eat the young shoots raw; these would have been an excellent source of vitamin C."),
        Plant(plantID: 6, name: "Slough Sedge", latinName: "Carex obnupta", desc: "Slough sedge is still a popular basket material for the Nuu-chah-nulth and the Makah. The inner leaves are split and flattened before being dried. Fine baskets are made from this sedge, often with the cedar foundations and intricate designs from dyed strands of grass or coloured barks."),
        Plant(plantID: 7, name: "Clustered Rose", latinName: "Rosa pisocarpa", desc: "Branches of all species of wild rose - along with skunk cabbage leaves, fern fronds, pine needles, or salal - were sometimes put in steaming pits, cooking baskets and root-storage pits. Cedar-root cooking baskets used for boiling foods often had rose leaves placed under and over food to flavour it and protect it from burning."),
        Plant(plantID: 8, name: "Western Redcedar", latinName: "Thuja plicata", desc: "Redcedar has been called 'the cornerstone of northwest coast Indian culture' and the large-scale use of its wood and bark delineates the cultural boundary of the northwest coast people within its range. The easily split, rot-resistant wood was used to make important cultural items such as dugout canoes, house planks and posts, totem and mortuary poles, bentwood boxes, baskets, clothing and hats, and a variety of tools and implements such as dishes, arrow shafts, harpoon shafts, spear poles, barbecue sticks, fish spreaders and hangers, dip=net hooks, fish clubs, masks, rattles, benches, cradles, coffins, herring rakes, canoe bailers, ceremonial drum logs, cobs, fishing floats, berry-drying racks, fish weirs, spirit whistles, and paddles."),
        Plant(plantID: 9, name: "Red Flowering Currant", latinName: "Ribes sanguineum", desc: "The berries are edible but insipid. they were eaten by various Coast Salish groups such as the Saanich, Cowichan, Squamish, and Sechelt, but they were not highly regarded. They were eaten fresh but not usually collected for drying. This shrub was introduced to European horticulture by plant-hunter David Douglas. The name sanguineum means 'blood-red' or 'bloody' - rather violent epithets to apply to the beautiful reddish-pink flower, which are harbingers of spring and hummingbirds."),
        Plant(plantID: 10, name: "Small-fruited Bulrush", latinName: "Scirpus microcarpus", desc: "Small-flowered bulrush was apparently used to weave light-duty baskets and as an ornamental trim in hide clothing. The leaves were sometimes laid over and under food in steaming pits"),
        Plant(plantID: 11, name: "Low Oregon Grape", latinName: "Berberis nervosa", desc: "The tart, purple berries of both Oregon-grapes were eaten, but generally not in quantity. Often they were mixed with salal or some other sweeter fruit. Today they are used for jelly, and some people make wine from them. An excellent jelly can be made using two cups Oregon-grape juice, two cups salal juice, five cups sugar and one box pectin crystals."),
        Plant(plantID: 12, name: "Tall Oregon Grape", latinName: "Berberis aquifolium", desc: "The tart, purple berries of both Oregon-grapes were eaten, but generally not in quantity. Often they were mixed with salal or some other sweeter fruit. Today they are used for jelly, and some people make wine from them. An excellent jelly can be made using two cups Oregon-grape juice, two cups salal juice, five cups sugar and one box pectin crystals"),
        Plant(plantID: 13, name: "Pacific Ninebark", latinName: "Physocarpus capitatus", desc: "The Nuu-chah-nulth made children's bows and other small items from the wood, and the Cowichan recently have made knitting needles from it. The Nuxalk considered this shrub highly poisonous and, along with the Coast Salish and Kwakwaka'wakw, used a tea made from a stick with the outer bark peeled off as an emetic or purgative. These three groups also used a medicine from ninebark as a laxative. The Nuxalk used medicinal preparations from ninebark for gonorrhea and scrofulous sores on the neck."),
        Plant(plantID: 14, name: "Cascara", latinName: "Frangula purshiana", desc: "The bark was boiled and the tea (or syrup) was drunk as a strong laxative by the Nuxalk, Coast Salish, Quileute, Nuu-chah-nulth, Kwakwaka'wakw and other groups. Cascara has been scientifically substantiated as an effective laxative. The hydroxymethylanthraquinones it contains cause peristalsis of the large intestine, with little or no effect on the small intestine at low dosages."),
        Plant(plantID: 15, name: "Mock Orange", latinName: "Philadelphus lewisii", desc: "The wood is strong and hard; it never cracks or warps when properly prepared. It is most widely used for making implements among the Interior Salish. On the coast, the Saanich used the wood for bows and arrows, and the Lummi of Washington made combs, netting shuttles and, recently, knitting needles. The Cowlitz also used the wood for combs, and the Skagit made arrow shafts."),
        Plant(plantID: 16, name: "Pacific Willow", latinName: "Salix lasiandra", desc: "The Straits Salish and the Halq'emeylem peeled the bark of [native willow species] in May or June, removed the outer part, split the inner tissue into thin strands, and twisted these into long ropes. This rope was used to make fishing lines and various types of nets, including gill-nets, reef-nets, purse-nets, bag-nets, and duck-nets."),
        Plant(plantID: 17, name: "Black Cottonwood", latinName: "Populus trichocarpa", desc: "The sweet inner bark and cambium tissues were eaten in late spring and early summer immediately after they were harvested so they would not ferment. Hesquiat/Nuu-chah-nulth/Ditidaht: The buds were picked in the spring and boiled in deer fat to make a fragrant salve, which was molded in the bulbous float of bull kelp. Nuxalk: the gum from the buds was used in preparations for baldness, sore throats, whooping cough and tuberculosis...the old, rotten leaves were boiled and used in a bath for body pains, rheumatism and stomach trouble. "),
        Plant(plantID: 18, name: "Paper Birch", latinName: "Betula papyrifera", desc: "Paper birch was used much more commonly by interior groups. The bark, which can be peeled off the tree in large, flexible, waterproof sheets, was as important to the native peoples inland from the Northwest Coast as the western redcedar was to the coastal peoples. Baskets and canoes were the most common items constructed from paper birch. The wood was also used as duel, and the sap and inner bark as emergency food."),
        Plant(plantID: 19, name: "Grand Fir", latinName: "Abies grandis", desc: "Kwakwaka'wakw shamans wove its branches into headdresses and costumes and used the branches for scrubbing individuals in purification rites. The Hesquiat used its branches as incense and decorative clothing for wolf dancers."),
        Plant(plantID: 20, name: "Red Alder", latinName: "Alnus rubra", desc: "Red alder wood is considered to be the best possible fuel for smoking salmon and other types of fish. It is soft and even-grained, and is still used for making feast bowls, masks, rattles, and a variety of other items."),
        Plant(plantID: 21, name: "Red Elderberry", latinName: "Sambucus racemosa", desc: "Red elderberries, though small and seedy, were a highly important food for the peoples of the central and northern coast, although few people sill use them today. They should always be cooked, since the raw berries may cause nausea. They were sometimes boiled to make a sauce or cooked with the stems intact."),
    ]
    
    
    //Helper Functions to retreive Plant object by Name
    func getPlantByName(name: String) -> Plant{
        
        for n in plantArray{
            if(n.name == name){
                return n
            }
        }
        
        //Plant was not found, return default plant
        return Plant(plantID: -1, name: "plant not found", latinName: "plant not found", desc: "plant not found")
    }
    
    //Retrieve Plant object by ID -- Not sure this will be useful, consider removing.
    func getPlantByID(id: Int) -> Plant{
        for n in plantArray{
            if(n.plantID == id){
                return n
            }
        }
        
        //Plant was not found, return default plant
        return Plant(plantID: -1, name: "plant not found, latinName:", latinName: "plant not found", desc: "plant not found")
    }
    
    //Return plantArray
    func getPlantList() -> [Plant]{
        return plantArray
    }
}
