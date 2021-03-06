-- Generated by Level Director X v1.1.0 on sab gen 11 01:38:06 2020 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
	assets['ui glass_0']={file ='ui glass.png',name='ui glass_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=0,spriteSheetName='ui glass',frameCount=1,
		 }
	assets['ball_0']={file ='default ball.png',name='ball_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=0,spriteSheetName='ball',frameCount=1,
		physics={isEnabled=true,source='Asset',bodyType='kinematic',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Round',shape={},bounce=0.2,friction=0.3,density=1,radius=100,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['static part ui_0']={file ='static part ui.png',name='static part ui_0',class='',aX=0.5,aY=0.5,width=640,height=960,frame=0,spriteSheetName='static part ui',frameCount=1,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={-320,-480,320,-480,321,-388,-317,-389},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['led spento_0']={file ='led spento.png',name='led spento_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=0,spriteSheetName='led spento',frameCount=1,
		 }
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
	level.name='ui' 
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
	---- ui_layer ------------------------------------------------------------------------------------
	level.layers['ui_layer']={} 
	level.layers['ui_layer'].view=display.newGroup() 
	level.layers['ui_layer'].name='ui_layer' 
	if (level.parallaxEnabled) then
		level.layers['ui_layer'].speed={x=0,y=0}
		level.layers['ui_layer'].repeated=false
		level.layers['ui_layer'].cullingMethod=0
	else
		level.layers['ui_layer'].cullingMethod=0 
	end
	level.layers['ui_layer'].objects={} 
	objects = {
	{name='static part ui_0',objType='LDImage',class='',width=320,height=480,x=160,y=240,xScale=0.5*1,yScale=0.5*1,assetName='static part ui_0',
		userProps = {},
		},
	{name='ball_0',objType='LDImage',class='',width=13,height=13,x=228,y=29,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_1',objType='LDImage',class='',width=13,height=13,x=241,y=29,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_3',objType='LDImage',class='',width=13,height=13,x=267,y=29,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_2',objType='LDImage',class='',width=13,height=13,x=254,y=29,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_8',objType='LDImage',class='',width=13,height=13,x=254,y=16,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_7',objType='LDImage',class='',width=13,height=13,x=241,y=16,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_6',objType='LDImage',class='',width=13,height=13,x=228,y=16,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_9',objType='LDImage',class='',width=13,height=13,x=267,y=16,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_4',objType='LDImage',class='',width=13,height=13,x=280,y=29,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_5',objType='LDImage',class='',width=13,height=13,x=293,y=29,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ball_10',objType='LDImage',class='',width=13,height=13,x=280,y=16,xScale=0.065*1,yScale=0.065*1,assetName='ball_0',
		userProps = {},
		},
	{name='ui glass_0',objType='LDImage',class='',width=200,height=200,x=270,y=20,xScale=1*1,yScale=1*1,assetName='ui glass_0',
		userProps = {},
		},
	{name='led spento_0',objType='LDImage',class='',width=28,height=28,x=97,y=26,xScale=0.14*1,yScale=0.14*1,assetName='led spento_0',
		userProps = {},
		},
	{name='rect_31',objType='LDRectangle',class='',width=30.7613,height=9.27362,x=13,y=424,xScale=1*1,yScale=1*1,assetName='',
		rotation=3,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		styleProps={radius=15.3806,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=0/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=999,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0,friction=99,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	{name='rect_28',objType='LDRectangle',class='',width=31.6232,height=12.5139,x=303,y=425,xScale=1*1,yScale=1*1,assetName='',
		rotation=358,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		styleProps={radius=15.8116,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=0/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=999,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0,friction=99,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	{name='rect_30',objType='LDRectangle',class='',width=108.641,height=12.8653,x=77,y=449,xScale=1*1,yScale=1*1,assetName='',
		rotation=-339,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		styleProps={radius=54.3205,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=0/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=1,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0,friction=99,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	{name='rect_33',objType='LDRectangle',class='',width=108.641,height=12.8653,x=236,y=452,xScale=1*1,yScale=1*1,assetName='',
		rotation=-21,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		styleProps={radius=54.3205,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=0/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=1,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0,friction=99,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	{name='rect_29',objType='LDRectangle',class='',width=108.641,height=12.8653,x=121,y=464,xScale=1*1,yScale=1*1,assetName='',
		rotation=6,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		styleProps={radius=54.3205,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=0/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=1,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0,friction=99,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	{name='rect_34',objType='LDRectangle',class='',width=108.641,height=12.8653,x=199,y=464,xScale=1*1,yScale=1*1,assetName='',
		rotation=-8,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		styleProps={radius=54.3205,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=0/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=1,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0,friction=99,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	{name='rect_21',objType='LDRectangle',class='',width=108.641,height=12.8653,x=164,y=467,xScale=1*1,yScale=1*1,assetName='',
		styleProps={radius=54.3205,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=0/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=1,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0,friction=99,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	}
	-- add objects to layer
	for k, objProps in pairs (objects) do
		obj = instance:createObject(level.layers['ui_layer'], objProps ,level.assets)
		if (obj and objProps.userProps) then
			obj.property = {}
			for u, userProp in pairs (objProps.userProps) do
				obj.property[userProp.name] = userProp.value 
			end 
		end 
	end
	instance:insertLayer(level,level.layers['ui_layer'])
	---- invisible_layer ------------------------------------------------------------------------------------
	level.layers['invisible_layer']={} 
	level.layers['invisible_layer'].view=display.newGroup() 
	level.layers['invisible_layer'].name='invisible_layer' 
	if (level.parallaxEnabled) then
		level.layers['invisible_layer'].speed={x=0,y=0}
		level.layers['invisible_layer'].repeated=false
		level.layers['invisible_layer'].cullingMethod=0
	else
		level.layers['invisible_layer'].cullingMethod=0 
	end
	level.layers['invisible_layer'].objects={} 
	objects = {
	{name='buttonPausa',objType='LDEllipse',class='',width=43.1667,height=42.3333,x=24,y=446,xScale=1*1,yScale=1*1,assetName='',
		styleProps={radius=21.5833,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=1/255,fillColorR=255/255,fillColorG=255/255,fillColorB=255/255,fillColorA=1/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=255/255,fillColorG=255/255,fillColorB=255/255,fillColorA=1/255},
		userProps = {},
		},
	{name='buttonStats',objType='LDEllipse',class='',width=43.1667,height=42.3333,x=294,y=447,xScale=1*1,yScale=1*1,assetName='',
		styleProps={radius=21.5833,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=1/255,fillColorR=255/255,fillColorG=255/255,fillColorB=255/255,fillColorA=1/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=255/255,fillColorG=255/255,fillColorB=255/255,fillColorA=1/255},
		userProps = {},
		},
	{name='rect_balls',objType='LDRectangle',class='',width=99.3333,height=3.33333,x=269,y=40,xScale=1*1,yScale=1*1,assetName='',
		styleProps={radius=49.6666,cornerRadius=0,strokeWidth=1,strokeColorR=255/255,strokeColorG=255/255,strokeColorB=255/255,strokeColorA=1/255,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		fillProps ={fillType=0,fillAssetName='',fillFrame=0},
		gradientProps={direction=0,fillColorR=0/255,fillColorG=0/255,fillColorB=0/255,fillColorA=0/255},
		userProps = {},
		physics={isEnabled=true,source='Object',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,isBullet=false,linearDamping=0,angularDamping=0,gravityScale=1,
		shapes={{bodyShape='Rectangle',shape={ },bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0 },}}
		},
	}
	-- add objects to layer
	for k, objProps in pairs (objects) do
		obj = instance:createObject(level.layers['invisible_layer'], objProps ,level.assets)
		if (obj and objProps.userProps) then
			obj.property = {}
			for u, userProp in pairs (objProps.userProps) do
				obj.property[userProp.name] = userProp.value 
			end 
		end 
	end
	instance:insertLayer(level,level.layers['invisible_layer'])
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

