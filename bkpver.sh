#!/bin/bash

dt=$(date +%F)
hostnm=$HOSTNAME
path=/mnt/backup/file_backup/site_bkp
if [ $hostnm == "BackupServer" ]; then

	if [ $(id -u) -eq 0 ]; then

		echo "Checking for backups for the current date: $dt"

		#innovaturelabs-org,net,biz backups
		echo "Innovaturelabs-ORG"

		if [ -d "$path/innovaturelabs-org/daily/$(date +%F)" ]; then
			echo "$(du -sch $path/innovaturelabs-org/daily/* | grep $(date +%F))"
			orgsz=$(du -s $path/innovaturelabs-org/daily/$(date +%F) | cut -f1)
			orgbkp=0
			if [ $orgsz > 1300000 ]; then
				orgbkp=1
			fi
		else
			orgbkp=0
		fi


		echo "Innovaturelabs-NET"

                if [ -d "$path/innovaturelabs-net/daily/$(date +%F)" ]; then
                        echo "$(du -sch $path/innovaturelabs-net/daily/* | grep $(date +%F))"
                        netsz=$(du -s $path/innovaturelabs-net/daily/$(date +%F) | cut -f1)
                        netbkp=0
                        if [ $netsz > 10000 ]; then
                                netbkp=1
                        fi
                else
                        netbkp=0
                fi


		echo "Innovaturelabs-BIZ"

                if [ -d "$path/innovaturelabs-biz/daily/$(date +%F)" ]; then
                        echo "$(du -sch $path/innovaturelabs-biz/daily/* | grep $(date +%F))"
                        bizsz=$(du -s $path/innovaturelabs-biz/daily/$(date +%F) | cut -f1)
                        bizbkp=0
                        if [ $bizsz > 2500 ]; then
                                bizbkp=1
                        fi
                else
                        bizbkp=0
                fi


		echo "Pinmicro"

                if [ -d "$path/pinmicro/daily/$(date +%F)" ]; then
                        echo "$(du -sch $path/pinmicro/daily/* | grep $(date +%F))"
                        pinsz=$(du -s $path/pinmicro/daily/$(date +%F) | cut -f1)
                        pinbkp=0
                        if [ $pinsz > 55000 ]; then
                                pinbkp=1
                        fi
                else
                        pinbkp=0
                fi


		echo "BeaconPlus"

                if [ -d "$path/beaconplus/daily/$(date +%F)" ]; then
                        echo "$(du -sch $path/beaconplus/daily/* | grep $(date +%F))"
                        bcpsz=$(du -s $path/beaconplus/daily/$(date +%F) | cut -f1)
                        bcpbkp=0
                        if [ $bcpsz > 140000 ]; then
                                bcpbkp=1
                        fi
                else
                        bcpbkp=0
                fi


		echo "Glue-Production"

                if [ -d "$path/glue-production/daily/$(date +%F)" ]; then
                        echo "$(du -sch $path/glue-production/daily/* | grep $(date +%F))"
                        glpsz=$(du -s $path/glue-production/daily/$(date +%F) | cut -f1)
                        glpbkp=0
                        if [ $glpsz > 140000 ]; then
                                glpbkp=1
                        fi
                else
                        glpbkp=0
                fi


		echo "Glue-Blog"

                if [ -d "$path/glue-blog/daily/$(date +%F)" ]; then
                        echo "$(du -sch $path/glue-blog/daily/* | grep $(date +%F))"
                        glbsz=$(du -s $path/glue-blog/daily/$(date +%F) | cut -f1)
                        glbbkp=0
                        if [ $glbsz > 140000 ]; then
                                glbbkp=1
                        fi
                else
                        glbbkp=0
                fi

		#for weekly backup check

		if [ $(date +%u) == 7 ]; then

			echo "Innovaturelabs-ORG"
	                org=$(du -sch $path/innovaturelabs-org/weekly/* | grep $(date +%F))
        	        echo $org

                	echo "Innovaturelabs-NET"
                	net=$(du -sch $path/innovaturelabs-net/weekly/* | grep $(date +%F))
                	echo $net

