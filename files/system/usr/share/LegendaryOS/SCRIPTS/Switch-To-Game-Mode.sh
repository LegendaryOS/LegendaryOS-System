#!/bin/bash

# Define color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Function to display a decorative header
display_header() {
    clear
    echo -e "${MAGENTA}┌────────────────────────────────────────────┐${NC}"
    echo -e "${CYAN}│${WHITE}    LegendaryOS Update System GUI           ${CYAN}│${NC}"
    echo -e "${MAGENTA}└────────────────────────────────────────────┘${NC}"
    echo
}

# Function to display a styled menu
display_menu() {
    echo -e "${YELLOW}══════════════════ Options ═════════════════${NC}"
    echo -e "${GREEN}  [q] Quit${NC}         ${BLUE}Close the terminal${NC}"
    echo -e "${GREEN}  [r] Reboot${NC}       ${BLUE}Reboot the system${NC}"
    echo -e "${GREEN}  [s] Shutdown${NC}     ${BLUE}Power off the system${NC}"
    echo -e "${GREEN}  [L] Log out${NC}      ${BLUE}Log out of the session${NC}"
    echo -e "${GREEN}  [S] Switch${NC}       ${BLUE}Switch to game mode${NC}"
    echo -e "${YELLOW}══════════════════════════════════════════${NC}"
    echo
}

# Display header and run the update-system script
display_header
echo -e "${WHITE}Initiating system update...${NC}"
echo -e "${BLUE}Please wait while the system updates...${NC}"
echo
sudo /usr/bin/update-system

# Wait for the update-system script to complete
wait

# Check if update was successful
if [ $? -eq 0 ]; then
    echo
    echo -e "${GREEN}✔ System update completed successfully!${NC}"
else
    echo
    echo -e "${RED}✘ System update failed! Check logs for details.${NC}"
fi
echo

# Display menu
display_menu

# Read user input with a styled prompt
echo -e "${CYAN}➤ Enter your choice [q/r/s/L/S]:${NC} \c"
read choice

# Handle user input with feedback
case $choice in
    q|Q)
        echo -e "${GREEN}✔ Closing terminal...${NC}"
        sleep 1
        exit 0
        ;;
    r|R)
        echo -e "${YELLOW}↻ Rebooting system...${NC}"
        sleep 1
        sudo reboot
        ;;
    s|S)
        echo -e "${YELLOW}⏻ Shutting down system...${NC}"
        sleep 1
        sudo shutdown 0
        ;;
    l|L)
        echo -e "${YELLOW}← Logging out of session...${NC}"
        sleep 1
        gnome-session-quit --no-prompt 2>/dev/null || logout
        ;;
    S|s)
        echo -e "${YELLOW}🎮 Switching to game mode...${NC}"
        sleep 1
        sudo /usr/share/LegendaryOS/SCRIPTS/Switch-To-Game-Mode.sh
        ;;
    *)
        echo -e "${RED}✘ Invalid choice! Exiting...${NC}"
        sleep 1
        exit 1
        ;;
esac
