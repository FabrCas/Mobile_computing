module(..., package.seeall)

local screenW, screenH = display.contentWidth, display.contentHeight
local viewableScreenW, viewableScreenH = display.viewableContentWidth, display.viewableContentHeight
local screenOffsetW, screenOffsetH = display.contentWidth -  display.viewableContentWidth, display.contentHeight - display.viewableContentHeight

local imgNum = nil
local images = nil

local background, nextImage, prevImage, cancelMove
local infoDisplay = display.newGroup()
local w = 960
local h = 444
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5


function new( imageSet, slideBackground, top )
	local pad = 200
	local top = top or 0

	local g = display.newGroup()
	local myImages = imageSet

	if slideBackground then
		background = display.newImage(slideBackground, 0, 0, true)
	else
		background = display.newRect( 0, 0, display.contentWidth, 900 )
		-- set anchors on the background
		background:setFillColor(0, 0, 0, 0.01)
	end

	background.x = display.contentCenterX
	background.y = display.contentCenterY

	g:insert(background)

	images = {}

	local counterDecine= 1
	for i = 1, 30 do
		
		local texture = nil
		local p = display.newSnapshot( w,h )
		math.randomseed( 0 )

		local valore
		if counterDecine >= 10 and counterDecine < 20 then 
			print("counterDecine >= 10")
		    valore= 1
			valore2= math.fmod (i, 10)
		elseif counterDecine >= 20 and counterDecine < 30 then 
			print("counterDecine >= 20")
			valore= 2
			valore2= math.fmod (i, 10)
		elseif counterDecine >= 30 then
			print("counterDecine >= 30")
			valore= 3
			valore2= math.fmod (i, 10)
		else 
			valore= i
		end

		print ("Valore "..valore)

		if counterDecine >= 10 then 
		texture = display.newImage(myImages[valore].image)
		texture.xScale= 0.7
		texture.yScale= 0.5
		texture.y= 150
		texture.x= texture.x -40

		texture2= display.newImage(myImages[valore2].image)
		texture2.xScale= 0.7
		texture2.yScale= 0.5
		texture2.y= 150
		texture2.x= texture2.x +40


		p.canvas:insert( texture )
		p.canvas:insert( texture2 )

	else


		texture = display.newImage(myImages[valore].image)
		texture.xScale= 0.7
		texture.yScale= 0.5
		texture.y= 150

		p.canvas:insert( texture )
	end
		p:invalidate( "canvas" )
		g:insert(p)

		if (i > 1) then
			p.x = screenW*0.8 + pad

			p.path.x3 = -300
			p.path.y3 = -100
			p.path.x4 = -300
			p.path.y4 = 100

			if (i > 2) then
				p.alpha = 0
			else
				p.alpha=0.7
			end
		else
			p.x = screenW*.5

		end

		p.y = display.contentCenterY
		p:toBack()

		images[i] = p
		counterDecine= counterDecine+1
		print("cd"..counterDecine)
	end

	imgNum = 1

	g.x = 0
	g.y = top + display.screenOriginY

	function touchListener (self, touch)
		local phase = touch.phase

		if ( phase == "began" ) then
			-- Subsequent touch events will target button even if they are outside the contentBounds of button
			display.getCurrentStage():setFocus( self )
			self.isFocus = true

			startPos = touch.x
			prevPos = touch.x
			startYPos = touch.y
			prevYPos = touch.y

		elseif( self.isFocus ) then

			if ( phase == "moved" ) then

				if tween then transition.cancel(tween) end

				local delta = touch.x - prevPos
				prevPos = touch.x

			elseif ( phase == "ended" or phase == "cancelled" ) then

				dragDistance = touch.x - startPos
				dragYDistance = touch.y - startYPos

				if (dragDistance < -50 and imgNum < #images) then
					nextImage()
				elseif (dragDistance < -50 and imgNum == #images) then
					--g:jumpToImage()
				elseif (dragDistance > 50 and imgNum > 1) then
					prevImage()
				else
					cancelMove()
					if (dragDistance == 0) then
						if (myImages[imgNum].locked) then
							print ("clicked locked item ", imgNum)
						else
							print ("clicked item ", imgNum)
							-- Sometime later, create an event and dispatch it
							local event = { name="levelClicked", level=imgNum }
							Runtime:dispatchEvent( event )
						end

					end
				end

				if ( phase == "cancelled" ) then
					cancelMove()
				end

				-- Allow touch events to be sent normally to the objects they "hit"
				display.getCurrentStage():setFocus( nil )
				self.isFocus = false

			end
		end

		return true

	end

	function cancelTween()
		if prevTween then
			transition.cancel(prevTween)
		end
		prevTween = tween
		idletime = 0
	end

	function nextImage()

		tween = transition.to( images[imgNum], {time=400, alpha=0, transition=easing.outExpo } )

		if images[imgNum-1] ~= nil then
			tween = transition.to( images[imgNum-1], {time=400, alpha=0, transition=easing.outExpo } )
		end
		if images[imgNum] ~= nil then
			tween = transition.to( images[imgNum], {time=500, alpha=0, transition=easing.outExpo } )
		end
		if images[imgNum+1] ~= nil then
			tween = transition.to( images[imgNum+1], {time=400, alpha=1, transition=easing.outExpo } )
		end
		if images[imgNum+2] ~= nil then
			tween = transition.to( images[imgNum+2], {time=400, alpha=0, transition=easing.outExpo } )
		end
		transition.to( images[imgNum].path, { x1=300, y1=100, x2=300, y2=-100,
					time=400, transition=easing.outExpo } )
		tween = transition.to( images[imgNum], {time=400, x=(screenW*.25 - pad), transition=easing.outExpo } )

		----
		transition.to( images[imgNum+1].path, { x3=0, y3=0, x4=0, y4=0,
					time=400, transition=easing.outExpo } )
		tween = transition.to( images[imgNum+1], {time=400, x=screenW*.5, transition=easing.outExpo } )

		imgNum = imgNum + 1
		initImage(imgNum)
		images[imgNum]:toFront()

	end

	function prevImage()
		tween = transition.to( images[imgNum], {time=400, alpha=0, transition=easing.outExpo } )

		if images[imgNum-1] ~= nil then
			tween = transition.to( images[imgNum-1], {time=400, alpha=1, transition=easing.outExpo } )
		end
		if images[imgNum] ~= nil then
			tween = transition.to( images[imgNum], {time=500, alpha=0, transition=easing.outExpo } )
		end
		if images[imgNum-2] ~= nil then
			tween = transition.to( images[imgNum-2], {time=400, alpha=0, transition=easing.outExpo } )
		end
		if images[imgNum+1] ~= nil then
			tween = transition.to( images[imgNum+1], {time=400, alpha=0, transition=easing.outExpo } )
		end



		transition.to( images[imgNum].path, { x3=-300, y3=-100, x4=-300, y4=100,
					time=400, transition=easing.outExpo } )
		tween = transition.to( images[imgNum], {time=400, x=screenW*.75+pad, transition=easing.outExpo } )

		transition.to( images[imgNum-1].path, { x1=0, y1=0, x2=0, y2=0,
					time=400, transition=easing.outExpo } )
		tween = transition.to( images[imgNum-1], {time=400, x=screenW*.5, transition=easing.outExpo } )

		imgNum = imgNum - 1
		initImage(imgNum)
		images[imgNum]:toFront()
	end

	function cancelMove()
		tween = transition.to( images[imgNum], {time=400, x=screenW*.5, transition=easing.outExpo } )
		tween = transition.to( images[imgNum-1], {time=400, x=(screenW*.25 - pad), transition=easing.outExpo } )
		tween = transition.to( images[imgNum+1], {time=400, x=screenW*0.75+pad, transition=easing.outExpo } )

		idletime = 0
	end

	function initImage(num)

		if (num < #images) then
			images[num+1].x = screenW*.75 + pad
		end
		if (num > 1) then
			images[num-1].x = (screenW*.25 - pad)
		end
	end

	local function makeVisible(obj)
		obj.isVisible = true
	end
	local function makeInVisible(obj)
		obj.isVisible = false
	end

	background.touch = touchListener
	background:addEventListener( "touch", background )

		--- PUBLIC METHOD ----
	function g:jumpToImage(num)
		local i
		-- print("#images", #images)
		for i = 1, #images do
			-- print (imgNum,num)
			if i < num then
				nextImage()
			elseif i > num then
				prevImage()
			else
				break
			end
		end
		initImage(imgNum)
	end

	function g:cleanUp()
		print("slides cleanUp")
		background:removeEventListener("touch", touchListener)
	end

	return g
end
