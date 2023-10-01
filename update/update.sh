#! /bin/bash

### Function to connect device using ip

adbConnect() {
    echo "disconnecting other devices..."
    adb disconnect
    IP=$1
    echo "Connecting to $IP..."
    adb connect $IP
}



#Menu for what device to update
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
                echo "Exiting connection attempt..."
                break
                ;;
            *)
                echo "Invalid option"
            esac
        done
}

###########################################

#main menu --
### options: connect devices, update devices, exit
startOptions=("Connect Devices" "Update Devices" "Exit")

#Turn on adb
adb kill-server
adb start-server

select choice in "${startOptions[@]}"
    do
        case $choice in
            "Connect Devices")
                selectDevice
                ;;
            "Update Devices")
                echo "Reached update devices"
                ;;
            "Exit")
                echo "Exiting Script, have a nice day!"
                break;
                ;;
            *)
                echo "Invalid"
         esac     
    done