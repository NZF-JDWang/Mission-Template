if (!hasInterface) exitWith {};
waitUntil {!isNull player};

/*
modifiers, links, and font options
<marker name='marker_name'>text with link</marker>
<img image='Image file name jpeg or paa' />
<font color='#FF0000' size='14' face='vbs2_digital'>Text you want in this font</font>
<br><br/> New Line

http://www.w3schools.com/colors/colors_picker.asp

https://community.bistudio.com/wikidata/images/archive/0/0e/20140217182059%21Arma3Fonts.png
*/
player createDiaryRecord ["Diary",["Authors Notes","Are you better to take explosives to disable the SAM sites and save your AT for any potential armour you come across? Or should use it to hit the SAM's from distance? Is it worth hauling a TOW launcher around to deal with those T-80's?<br><br/><br><br/>You have Darter drone packs available which may help with scouting but it could also very easily give your presence away.<br><br/><br><br/>Stay spread out and cover each other. I mean it when I say you will be outnumbered. Think about how and where to attack from. Having some plan is infinitely better than no plan at all, and remember when contacted the longer you stay in one spot the more accurate the incoming fire will be. Shoot and move!"]];

player createDiaryRecord ["Diary",["Medical System","For these missions we are using the ACE basic medical system. 2 Bandages will stop any bleeding, Morphine to take care of the pain and Epi to wake someone up.<br><br/><br><br/>*NOTE* - Epi pens can only be administered by medics"]];

player createDiaryRecord ["Diary",["Enemy Forces","Expect to see both Russian VDV airborne troops as well as recon teams and armour in the area. Make no mistake, you will be surrounded and vastly outnumbered.<br><br/><br><br/><img image='images\t80.jpg'/><br><br/><br><br/>Intel suggested more than 1 x T-80 tanks in the area, and possible ZSU-23 AAA tanks supporting the SAMs. Russian Mi-8 and Mi-24 Hind Helicopters have been seen in the area as well.<br><br/><br><br/>Multiple Russian patrols have been seen entering and exiting the woods throughout the area, and along the roads, so keep your eyes open and expect enemy contact from the moment you set foot outside the safehouse.<br><br/><br><br/>Staying off the roads may be the best option."]];

player createDiaryRecord ["Diary",["Mission","<font color='#ff9900' size='22' face='PuristaSemiBold'>OPERATION LONG TREK</font><br><br/><br><br/><img image='images\sam.jpg' /><br><br/><br><br/>Russian forces have set up 3 SAM sites in the region of Bystica. These SAM sites are preventing the airforce from flying through the region. We need to open a corridor for the flyboys so they can support our troops on the ground in Chenarus.<br><br/><br><br/>We have designated these SAMs as Objective <marker name='marker_15'>Nichole</marker>, Objective <marker name='marker_16'>Julia</marker>, and Objective <marker name='marker_17'>Chelsea</marker>. You are to destroy these sites by any means necessary. We don't need to remind you how many soldiers will die if we don't get these SAM sites neutralized.<br><br/><br><br/>Once you have completed the objectives, you are to make your way across the river and down to a <marker name='marker_21'>safe house</marker> in the south. There you will find a satellite phone where you can call for extract."]];