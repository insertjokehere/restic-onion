package: restic-onionui.zip

clean:
	@rm restic-onionui.zip
	@rm App/Restic/restic

App/Restic/restic:
	wget https://github.com/restic/restic/releases/download/v0.16.4/restic_0.16.4_linux_arm.bz2 -O $@.bz2
	bunzip2 $@.bz2

restic-onionui.zip: App/Restic/restic
	zip -r restic-onionui.zip App/