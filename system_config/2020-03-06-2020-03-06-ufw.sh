#!/bin/bash
clear
sudo ufw enable
sudo ufw allow 22 
sudo ufw deny from 10.10.10.10
sudo ufw allow from 10.101.0.1


