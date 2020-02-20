-- Generated by Level Director X v1.1.0 on mer feb 19 22:33:23 2020 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
	assets.spriteSheetData['B06']={}
	assets.spriteSheetData['B06'].frames ={
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
	assets['maya11_0']={file ='maya11.jpg',name='maya11_0',class='',aX=0.5,aY=0.5,width=564,height=845,frame=0,spriteSheetName='maya11',frameCount=1,
		 }
	assets['B06_2']={file ='B06.png',name='B06_2',class='',aX=0.5,aY=0.5,width=64,height=32,frame=3,spriteSheetName='B06',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={32,-16,32,16,-32,16,-32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B06_16']={file ='B06.png',name='B06_16',class='',aX=0.5,aY=0.5,width=64,height=32,frame=17,spriteSheetName='B06',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={-32,-16,32,-16,32,16,-32,16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B06_17']={file ='B06.png',name='B06_17',class='',aX=0.5,aY=0.5,width=64,height=32,frame=18,spriteSheetName='B06',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={32,-16,32,16,-32,16,-32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
	assets['B06_21']={file ='B06.png',name='B06_21',class='',aX=0.5,aY=0.5,width=64,height=32,frame=22,spriteSheetName='B06',frameCount=25,
		 }
	assets['B11Speciale_21']={file ='B11Speciale.png',name='B11Speciale_21',class='',aX=0.5,aY=0.5,width=64,height=32,frame=22,spriteSheetName='B11Speciale',frameCount=25,
		physics={isEnabled=true,source='Asset',bodyType='static',isFixedRotation=false,isSleepingAllowed=false,isSensor=false,linearDamping=0,angularDamping=0,gravityScale=1,isBullet=false,shapes={{bodyShape='Polygon',shape={32,-16,32,16,-32,16,-32,-16},bounce=0.2,friction=0.3,density=1,radius=0,categoryBits=0,maskBits=0,groupIndex=0},}	}  }
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
	level.name='Level14' 
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
	{name='maya11_0',objType='LDImage',class='',width=320,height=480,x=160,y=240,xScale=0.567376*1,yScale=0.568047*1,assetName='maya11_0',
		userProps = {},
		},
	{name='B06_1',objType='LDImage',class='',width=32,height=16,x=160,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B11Speciale_21',
		userProps = {{name= 'tipo', value='speciale' },},
		},
	{name='B06_2',objType='LDImage',class='',width=32,height=16,x=144,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_4',objType='LDImage',class='',width=32,height=16,x=176,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_5',objType='LDImage',class='',width=32,height=16,x=192,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_6',objType='LDImage',class='',width=32,height=16,x=176,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_7',objType='LDImage',class='',width=32,height=16,x=144,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_8',objType='LDImage',class='',width=32,height=16,x=128,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_12',objType='LDImage',class='',width=48,height=16,x=24,y=312,xScale=0.75*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_14',objType='LDImage',class='',width=48,height=16,x=296,y=312,xScale=0.75*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_17',objType='LDImage',class='',width=32,height=16,x=128,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_18',objType='LDImage',class='',width=32,height=16,x=192,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_19',objType='LDImage',class='',width=32,height=16,x=224,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_20',objType='LDImage',class='',width=32,height=16,x=192,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_21',objType='LDImage',class='',width=32,height=16,x=128,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_22',objType='LDImage',class='',width=32,height=16,x=96,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_23',objType='LDImage',class='',width=32,height=16,x=96,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_24',objType='LDImage',class='',width=32,height=16,x=96,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_25',objType='LDImage',class='',width=32,height=16,x=224,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_26',objType='LDImage',class='',width=32,height=16,x=224,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_27',objType='LDImage',class='',width=32,height=16,x=80,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_28',objType='LDImage',class='',width=32,height=16,x=80,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_29',objType='LDImage',class='',width=32,height=16,x=240,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_30',objType='LDImage',class='',width=32,height=16,x=240,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_31',objType='LDImage',class='',width=32,height=16,x=64,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_32',objType='LDImage',class='',width=32,height=16,x=64,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_33',objType='LDImage',class='',width=32,height=16,x=80,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_34',objType='LDImage',class='',width=32,height=16,x=96,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_35',objType='LDImage',class='',width=32,height=16,x=128,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_36',objType='LDImage',class='',width=32,height=16,x=160,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_37',objType='LDImage',class='',width=32,height=16,x=224,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_38',objType='LDImage',class='',width=32,height=16,x=240,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_39',objType='LDImage',class='',width=32,height=16,x=256,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_40',objType='LDImage',class='',width=32,height=16,x=256,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_41',objType='LDImage',class='',width=32,height=16,x=32,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_42',objType='LDImage',class='',width=32,height=16,x=32,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_43',objType='LDImage',class='',width=32,height=16,x=32,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_44',objType='LDImage',class='',width=32,height=16,x=16,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_45',objType='LDImage',class='',width=32,height=16,x=16,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_46',objType='LDImage',class='',width=32,height=16,x=288,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_47',objType='LDImage',class='',width=32,height=16,x=304,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_48',objType='LDImage',class='',width=32,height=16,x=288,y=248,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_49',objType='LDImage',class='',width=32,height=16,x=288,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_50',objType='LDImage',class='',width=32,height=16,x=304,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_51',objType='LDImage',class='',width=32,height=16,x=112,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_52',objType='LDImage',class='',width=32,height=16,x=112,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_53',objType='LDImage',class='',width=32,height=16,x=208,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_54',objType='LDImage',class='',width=32,height=16,x=208,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_60',objType='LDImage',class='',width=32,height=16,x=192,y=312,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_61',objType='LDImage',class='',width=32,height=16,x=160,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_62',objType='LDImage',class='',width=32,height=16,x=16,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_63',objType='LDImage',class='',width=32,height=16,x=48,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_64',objType='LDImage',class='',width=32,height=16,x=304,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_66',objType='LDImage',class='',width=32,height=16,x=272,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_68',objType='LDImage',class='',width=32,height=16,x=304,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_69',objType='LDImage',class='',width=32,height=16,x=16,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_72',objType='LDImage',class='',width=32,height=16,x=160,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_73',objType='LDImage',class='',width=16,height=16,x=8,y=216,xScale=0.25*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_9',objType='LDImage',class='',width=16,height=16,x=8,y=248,xScale=0.25*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_15',objType='LDImage',class='',width=16,height=16,x=8,y=280,xScale=0.25*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_65',objType='LDImage',class='',width=16,height=16,x=312,y=216,xScale=0.25*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_67',objType='LDImage',class='',width=16,height=16,x=312,y=248,xScale=0.25*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_71',objType='LDImage',class='',width=16,height=16,x=312,y=280,xScale=0.25*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_10',objType='LDImage',class='',width=32,height=16,x=48,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_16',objType='LDImage',class='',width=32,height=16,x=272,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_17',
		userProps = {},
		},
	{name='B06_56',objType='LDImage',class='',width=32,height=16,x=112,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_55',objType='LDImage',class='',width=32,height=16,x=144,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_58',objType='LDImage',class='',width=32,height=16,x=176,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_57',objType='LDImage',class='',width=32,height=16,x=208,y=200,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_59',objType='LDImage',class='',width=32,height=16,x=144,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_11',objType='LDImage',class='',width=32,height=16,x=112,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_13',objType='LDImage',class='',width=32,height=16,x=176,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_70',objType='LDImage',class='',width=32,height=16,x=80,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_3',objType='LDImage',class='',width=32,height=16,x=240,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_74',objType='LDImage',class='',width=32,height=16,x=208,y=296,xScale=0.5*1,yScale=0.5*1,assetName='B06_2',
		userProps = {{name= 'tipo', value='g' },},
		},
	{name='B06_76',objType='LDImage',class='',width=32,height=16,x=64,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_77',objType='LDImage',class='',width=32,height=16,x=48,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_78',objType='LDImage',class='',width=32,height=16,x=48,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_79',objType='LDImage',class='',width=32,height=16,x=64,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_80',objType='LDImage',class='',width=32,height=16,x=256,y=280,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_81',objType='LDImage',class='',width=32,height=16,x=272,y=264,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_82',objType='LDImage',class='',width=32,height=16,x=272,y=232,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
		userProps = {},
		},
	{name='B06_75',objType='LDImage',class='',width=32,height=16,x=256,y=216,xScale=0.5*1,yScale=0.5*1,assetName='B06_16',
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
