# Set device background 
Framer.Device.background.backgroundColor = "#303138"
Back = new BackgroundLayer
    backgroundColor: "white"

# Import file "Refactor" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/Refactor@2x")

scrollHome = new ScrollComponent
    width: Screen.width
    height: Screen.height
    scrollHorizontal: false
    contentInset:
    	top: sketch.header.height

sketch.header.bringToFront()

sketch.home.x = scrollHome.x
sketch.home
sketch.home.parent = scrollHome.content

sketch.form.y = Screen.y
sketch.form.x = Screen.x + sketch.header.height
#sketch.form.placeBefore(scrollHome)

sketch.personalCauseButton.on(Events.Click, (event, layer) ->
	#sketch.form.visible = true
	#sketch.form.y = Screen.y + sketch.header.height
	#scrollHome.visible = false
	sketch.form.bringToFront()
)

