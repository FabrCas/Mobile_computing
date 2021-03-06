-- Generated by Level Director X v1.1.0 on mer feb 19 01:45:50 2020 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
	assets.spriteSheetData['B03']={}
	assets.spriteSheetData['B03'].frames ={
		{x=0,y=0,width=64,height=32},
		{x=64,y=0,width=64,height=32},
		{x=128,y=0,width=64,height=32},
		{x=192,y=0,width=64,height=32},
		{x=256,y=0,width=64,height=32},
		{x=0,y=32,width=64,height=32},
		{x=64,y=32,width=64,height=32},
		{x=128,y=32,width=64,height=32},
		{x=192,y=32,width=64,height=32},
		{x=256,y=32,width=64,height=32},
		{x=0,y=64,width=64,height=32},
		{x=64,y=64,width=64,height=32},
		{x=128,y=64,width=64,height=32},
		{x=192,y=64,width=64,height=32},
		{x=256,y=64,width=64,height=32},
		{x=0,y=96,width=64,height=32},
		{x=64,y=96,width=64,height=32},
		{x=128,y=96,width=64,height=32},
		{x=192,y=96,width=64,height=32},
		{x=256,y=96,width=64,height=32},
		{x=0,y=128,width=64,height=32},
		{x=64,y=128,width=64,height=32},
		{x=128,y=128,width=64,height=32},
		{x=192,y=128,width=64,height=32},
		{x=256,y=128,width=64,height=32},
		sheetContentWidth=320,
		sheetContentHeight=160
	}
	assets.spriteSheetData['B11Speciale']={}
	assets.spriteSheetData['B11Speciale'].frames ={
		{x=0,y=0,width=64,height=32},
		{x=64,y=0,width=64,height=32},
		{x=128,y=0,width=64,height=32},
		{x=192,y=0,width=64,height=32},
		{x=256,y=0,width=64,height=32},
		{x=0,y=32,width=64,height=32},
		{x=64,y=32,width=64,height=32},
		{x=128,y=32,width=64,height=32},
		{x=192,y=32,width=64,height=32},
		{x=256,y=32,width=64,height=32},
		{x=0,y=64,width=64,height=32},
		{x=64,y=64,width=64,height=32},
		{x=128,y=64,width=64,height=32},
		{x=192,y=64,width=64,height=32},
		{x=256,y=64,width=64,height=32},
		{x=0,y=96,width=64,height=32},
		{x=64,y=96,width=64,height=32},
		{x=128,y=96,width=64,height=32},
		{x=192,y=96,width=64,height=32},
		{x=256,y=96,width=64,height=32},
		{x=0,y=128,width=64,height=32},
		{x=64,y=128,width=64,height=32},
		{x=128,y=128,width=64,height=32},
		{x=192,y=128,width=64,height=32},
		{x=256,y=128,width=64,height=32},
		sheetContentWidth=320,
		sheetContentHeight=160
	}
	assets.spriteSheetData['B04']={}
	assets.spriteSheetData['B04'].frames ={
		{x=0,y=0,width=64,height=32},
		{x=64,y=0,width=64,height=32},
		{x=128,y=0,width=64,height=32},
		{x=192,y=0,width=64,height=32},
		{x=256,y=0,width=64,height=32},
		{x=0,y=32,width=64,height=32},
		{x=64,y=32,width=64,height=32},
		{x=128,y=32,width=64,height=32},
		{x=192,y=32,width=64,height=32},
		{x=256,y=32,width=64,height=32},
		{x=0,y=64,width=64,height=32},
		{x=64,y=64,width=64,height=32},
		{x=128,y=64,width=64,height=32},
		{x=192,y=64,width=64,height=32},
		{x=256,y=64,width=64,height=32},
		{x=0,y=96,width=64,height=32},
		{x=64,y=96,width=64,height=32},
		{x=128,y=96,width=64,height=32},
		{x=192,y=96,width=64,height=32},
		{x=256,y=96,width=64,height=32},
		{x=0,y=128,width=64,height=32},
		{x=64,y=128,width=64,height=32},
		{x=128,y=128,width=64,height=32},
		{x=192,y=128,width=64,height=32},
		{x=256,y=128,width=64,height=32},
		sheetContentWidth=320,
		sheetContentHeight=160
	}
	assets['spazio26_0']={file ='spazio26.jpg',name='spazio26_0',class='',aX=0.5,aY=0.5,width=540,height=960,frame=0,spriteSheetName='spazio26',frameCount=1,
		 }
	assets['B03_7']={file ='B03.png',name='B03_7',class='',aX=0.5,aY=0.5,width=64,height=32,frame=8,spriteSheetName='B03',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={32,-16,32,16,-32,16,-32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B03_17']={file ='B03.png',name='B03_17',class='',aX=0.5,aY=0.5,width=64,height=32,frame=18,spriteSheetName='B03',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={32,-16,32,16,-32,16,-32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B11Speciale_0']={file ='B11Speciale.png',name='B11Speciale_0',class='',aX=0.5,aY=0.5,width=64,height=32,frame=1,spriteSheetName='B11Speciale',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={32,-16,32,16,-32,16,-32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B04']={file ='B03.png',name='B04',class='',aX=0.5,aY=0.5,width=64,height=32,frame=8,spriteSheetName='B04',frameCount=25,
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
	level.name='Level26' 
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
	{name='spazio26_0',objType='LDImage',class='',width=320,height=480,x=160,y=240,xScale=0.592593*1,yScale=0.5*1,assetName='spazio26_0',
		userProps = {},
		},
	{name='B03_17',objType='LDImage',class='',width=32,height=16,x=96,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere1' },},
		},
	{name='B03_4',objType='LDImage',class='',width=32,height=16,x=102,y=155,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=-330,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_5',objType='LDImage',class='',width=32,height=16,x=31,y=156,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=-30,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_16',objType='LDImage',class='',width=32,height=16,x=275,y=88,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=86,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_18',objType='LDImage',class='',width=32,height=16,x=269,y=124,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=116,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_19',objType='LDImage',class='',width=32,height=16,x=246,y=152,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=-214,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_20',objType='LDImage',class='',width=32,height=16,x=309,y=129,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=100,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_21',objType='LDImage',class='',width=32,height=16,x=299,y=164,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=115,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_3',objType='LDImage',class='',width=32,height=16,x=272,y=191,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		rotation=-213,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='B03_23',objType='LDImage',class='',width=32,height=16,x=96,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere1' },},
		},
	{name='B03_24',objType='LDImage',class='',width=32,height=16,x=96,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere1' },},
		},
	{name='B03_25',objType='LDImage',class='',width=32,height=16,x=32,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_26',objType='LDImage',class='',width=32,height=16,x=32,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_27',objType='LDImage',class='',width=32,height=16,x=32,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_28',objType='LDImage',class='',width=32,height=16,x=224,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere1' },},
		},
	{name='B03_29',objType='LDImage',class='',width=32,height=16,x=224,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere1' },},
		},
	{name='B03_30',objType='LDImage',class='',width=32,height=16,x=224,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere1' },},
		},
	{name='B03_31',objType='LDImage',class='',width=32,height=16,x=160,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_32',objType='LDImage',class='',width=32,height=16,x=160,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_33',objType='LDImage',class='',width=32,height=16,x=160,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_34',objType='LDImage',class='',width=32,height=16,x=288,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_35',objType='LDImage',class='',width=32,height=16,x=288,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_22',objType='LDImage',class='',width=32,height=16,x=288,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B03_17',
		userProps = {{name= 'movimento', value='muovere2' },},
		},
	{name='B03_1',objType='LDImage',class='',width=32,height=16,x=96,y=328,xScale=0.5*1,yScale=0.5*1,assetName='B11Speciale_0',
		userProps = {{name= 'movimento', value='muovere1' },{name= 'tipo', value='speciale' },},
		},
	{name='B03_2',objType='LDImage',class='',width=32,height=16,x=224,y=328,xScale=0.5*1,yScale=0.5*1,assetName='B11Speciale_0',
		userProps = {{name= 'movimento', value='muovere1' },{name= 'tipo', value='speciale' },},
		},
	{name='B03_11',objType='LDImage',class='',width=32,height=16,x=212,y=62,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=63,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_14',objType='LDImage',class='',width=32,height=16,x=221,y=98,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=-265,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_13',objType='LDImage',class='',width=32,height=16,x=213,y=135,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=119,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_12',objType='LDImage',class='',width=32,height=16,x=156,y=88,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=67,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_10',objType='LDImage',class='',width=32,height=16,x=166,y=124,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=-270,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_6',objType='LDImage',class='',width=32,height=16,x=130,y=61,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=36,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_8',objType='LDImage',class='',width=32,height=16,x=104,y=110,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=-324,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_9',objType='LDImage',class='',width=32,height=16,x=68,y=100,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=-358,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_15',objType='LDImage',class='',width=32,height=16,x=132,y=134,xScale=0.5*1,yScale=0.5*1,assetName='B04',
		rotation=59,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=0.4,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='invisibile' },},
		},
	{name='B03_7',objType='LDImage',class='',width=32,height=16,x=65,y=145,xScale=0.5*1,yScale=0.5*1,assetName='B03_7',
		userProps = {},
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

