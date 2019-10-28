# Lunar Rover - part 1: Implement RIPv2 protocol.

README.md
==========================
Date: 10-27-2019
Authors: Sudhir Singh


### Introduction: 
The LunarRover project
Part 1: Implement RIPv2 protocol to enable reover to send each other routing table.

### Requirements: 
Please follow the sample docker files (README-1.md) provided as part of this project. Also, as part of this project, below cases has been assumed.

    Multicast address: 224.0.0.9 
    (This is the address on which all Rover will join to send/receive multicast messages.)

    Multicast Port: 5520 
    (This is the port of Multicast messages.)

    RIP Port: 5521 
    (This is the port in which regurals updates/routing tables are sent.)

    Internal subnet: 10.0.subnet.0/24
    The subnet id is provided as a command line argument. The subnet is suumed to be 255.255.255.0 for part 1 of the project.

    RIP command = 2
    As part of the project, only command = 2 (response) has been implemented as it was only required (command=1 request not needed).


### Description:
The project is architect to devide the task between threads. Each thread execute a task. Below are the details-

    a) LunarRover : This is the main program of a Rover which need to be executed. Other sub-programs/file/threads will be executed with this program.
    b) HostUpdate : The program to create and update subnet in a Rover.
    c) RIP Trigger Update: The program/thread to send trigger updates to multicast address.
    d) RIP Multicast Receiver: The program/thread to receive all multicast messages on a specific Rover.
    e) RIP Receiver: The program/thread to receive regular routing table updates.
    f) RIP Sender: The program/thread to send regular routing table updates on every 5 seconds. 
    g) Garbage Collector: The program/thread to clean/update the routing table of a Rover.


### Execution of the program.<br>
    
    1) Please follow the docker files provided (README-1.md file for more details) as part of the project to test different scenarios.


### Sample Output of a Rover:
A sample routing table of a rover.

    ===========================================================================================
                        *****Printing routing table info*****
    ===========================================================================================
    Destination 	Subnet mask 	Next hop 	Interface 	Count 	Flag 	Time
    /10.0.1.0	/255.255.255.0	/172.18.0.21	0		    0		false	1572224223
    /10.0.2.0	/255.255.255.0	/172.18.0.22	1		    1		false	1572224215
    /0.0.0.0	/0.0.0.0	    /172.18.0.22	2		    1		false	1572224220
    /10.0.3.0	/255.255.255.0	/172.18.0.22	4		    2		false	1572224220

