#!/bin/bash
# Sucrose Downloader
# shadowed1

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)

COLORS=(
    "$RED"
    "$GREEN"
    "$YELLOW"
    "$BLUE"
    "$MAGENTA"
    "$CYAN"
)

LOGO_COLOR="${COLORS[RANDOM % ${#COLORS[@]}]}"

rainbow_index=()
for ((g=0; g<=5; g++)); do rainbow_index+=( $((16 + 36*5 + 6*g + 0)) ); done
for ((r=5; r>=0; r--)); do rainbow_index+=( $((16 + 36*r + 6*5 + 0)) ); done
for ((b=0; b<=5; b++)); do rainbow_index+=( $((16 + 36*0 + 6*5 + b)) ); done
for ((g=5; g>=0; g--)); do rainbow_index+=( $((16 + 36*0 + 6*g + 5)) ); done
for ((r=0; r<=5; r++)); do rainbow_index+=( $((16 + 36*r + 6*0 + 5)) ); done
for ((b=5; b>=0; b--)); do rainbow_index+=( $((16 + 36*5 + 6*0 + b)) ); done
num_colors=${#rainbow_index[@]}

rainbow_echo() {
    local text="$1"
    local i=0
    local char

    while IFS= read -r -n1 char; do
        if [[ "$char" == " " || "$char" == $'\n' ]]; then
            printf "%s" "$char"
        else
            printf "%s%s%s" "$(tput setaf "${rainbow_index[i]}")" "$char" "$RESET"
            (( i = (i + 1) % num_colors ))
        fi
    done <<< "$text"
    printf "\n"
}

rainbow_echo
rainbow_echo ""
rainbow_echo "                                                           .lxo. "                                    
rainbow_echo "                                                 .';,.     .oOx' "                                    
rainbow_echo "                                                 ;x00,      'c. "                                     
rainbow_echo "                                                 .cl;       ,:. "                                     
rainbow_echo "                                                .;c;.     .'cc.    ..  .';:;..    .:dd:. "            
rainbow_echo "                                               .;cc:'.....;oxxo,,;cxOc.':clc;',:c:cOXN0, "            
rainbow_echo "                                                .....     .;lc'...':l, .';;'.     .;ll;. "            
rainbow_echo "                                                           .c'          .'. "                         
rainbow_echo "                                                           .:.          .,. "                         
rainbow_echo "                                      ...                  .c.          .;. "                         
rainbow_echo "                           .ol.       ;Ok'       ...      .:l:.        .:c'     ... "               
rainbow_echo "           ',.          .:;;cc:;.....,:;';oc.   :OK0o:::,;lxxdc,''''.';oxxd:,,:lx0O; "              
rainbow_echo "          .x0c          lK0:   .,:llc,   ;d,    ,oxd:'....':l:........,lddo;..'':ol. "                
rainbow_echo "           ;c.          :d,      ,oo:'. .'.                .,.         .cc. "                      
rainbow_echo "         .,'          .l,       ',.  .';,.                .'.         .c; "                         
rainbow_echo "         .:c;'.......,:l:.      .,.     ..                 ';,.        .c; "                          
rainbow_echo "          .'......'';oxdc'..  .';.                        .;cc'        .c; "                         
rainbow_echo "                     .;c'....'cdl.                         ',.         .c;. "                         
rainbow_echo "                      .;.    ,:c:,,.                       ,'.,,.    .,lool' "                       
rainbow_echo "       .ldc'          .:. ,lo,    .......                 .:,oKX0ocl::loxxxl;,'...     .... "        
rainbow_echo "       ;0XOoccc,..',,..;' ;dc.       .'::;.  .           .;;.;xOd,.....:lc:...''...'..';:c:, "       
rainbow_echo "        .,'...'..,:cc;,;:,.           .''...,:;'........;ldo,. .      .;'            .';ccc,. "      
rainbow_echo "                  .,,,:clc,''..... ..','...';c:,......'':oddc,'...   .';.              .;;.. "     
rainbow_echo "                    ':;,,. ....''',cdxo:,..  ..          ;c.  .',,'.;clc'...,ldc.      .c; "      
rainbow_echo "                 .,ll.             'ldl'                :kx.       'ldxxl,,:cd0x'      .kd. "        
rainbow_echo "               .l0Ko.               .:,                 ;do.        'll;.     .        'xo. "       
rainbow_echo "                'cc.                 ;;                             .c'               ,d0Kk; "       
rainbow_echo "                                     ,:                             ':.               'o0KO; "      
rainbow_echo "                                     ':.                            ',                 ..'. "      
rainbow_echo "                                    .:l:.                          .,' "                           
rainbow_echo "                              .;c;,,cddd:'''....',,'.             .','. "                            
rainbow_echo "                              .xOl'..:;'.  .....;cc;.            .,ccc,. "                           
rainbow_echo "                               ..   ':.         .;;.             .;cc,. "                          
rainbow_echo "                                   l0Oc         .od,            .l00o. "                           
rainbow_echo "                                   ,ol'         cO0o.            .:c' "                            
rainbow_echo "                                                :kkl. "                             
echo "${RESET}${BOLD}${LOGO_COLOR}                                             "
echo "                                 ▄▄▄▄▄▄▄                                     "
echo "                                █████▀▀▀                                     "
echo "                                 ▀████▄  ██ ██ ▄████ ████▄ ▄███▄ ▄█▀▀▀ ▄█▀█▄ "
echo "                                   ▀████ ██ ██ ██    ██ ▀▀ ██ ██ ▀███▄ ██▄█▀ "
echo "                                ███████▀ ▀██▀█ ▀████ ██    ▀███▀ ▄▄▄█▀ ▀█▄▄▄ "
echo "                                             "
echo "                                           Enabling sudo in crosh! ${RESET}"   
echo ""
curl -L https://raw.githubusercontent.com/shadowed1/sucrose/main/bin/sucrose_installer.sh -o /home/chronos/user/sucrose_installer
echo
echo "${CYAN}${BOLD}How to install: ${RESET}${BLUE}"
echo "${CYAN}"
echo "0.) Enable developer mode."
echo "1.) ctrl-alt-refresh to open VT-2 (ctrl-alt-back to exit)"
echo "2.) Log in as chronos"
echo "3.) Run the command listed below in VT-2 to continue the installer:"
echo "${RESET}${BOLD}${BLUE}"
echo "sudo bash ~/sucrose_installer"
echo "${RESET}${BLUE}"
echo "${MAGENTA}README: ${BOLD}https://github.com/shadowed1/sucrose/blob/main/README.md${RESET}"
echo
