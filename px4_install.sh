cd
git clone https://github.com/PX4/PX4-Autopilot.git
cd PX4-Autopilot
git checkout v1.10.1
git submodule sync --recursive
git submodule update --init --recursive
cd src/lib/mixer
sudo rm mixer_multirotor.cpp
git clone https://github.com/rladntjd/px4_noise_multirotormixer.git
sudo mv px4_noise_multirotormixer/mixer_multirotor.cpp mixer_multirotor.cpp
sudo rm -r -f px4_noise_multirotormixer
cd 
cd PX4-Autopilot
bash Tools/setup/ubuntu.sh
sudo apt install python-pip
sudo apt-get update
sudo apt-get install python-jinja2 
pip install numpy toml
