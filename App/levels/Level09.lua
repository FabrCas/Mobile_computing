-- Generated by Level Director X v1.1.0 on gio gen 30 17:00:52 2020 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
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
	assets.spriteSheetData['B12']={}
	assets.spriteSheetData['B12'].frames ={
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
	assets['f20d132cf390c26678f9edfd1df73c18_0']={file ='f20d132cf390c26678f9edfd1df73c18.jpg',name='f20d132cf390c26678f9edfd1df73c18_0',class='',aX=0.5,aY=0.5,width=564,height=905,frame=0,spriteSheetName='f20d132cf390c26678f9edfd1df73c18',frameCount=1,
		 }
	assets['B11Speciale_10']={file ='B11Speciale.png',name='B11Speciale_10',class='',aX=0.5,aY=0.5,width=64,height=32,frame=11,spriteSheetName='B11Speciale',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={-32,-16,-32,16,32,16,32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B12_10']={file ='B12.png',name='B12_10',class='',aX=0.5,aY=0.5,width=64,height=32,frame=11,spriteSheetName='B12',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={-32,-16,-32,16,32,16,32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B12_24']={file ='B12.png',name='B12_24',class='',aX=0.5,aY=0.5,width=64,height=32,frame=25,spriteSheetName='B12',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={-32,-16,-32,16,32,16,32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['toplivello9_0']={file ='toplivello9.jpg',name='toplivello9_0',class='',aX=0.5,aY=0.5,width=558,height=99,frame=0,spriteSheetName='toplivello9',frameCount=1,
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
	level.name='Level09' 
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
	{name='toplivello9_0',objType='LDImage',class='',width=320,height=43.5,x=160,y=22,xScale=0.573477*1,yScale=0.439394*1,assetName='toplivello9_0',
		userProps = {},
		},
	{name='f20d132cf390c26678f9edfd1df73c18_0',objType='LDImage',class='',width=320,height=480,x=160,y=278,xScale=0.567376*1,yScale=0.530387*1,assetName='f20d132cf390c26678f9edfd1df73c18_0',
		userProps = {},
		},
	{name='1',objType='LDImage',class='',width=32,height=16,x=14,y=172,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=75,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='2',objType='LDImage',class='',width=32,height=16,x=23,y=205,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=75,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='4',objType='LDImage',class='',width=32,height=16,x=32,y=238,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=75,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='5',objType='LDImage',class='',width=32,height=16,x=42,y=269,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=75,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='6',objType='LDImage',class='',width=32,height=16,x=51,y=301,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=75,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='7',objType='LDImage',class='',width=32,height=16,x=286,y=242,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=285,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='8',objType='LDImage',class='',width=32,height=16,x=269,y=304,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=285,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='9',objType='LDImage',class='',width=32,height=16,x=278,y=273,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=285,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='10',objType='LDImage',class='',width=32,height=16,x=295,y=209,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=285,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='11',objType='LDImage',class='',width=32,height=16,x=304,y=177,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=285,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='12',objType='LDImage',class='',width=32,height=16,x=60,y=332,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=75,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='13',objType='LDImage',class='',width=32,height=16,x=73,y=364,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=63,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='14',objType='LDImage',class='',width=32,height=16,x=92,y=392,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=50,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='15',objType='LDImage',class='',width=32,height=16,x=124,y=410,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=12,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='16',objType='LDImage',class='',width=32,height=16,x=158,y=412,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		userProps = {},
		},
	{name='17',objType='LDImage',class='',width=32,height=16,x=258,y=336,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=-69,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='18',objType='LDImage',class='',width=32,height=16,x=192,y=410,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=-10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='19',objType='LDImage',class='',width=32,height=16,x=245,y=367,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=-62,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='20',objType='LDImage',class='',width=32,height=16,x=224,y=394,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=317,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='21',objType='LDImage',class='',width=32,height=16,x=60,y=159,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='22',objType='LDImage',class='',width=32,height=16,x=91,y=163,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='23',objType='LDImage',class='',width=32,height=16,x=123,y=167,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='24',objType='LDImage',class='',width=32,height=16,x=155,y=171,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='25',objType='LDImage',class='',width=32,height=16,x=187,y=175,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='26',objType='LDImage',class='',width=32,height=16,x=218,y=179,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='27',objType='LDImage',class='',width=32,height=16,x=228,y=227,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='28',objType='LDImage',class='',width=32,height=16,x=136,y=254,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='29',objType='LDImage',class='',width=32,height=16,x=167,y=245,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='30',objType='LDImage',class='',width=32,height=16,x=259,y=218,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='31',objType='LDImage',class='',width=32,height=16,x=197,y=236,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='32',objType='LDImage',class='',width=32,height=16,x=105,y=263,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='33',objType='LDImage',class='',width=32,height=16,x=196,y=328,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='34',objType='LDImage',class='',width=32,height=16,x=101,y=310,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='35',objType='LDImage',class='',width=32,height=16,x=133,y=316,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='36',objType='LDImage',class='',width=32,height=16,x=164,y=322,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='37',objType='LDImage',class='',width=32,height=16,x=160,y=338,xScale=0.5*1,yScale=0.5*1,assetName='B11Speciale_10',
		rotation=10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'tipo', value='speciale' },},
		},
	{name='38',objType='LDImage',class='',width=32,height=16,x=10,y=137,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=-268,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='39',objType='LDImage',class='',width=32,height=16,x=309,y=142,xScale=0.5*1,yScale=0.5*1,assetName='B12_24',
		rotation=-92,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {},
		},
	{name='40',objType='LDImage',class='',width=32,height=16,x=88,y=181,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='41',objType='LDImage',class='',width=32,height=16,x=120,y=185,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='42',objType='LDImage',class='',width=32,height=16,x=152,y=189,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=7,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='43',objType='LDImage',class='',width=32,height=16,x=202,y=252,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='44',objType='LDImage',class='',width=32,height=16,x=171,y=261,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='45',objType='LDImage',class='',width=32,height=16,x=233,y=243,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=163,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='46',objType='LDImage',class='',width=32,height=16,x=128,y=333,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
		},
	{name='3',objType='LDImage',class='',width=32,height=16,x=193,y=344,xScale=0.5*1,yScale=0.5*1,assetName='B12_10',
		rotation=10,enableDrag=false,anchorX=0.5,anchorY=0.5,alpha=1,isVisible=true,blendMode='normal',
		userProps = {{name= 'vita', value='1' },},
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

