# bindake[autoboot,overlay-command-output]: <Super>+<Ctrl>+F
firefox:
	if pgrep -x firefox-bin > /dev/null; then \
		wmctrl -xa firefox; \
	else \
		setsid firefox > /dev/null 2>&1 < /dev/null & \
	fi; \
	echo "Firefox Browser"

# bindake: <Super>+<Ctrl>+G
chrome:
	if pgrep -x chrome > /dev/null; then \
		wmctrl -xa google-chrome; \
	else \
		setsid google-chrome > /dev/null 2>&1 < /dev/null & \
	fi; \
	echo "Chrome Browser"

# bindake: <Super>+<Ctrl>+T
terminal:
	if pgrep gnome-terminal > /dev/null; then \
	    wmctrl -xa gnome-terminal; \
	else \
	    setsid /home/martin/Desktop/VENTION-TERMINAL.sh > /dev/null 2>&1 < /dev/null & \
	fi; \
	echo "terminal"

# bindake: <Super>+<Ctrl>+S
slack:
	if pgrep slack > /dev/null; then \
	    wmctrl -xa slack; \
	else \
	    setsid slack > /dev/null 2>&1 < /dev/null & \
	fi; \
	echo "terminal"

# bindake: <Super>+<Ctrl>+R
rubymine:
	if pgrep RubyMine > /dev/null; then \
	    wmctrl -xa jetbrains-rubymine.jetbrains-rubymine; \
	else \
	    setsid /home/martin/Desktop/rubymine.sh > /dev/null 2>&1 < /dev/null & \
	fi; \
	echo "rubymine"

# bindake: <Super>+<Ctrl>+E
webstorm:
	if pgrep WebStorm > /dev/null; then \
	    wmctrl -xa jetbrains-webstorm.jetbrains-webstorm; \
	else \
	    setsid /home/martin/Desktop/webstorm.sh > /dev/null 2>&1 < /dev/null & \
	fi; \
	echo "webstorm!"


# bindake: <Super>+<Ctrl>+D
dbeaver:
	if pgrep -x dbeaver > /dev/null; then \
		wmctrl -xa dbeaver; \
	else \
	    setsid dbeaver > /dev/null 2>&1 < /dev/null & \
	fi; \
	echo "dbeaver"

# bindake: <Super>+<Ctrl>+W
Workspace: firefox chrome rubymine terminal dbeaver  slack

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
		xdotool windowsize $$WINDOW_ID 50% 100%; \
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
		xdotool windowsize $$WINDOW_ID 50% 100%; \
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
meteo:
	@CITY=$$(curl -s https://ipinfo.io/city); \
	COORD=$$(curl -s https://ipinfo.io/loc); \
	LAT=$$(echo $$COORD | cut -d',' -f1); \
	LON=$$(echo $$COORD | cut -d',' -f2); \
	echo "📍 City: $$CITY"; \
	RESP=$$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$$LAT&longitude=$$LON&current=temperature_2m,weather_code&daily=weather_code&timezone=auto"); \
	TEMP=$$(echo $$RESP | jq '.current.temperature_2m'); \
	CODE=$$(echo $$RESP | jq '.daily.weather_code[0]'); \
	SUMMARY=$$(case $$CODE in \
	  0) echo "Clear sky" ;; \
	  1|2|3) echo "Mainly clear to cloudy" ;; \
	  45|48) echo "Foggy" ;; \
	  51|53|55) echo "Drizzle" ;; \
	  61|63|65) echo "Rain" ;; \
	  66|67) echo "Freezing rain" ;; \
	  71|73|75|77) echo "Snow" ;; \
	  80|81|82) echo "Rain showers" ;; \
	  95|96|99) echo "Thunderstorm" ;; \
	  *) echo "Unknown weather" ;; \
	esac); \
	echo "🌡️  Temperature: $$TEMP °C"; \
	echo "📋 Today: $$SUMMARY"


