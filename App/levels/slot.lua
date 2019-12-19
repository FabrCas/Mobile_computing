-- Generated by Level Director X v1.1.0 on gio dic 19 15:56:18 2019 --
require("lib.LD_HelperX")
local M={}
-----------------------------------
function M:loadAssets()
-----------------------------------
	local assets={}
	assets.spriteSheetData={}
	assets.spriteSheetData['1Sheet']={}
	assets.spriteSheetData['1Sheet'].frames ={
		{x=0,y=0,width=200,height=200},
		{x=200,y=0,width=200,height=200},
		{x=400,y=0,width=200,height=200},
		sheetContentWidth=600,
		sheetContentHeight=200
	}
	assets.spriteSheetData['2Sheet']={}
	assets.spriteSheetData['2Sheet'].frames ={
		{x=0,y=0,width=200,height=200},
		{x=200,y=0,width=200,height=200},
		{x=400,y=0,width=200,height=200},
		sheetContentWidth=600,
		sheetContentHeight=200
	}
	assets.spriteSheetData['3Sheet']={}
	assets.spriteSheetData['3Sheet'].frames ={
		{x=0,y=0,width=200,height=200},
		{x=200,y=0,width=200,height=200},
		{x=400,y=0,width=200,height=200},
		sheetContentWidth=600,
		sheetContentHeight=200
	}
	assets.spriteSheetData['4Sheet']={}
	assets.spriteSheetData['4Sheet'].frames ={
		{x=0,y=0,width=200,height=200},
		{x=200,y=0,width=200,height=200},
		{x=400,y=0,width=200,height=200},
		sheetContentWidth=600,
		sheetContentHeight=200
	}
	assets.spriteSheetData['5Sheet']={}
	assets.spriteSheetData['5Sheet'].frames ={
		{x=0,y=0,width=200,height=200},
		{x=200,y=0,width=200,height=200},
		{x=400,y=0,width=200,height=200},
		sheetContentWidth=600,
		sheetContentHeight=200
	}
	assets.spriteSheetData['downSheet']={}
	assets.spriteSheetData['downSheet'].frames ={
		{x=0,y=0,width=200,height=200},
		{x=200,y=0,width=200,height=200},
		sheetContentWidth=400,
		sheetContentHeight=200
	}
	assets.spriteSheetData['upSheet']={}
	assets.spriteSheetData['upSheet'].frames ={
		{x=0,y=0,width=200,height=200},
		{x=200,y=0,width=200,height=200},
		sheetContentWidth=400,
		sheetContentHeight=200
	}
	assets.spriteSheetData['statSheet']={}
	assets.spriteSheetData['statSheet'].frames ={
		{x=0,y=0,width=600,height=400},
		{x=600,y=0,width=600,height=400},
		{x=1200,y=0,width=600,height=400},
		{x=0,y=400,width=600,height=400},
		{x=600,y=400,width=600,height=400},
		{x=1200,y=400,width=600,height=400},
		{x=0,y=800,width=600,height=400},
		{x=600,y=800,width=600,height=400},
		{x=1200,y=800,width=600,height=400},
		sheetContentWidth=1800,
		sheetContentHeight=1200
	}
	assets['windowR_0']={file ='windowR.png',name='windowR_0',class='',aX=0.5,aY=0.5,width=640,height=960,frame=0,spriteSheetName='windowR',frameCount=1,
		 }
	assets['1Sheet_0']={file ='1Sheet.png',name='1Sheet_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=1,spriteSheetName='1Sheet',frameCount=3,
		sequenceData={{name='1+',frames={ 1,3,1 },time =500,loopCount=1,loopDirection='forward' },{name='1-',frames={ 1,2,1 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
		 }
	assets['2Sheet_0']={file ='2Sheet.png',name='2Sheet_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=1,spriteSheetName='2Sheet',frameCount=3,
		sequenceData={{name='2+',frames={ 1,3,1 },time =500,loopCount=1,loopDirection='forward' },{name='2-',frames={ 1,2,1 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
		 }
	assets['3Sheet_0']={file ='3Sheet.png',name='3Sheet_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=1,spriteSheetName='3Sheet',frameCount=3,
		sequenceData={{name='3+',frames={ 1,3,1 },time =500,loopCount=1,loopDirection='forward' },{name='3-',frames={ 1,2,1 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
		 }
	assets['4Sheet_0']={file ='4Sheet.png',name='4Sheet_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=1,spriteSheetName='4Sheet',frameCount=3,
		sequenceData={{name='4+',frames={ 1,3,1 },time =500,loopCount=1,loopDirection='forward' },{name='4-',frames={ 1,2,1 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
		 }
	assets['5Sheet_0']={file ='5Sheet.png',name='5Sheet_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=1,spriteSheetName='5Sheet',frameCount=3,
		sequenceData={{name='5+',frames={ 1,3,1 },time =500,loopCount=1,loopDirection='forward' },{name='5-',frames={ 1,2,1 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
		 }
	assets['downSheet_0']={file ='downSheet.png',name='downSheet_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=1,spriteSheetName='downSheet',frameCount=2,
		sequenceData={{name='selected',frames={ 1,2,1 },time =500,loopCount=1,loopDirection='forward' },{name='choosed',frames={ 1,2 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
		 }
	assets['upSheet_0']={file ='upSheet.png',name='upSheet_0',class='',aX=0.5,aY=0.5,width=200,height=200,frame=1,spriteSheetName='upSheet',frameCount=2,
		sequenceData={{name='selected',frames={ 1,2,1 },time =500,loopCount=1,loopDirection='forward' },{name='choosed',frames={ 1,2 },time =500,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
		 }
	assets['statSheet_0']={file ='statSheet.png',name='statSheet_0',class='',aX=0.5,aY=0.5,width=600,height=400,frame=1,spriteSheetName='statSheet',frameCount=9,
		sequenceData={{name='roll',frames={ 1,2,3,4,5,6,7 },time =200,loopCount=1,loopDirection='forward' },},
		sequenceInfo={default='',play=false },
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
	level.name='Slot' 
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
	{name='windowR_0',objType='LDImage',class='',width=320,height=480,x=160,y=240,xScale=0.5*1,yScale=0.5*1,assetName='windowR_0',
		userProps = {},
		},
	{name='1Sheet_0',objType='LDImage',class='',width=60,height=60,x=60,y=373,xScale=0.3*1,yScale=0.3*1,assetName='1Sheet_0',
		userProps = {},
		},
	{name='2Sheet_0',objType='LDImage',class='',width=60,height=60,x=160,y=373,xScale=0.3*1,yScale=0.3*1,assetName='2Sheet_0',
		userProps = {},
		},
	{name='3Sheet_0',objType='LDImage',class='',width=60,height=60,x=260,y=373,xScale=0.3*1,yScale=0.3*1,assetName='3Sheet_0',
		userProps = {},
		},
	{name='4Sheet_0',objType='LDImage',class='',width=60,height=60,x=108,y=436,xScale=0.3*1,yScale=0.3*1,assetName='4Sheet_0',
		userProps = {},
		},
	{name='5Sheet_0',objType='LDImage',class='',width=60,height=60,x=212,y=436,xScale=0.3*1,yScale=0.3*1,assetName='5Sheet_0',
		userProps = {},
		},
	{name='downSheet_0',objType='LDImage',class='',width=100,height=100,x=94,y=277,xScale=0.5*1,yScale=0.5*1,assetName='downSheet_0',
		userProps = {},
		},
	{name='upSheet_0',objType='LDImage',class='',width=100,height=100,x=225,y=277,xScale=0.5*1,yScale=0.5*1,assetName='upSheet_0',
		userProps = {},
		},
	{name='statSheet_0',objType='LDImage',class='',width=300,height=200,x=160,y=112,xScale=0.5*1,yScale=0.5*1,assetName='statSheet_0',
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

