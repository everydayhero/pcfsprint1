# Set device background 
Framer.Device.background.backgroundColor = "#303138"
Back = new BackgroundLayer
    backgroundColor: "white"
Framer.Defaults.Animation =
    curve: "spring(500, 40, 2)"

# Import file "Refactor" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/Refactor@2x")

scrollHome = new ScrollComponent
    width: Screen.width
    height: Screen.height
    scrollHorizontal: false
    contentInset:
    	top: sketch.header.height

# Setup

sketch.header.bringToFront()

sketch.home.x = scrollHome.x
sketch.home
sketch.home.parent = scrollHome.content

sketch.form.x = 0
sketch.form.y = Screen.height
sketch.form.height = Screen.height
sketch.form.placeBefore(scrollHome)

sketch.actionBar.x = 0
sketch.actionBar.y = Screen.height
sketch.actionBar.placeBefore(sketch.form)

# States

sketch.form.states.add
	before:
		y: Screen.height
	during:
		y: sketch.header.height

sketch.actionBar.states.add
	before:
		y: Screen.height
	during:
		y: Screen.height - sketch.actionBar.height

sketch.personalCauseButton.on(Events.Click, (event, layer) ->
	sketch.form.states.switch("during")
	sketch.actionBar.states.switch("during")
	sketch.actionBar.y = Screen.height - sketch.actionBar.height
)

sketch.cancelButton.on(Events.Click, (e, layer) ->
	sketch.form.states.switch("before")
	sketch.actionBar.states.switch("before")
	scrollHome.visible = true
)

