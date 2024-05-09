include config.mk

package: restic-onionui.zip

clean:
	-rm restic-onionui.zip
	-rm -r App/Restic/bin
	-rm App/Restic/cacert.pem
	-rm *.sha256

App/Restic/bin/restic:
	-mkdir -p App/Restic/bin
	wget https://github.com/restic/restic/releases/download/v$(RESTIC_VERSION)/restic_$(RESTIC_VERSION)_linux_arm.bz2 -O $@.bz2
	echo "$(RESTIC_SHA265) $@.bz2" > restic.bz2.sha256
	sha256sum -c restic.bz2.sha256
	rm restic.bz2.sha256
	bunzip2 $@.bz2

App/Restic/bin/rclone:
	-mkdir -p App/Restic/bin
	wget https://downloads.rclone.org/v$(RCLONE_VERSION)/rclone-v$(RCLONE_VERSION)-linux-arm-v7.zip -O $@.zip
	echo "$(RCLONE_SHA256) $@.zip" > rclone.zip.sha256
	sha256sum -c rclone.zip.sha256
	rm rclone.zip.sha256
	unzip $@.zip
	mv rclone-v$(RCLONE_VERSION)-linux-arm-v7/rclone $@
	rm -rf rclone-v$(RCLONE_VERSION)-linux-arm-v7

App/Restic/cacert.pem:
	wget https://curl.se/ca/cacert.pem -O $@

restic-onionui.zip: App/Restic/bin/restic App/Restic/bin/rclone App/Restic/cacert.pem
	zip -r restic-onionui.zip App/