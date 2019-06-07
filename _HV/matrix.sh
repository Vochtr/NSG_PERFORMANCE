#!/bin/bash
scenarios=( vpnConcentrator/CloudConnectorHub BranchWithLocalBreakout BranchWithCloudbasedSecurity/LocalBreakout/vpnConcentrator BranchWithLocalBreakoutandVNFsecurity HUBnSpokeBranch HUBnSpokeHubSite )
combinations=( 1C-to-1C nC-to-1C 1C-to-1X nC-to-1X nCnV-to-1X )
actions=( cleanup prepare performance )
features=( vnf encryption aar qos )

x=1
for s in "${scenarios[@]}"
do
  echo "Run High-Level Scenario:" $s
  y=1
  for a in "${actions[@]}"
  do
    for a in "${actions[@]}"
    do
      echo "     cats run with tag:"$a
      if [ "$a" == 'prepare' ]
      then
        for f in "${features[@]}"
        do
          echo "       cats run for enabling feature:" $f
        done
      fi
    done
    for c in "${combinations[@]}"
    do
      echo "       cat run with combination" $c
    done
    ((+y))
  done
  ((++x))
done

