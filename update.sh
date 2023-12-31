#! /bin/bash

### Function to connect device using ip

adbConnect() {
    echo "disconnecting other devices..."
    adb disconnect
    IP=$1
    echo "Connecting to $IP..."
    adb connect $IP
}

#Turn on adb
adb kill-server
adb start-server

# Start menu for what device to update
selectDevice(){
options=("22\" Bike" "10\" Rower" "10\" Treadmill" "Exit")
echo "Select which device you would like to update:"

select opt in "${options[@]}"
do
    case $opt in 
        "22\" Bike")
            echo "Connecting your 22\" bike..."
            adbConnect '192.168.0.35'
            
            ;;
        "10\" Rower")
            adbConnect '192.168.0.41'
            
            ;;
        "10\" Treadmill")
            adbConnect '192.168.0.40'
            
            ;;
        "Exit")
            echo "Exiting the script..."
            break;
            ;;
        *)
            echo "Invalid option"
    esac
done

}

###########################################

#main menu