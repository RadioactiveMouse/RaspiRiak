#RaspiRiak

Script to make it easy to install Riak on the Raspberry Pi. This is mainly useful for multi-machine deployments as it takes quite a while to compile.

## Download

To build the latest master branch run the following to download the file to your machine

	curl https://raw.github.com/RadioactiveMouse/RaspiRiak/master/riak.sh

You may also need to change the permissions of the script using

	sudo chmod +x riak.sh

For specific releases please use the correct release branch e.g

	curl https://raw.github.com/RadioactiveMouse/RaspiRiak/1.4.0/riak.sh

## Tested on

* 256 Mb Model B
* 512 Mb Model B

## Usage

Running the following command should install Riak onto your raspberry pi

	sudo ./riak.sh

## Notes

Please ensure the highest amount of RAM is avaiable to the CPU as we won't need the GPU for this part. To do that please run

	sudo raspi-config

Also it may be beneficial to overclock the CPU in order to speed up build time. Please be aware that the higher settings can sometimes cause memory corruption. This can be set in the same way as the memory split detailed above.

Average build time is around 39mins.

## Licence

MIT
