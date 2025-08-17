# Reusable function: $(call launch,process-name,wmctrl-class,command,label)
define launch
	if pgrep $(1) > /dev/null; then \
		wmctrl -xa $(2); \
	else \
		setsid $(3) > /dev/null 2>&1 < /dev/null & \
	fi; \
	if [ -n "$(4)" ]; then echo "$(4)"; fi
endef

# bindake[autoboot,overlay-command-output]: <Super>+<Ctrl>+F
firefox:
	$(call launch,-x firefox-bin,firefox,firefox,Firefox Browser)

# bindake: <Super>+<Ctrl>+G
chrome:
	$(call launch,-x chrome,google-chrome,google-chrome,Chrome Browser)

# bindake: <Super>+<Ctrl>+T
terminal:
	$(call launch,-f gnome-terminal,gnome-terminal,/home/martin/Desktop/VENTION-TERMINAL.sh,terminal)

# bindake: <Super>+<Ctrl>+S
slack:
	$(call launch,slack,slack,slack,slack)

# bindake: <Super>+<Ctrl>+R
rubymine:
	$(call launch,RubyMine,jetbrains-rubymine.jetbrains-rubymine,/home/martin/Desktop/rubymine.sh,rubymine)

# bindake: <Super>+<Ctrl>+E
webstorm:
	$(call launch,WebStorm,jetbrains-webstorm.jetbrains-webstorm,/home/martin/Desktop/webstorm.sh,webstorm!)


# bindake: <Super>+<Ctrl>+D
dbeaver:
	$(call launch,-x dbeaver,dbeaver,dbeaver,dbeaver)

# bindake: <Super>+<Ctrl>+W
Workspace: firefox chrome rubymine terminal dbeaver slack

# bindake[overlay-command-output]: <Super>+<Ctrl>+M
minimize:
	xdotool getactivewindow windowminimize
	echo ""

# bindake[overlay-command-output]: <Super>+M
maximize:
	xdotool getactivewindow windowsize 100% 100% windowmove 0 0
	echo ""

# bindake[overlay-command-output]: <Super>+<Left>
move-left:
	@WINDOW_ID=$$(xdotool getactivewindow); \
	if [ -n "$$WINDOW_ID" ]; then \
		wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz; \
		sleep 0.0001; \
		xdotool windowsize $$WINDOW_ID 50% 98%; \
		sleep 0.0001; \
		xdotool windowmove $$WINDOW_ID 0 0; \
		wmctrl -r :ACTIVE: -b add,above; \
		wmctrl -r :ACTIVE: -b remove,above; \
		xdotool windowactivate $$WINDOW_ID; \
		echo "<-"; \
	else \
		echo "No active window found"; \
	fi

# bindake[overlay-command-output]: <Super>+<Right>
move-right:
	@WINDOW_ID=$$(xdotool getactivewindow); \
	if [ -n "$$WINDOW_ID" ]; then \
		wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz; \
		sleep 0.0001; \
		WIDTH=$$(xdpyinfo | awk '/dimensions:/ {print $$2}' | cut -d 'x' -f1); \
		HALF_WIDTH=$$(($$WIDTH / 2)); \
		xdotool windowsize $$WINDOW_ID 50% 98%; \
		sleep 0.0001; \
		xdotool windowmove $$WINDOW_ID $$HALF_WIDTH 0; \
		wmctrl -r :ACTIVE: -b add,above; \
		wmctrl -r :ACTIVE: -b remove,above; \
		xdotool windowactivate $$WINDOW_ID; \
		echo "->"; \
	else \
		echo "No active window found"; \
	fi

# bindake[overlay-command-output]: <Super>+<Ctrl>+K
kill:
	@echo "Killing process..."
	@PID=$$(xdotool getwindowfocus getwindowpid 2>/dev/null); \
	if [ -n "$$PID" ]; then \
		kill $$PID && echo "Process $$PID killed successfully" || echo "Failed to kill process $$PID"; \
	else \
		echo "Error: Could not get PID of focused window"; \
		exit 1; \
	fi

# bindake[overlay-command-output]: <Super>+<F1>


