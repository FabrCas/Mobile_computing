-- Generated by Level Director X v1.1.0 on dom dic 8 12:16:16 2019 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
	assets.spriteSheetData['cannon_fire']={}
	assets.spriteSheetData['cannon_fire'].frames ={
		{x=0,y=0,width=320,height=480},
		{x=320,y=0,width=320,height=480},
		{x=640,y=0,width=320,height=480},
		{x=960,y=0,width=320,height=480},
		{x=1280,y=0,width=320,height=480},
		{x=1600,y=0,width=320,height=480},
		{x=1920,y=0,width=320,height=480},
		{x=0,y=480,width=320,height=480},
		{x=320,y=480,width=320,height=480},
		{x=640,y=480,width=320,height=480},
		{x=960,y=480,width=320,height=480},
		{x=1280,y=480,width=320,height=480},
		{x=1600,y=480,width=320,height=480},
		{x=1920,y=480,width=320,height=480},
		sheetContentWidth=2240,
		sheetContentHeight=960
	}
	assets['cannon_fire_0']={file ='cannon_fire.png',name='cannon_fire_0',class='',aX=0.5,aY=0.5,width=320,height=480,frame=1,spriteSheetName='cannon_fire',frameCount=14,
		sequenceData={{name='sequence 1',frames={ 1,2,3,4,5,6,7,8,9,10,11,12,13,14 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='sequence 1',play=false },
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={24,-237,66,-227,107,-199,152,-124,155,-50,130,8,66,62,-26,76,-95,43,-143,-23,-152,-92,-134,-171,-76,-222,-36,-235},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},{bodyShape='Polygon',shape={-65,98,-46,70,48,66,64,100,39,223,9,233,-33,225,-44,192},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	return assets
end -- loadAssets 

------------------------------------------
function M:createLevel(LD_Helper_Instance)
------------------------------------------
	local instance=LD_Helper_Instance
	local objProps={}
	local level={}
    local obj=nil
	local k=0
	local objects = nil 
	if (instance.viewGroup == nil) then
		level.view=display.newGroup() 
	else
		level.view=instance.viewGroup
	end
	level.view.anchorChildren =false 
	display.setDefault( 'background',102/255,102/255,102/255,255/255)
	display.setDefault( "anchorX",0.5 )
	display.setDefault( "anchorY",0.5 )	
	display.setDrawMode("wireframe",false)
	level.name='shoot' 
	-- Load Assets
	level.assets=self:loadAssets()
	-- Physics properties
	physics.setGravity(0,9.8) 
	physics.setDrawMode('normal')
	physics.setPositionIterations(8)	
	physics.setVelocityIterations(3)	
	level.parallaxEnabled=false
	-- Layers --
	level.layers={} 
	---- LayerCannone ------------------------------------------------------------------------------------
	level.layers['LayerCannone']={} 
	level.layers['LayerCannone'].view=display.newGroup() 
	level.layers['LayerCannone'].name='LayerCannone' 
	if (level.parallaxEnabled) then
		level.layers['LayerCannone'].speed={x=0,y=0}
		level.layers['LayerCannone'].repeated=false
		level.layers['LayerCannone'].cullingMethod=0
	else
		level.layers['LayerCannone'].cullingMethod=0 
	end
	level.layers['LayerCannone'].objects={} 
	objects = {
	{name='cannon_fire_0',objType='LDImage',class='',width=92,height=136,x=158,y=163,xScale=0.2875*1,yScale=0.283333*1,assetName='cannon_fire_0',
		userProps = {},
		},
	}
	-- add objects to layer
	for k, objProps in pairs (objects) do
		obj = instance:createObject(level.layers['LayerCannone'], objProps ,level.assets)
		if (obj and objProps.userProps) then
			obj.property = {}
			for u, userProp in pairs (objProps.userProps) do
				obj.property[userProp.name] = userProp.value 
			end 
		end 
	end
	instance:insertLayer(level,level.layers['LayerCannone'])
	--level.ldVersion=1.1.0	-- Level Director Version
	-- Parallax (after layers)
	level.canvasWidth=320
	level.canvasHeight=480
	if level.parallaxEnabled then
		level.parallaxInfinite=false
		level.parallaxDamping=1
		instance:createParallax(level)
	end
	return level
end -- createLevel
return M

