-- Generated by Level Director X v1.1.0 on mar ott 1 21:44:52 2019 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
	assets.spriteSheetData['Brick']={}
	assets.spriteSheetData['Brick'].frames ={
		{x=0,y=0,width=385,height=129},
		{x=385,y=0,width=385,height=129},
		{x=770,y=0,width=385,height=129},
		{x=1155,y=0,width=385,height=129},
		{x=1540,y=0,width=385,height=129},
		{x=0,y=129,width=385,height=129},
		{x=385,y=129,width=385,height=129},
		{x=770,y=129,width=385,height=129},
		{x=1155,y=129,width=385,height=129},
		{x=1540,y=129,width=385,height=129},
		{x=0,y=258,width=385,height=129},
		{x=385,y=258,width=385,height=129},
		{x=770,y=258,width=385,height=129},
		{x=1155,y=258,width=385,height=129},
		{x=1540,y=258,width=385,height=129},
		{x=0,y=387,width=385,height=129},
		{x=385,y=387,width=385,height=129},
		{x=770,y=387,width=385,height=129},
		{x=1155,y=387,width=385,height=129},
		{x=1540,y=387,width=385,height=129},
		{x=0,y=516,width=385,height=129},
		{x=385,y=516,width=385,height=129},
		{x=770,y=516,width=385,height=129},
		{x=1155,y=516,width=385,height=129},
		{x=1540,y=516,width=385,height=129},
		{x=0,y=645,width=385,height=129},
		{x=385,y=645,width=385,height=129},
		{x=770,y=645,width=385,height=129},
		{x=1155,y=645,width=385,height=129},
		{x=1540,y=645,width=385,height=129},
		{x=0,y=774,width=385,height=129},
		{x=385,y=774,width=385,height=129},
		{x=770,y=774,width=385,height=129},
		{x=1155,y=774,width=385,height=129},
		{x=1540,y=774,width=385,height=129},
		sheetContentWidth=2048,
		sheetContentHeight=1024
	}
	assets['Brick_2']={file ='Breakout_Tile_Free.png',name='Brick_2',class='',aX=0.5,aY=0.5,width=385,height=129,frame=3,spriteSheetName='Brick',frameCount=35,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={-193,-65,192,-65,192,64,-193,64,-193,-65},bounce=0.2,friction=0.3,density=1,radius=50,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['Brick_12']={file ='Breakout_Tile_Free.png',name='Brick_12',class='',aX=0.5,aY=0.5,width=385,height=129,frame=13,spriteSheetName='Brick',frameCount=35,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={-193,-65,192,-65,192,64,-193,64,-193,-65},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
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
	level.name='Level01'
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
	---- Layer 1 ------------------------------------------------------------------------------------
	level.layers['Layer 1']={}
	level.layers['Layer 1'].view=display.newGroup()
	level.layers['Layer 1'].name='Layer 1'
	if (level.parallaxEnabled) then
		level.layers['Layer 1'].speed={x=0,y=0}
		level.layers['Layer 1'].repeated=false
		level.layers['Layer 1'].cullingMethod=0
	else
		level.layers['Layer 1'].cullingMethod=0
	end
	level.layers['Layer 1'].objects={}
	objects = {
	{name='Brick_12',objType='LDImage',class='',width=29.8441,height=14.922,x=52,y=169,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_2',objType='LDImage',class='',width=29.8441,height=14.922,x=97,y=169,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_3',objType='LDImage',class='',width=29.8441,height=14.922,x=142,y=169,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_4',objType='LDImage',class='',width=29.8441,height=14.922,x=187,y=169,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_5',objType='LDImage',class='',width=29.8441,height=14.922,x=232,y=169,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_6',objType='LDImage',class='',width=29.8441,height=14.922,x=276,y=169,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_7',objType='LDImage',class='',width=29.8441,height=14.922,x=38,y=132,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		rotation=30,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='Brick_8',objType='LDImage',class='',width=29.8441,height=14.922,x=293,y=131,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		rotation=-30,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='Brick_9',objType='LDImage',class='',width=29.8441,height=14.922,x=164,y=214,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_10',objType='LDImage',class='',width=29.8441,height=14.922,x=209,y=214,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_11',objType='LDImage',class='',width=29.8441,height=14.922,x=75,y=214,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_13',objType='LDImage',class='',width=29.8441,height=14.922,x=120,y=214,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_14',objType='LDImage',class='',width=29.8441,height=14.922,x=254,y=214,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_15',objType='LDImage',class='',width=29.8441,height=14.922,x=276,y=259,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_16',objType='LDImage',class='',width=29.8441,height=14.922,x=187,y=259,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_17',objType='LDImage',class='',width=29.8441,height=14.922,x=232,y=259,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_18',objType='LDImage',class='',width=29.8441,height=14.922,x=97,y=259,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_19',objType='LDImage',class='',width=29.8441,height=14.922,x=142,y=259,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_20',objType='LDImage',class='',width=29.8441,height=14.922,x=52,y=259,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_21',objType='LDImage',class='',width=29.8441,height=14.922,x=286,y=303,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		rotation=330,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='Brick_22',objType='LDImage',class='',width=29.8441,height=14.922,x=47,y=303,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		rotation=30,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='Brick_23',objType='LDImage',class='',width=29.8441,height=14.922,x=47,y=340,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		rotation=30,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='Brick_25',objType='LDImage',class='',width=29.8441,height=14.922,x=286,y=340,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		rotation=330,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='Brick_24',objType='LDImage',class='',width=29.8441,height=14.922,x=127,y=326,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_26',objType='LDImage',class='',width=29.8441,height=14.922,x=164,y=326,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_27',objType='LDImage',class='',width=29.8441,height=14.922,x=90,y=326,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_28',objType='LDImage',class='',width=29.8441,height=14.922,x=202,y=326,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_1',objType='LDImage',class='',width=29.8441,height=14.922,x=239,y=326,xScale=0.0775171*1,yScale=0.115674*1,assetName='Brick_12',
		userProps = {},
		},
	{name='Brick_29',objType='LDImage',class='',width=126.837,height=14.922,x=50,y=120,xScale=0.329447*1,yScale=0.115674*1,assetName='Brick_2',
		userProps = {{name= 'tipo', value='speciale' },},
		},
	}
	-- add objects to layer
	for k, objProps in pairs (objects) do
		obj = instance:createObject(level.layers['Layer 1'], objProps ,level.assets)
		if (obj and objProps.userProps) then
			obj.property = {}
			for u, userProp in pairs (objProps.userProps) do
				obj.property[userProp.name] = userProp.value
			end
		end
	end
	instance:insertLayer(level,level.layers['Layer 1'])
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
