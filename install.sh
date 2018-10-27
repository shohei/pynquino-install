sudo echo ""
echo "***********************"
echo "Pynquino install script"
echo "***********************"
sudo service ntp start
cd ~
git clone https://github.com/shohei/metakernel.git 
cd metakernel
sudo python3.6 setup.py install
mkdir ~/jupyter_notebooks/pynquino
cp -r "examples/Pynquino example.ipynb" ~/jupyter_notebooks/pynquino/
cp -r "examples/initHW.html" ~/jupyter_notebooks/pynquino/
cp -r "examples/initHW.xml" ~/jupyter_notebooks/pynquino/
cd ~/pynq/lib/arduino
git clone https://github.com/shohei/zsprinter-pynquino.git
cd zsprinter-pynquino
cp arduino_zsprinter.py python/constants.py ..
cd arduino_zsprinter/Debug
make mrproper && make
cp arduino_zsprinter.bin ../../../
cp ~/pynq/lib/arduino/zsprinter-pynquino/python/pynq_lib_init.py ~/pynq/lib/__init__.py
cp ~/pynq/lib/arduino/zsprinter-pynquino/python/pynq_lib_arduino_init.py ~/pynq/lib/arduino/__init__.py
cp ~/pynq/lib/arduino/zsprinter-pynquino/overlay/pynquino.* ~/pynq/overlays/base/
sudo reboot
