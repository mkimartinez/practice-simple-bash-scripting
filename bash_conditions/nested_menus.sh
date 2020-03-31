#!/bin/bash
echo "==================================================="
echo " Script for nested select case menus"
echo "==================================================="
while true
do
	#Parent menu
	select item in Mouse Printer Monitor HDD
	do
		case $item in
			Mouse)
				echo "Which type of monitor do you want"
				;;
			Printer)
				#Submenu items 
				select subitem in Samsung HP Dell
				do
					case $subitem in
						Samsung)
							echo " The price of sumsumng printer is 100"
							break
							;;
						HP)
							echo " The price of HP printer is 400"
							break
							;;
						Dell)
							echo "No dell printer available"
							break 2
							;;
					esac
				done
				break
				;;
			Monitor)
				echo "Buy new Samsung monitor at low price"
				break
				;;
			HDD)
				echo "Good quality HDD available"
				break 2
		esac	
	done
done
