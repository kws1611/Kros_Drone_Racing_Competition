cd
sudo apt-get install ros-melodic-mavros ros-melodic-mavros-extras
sudo apt-get install ros-melodic-tf2-sensor-msgs ros-melodic-tf2-geometry-msgs ros-melodic-mavros*
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh

mkdir -p ~/kros_ws/src
cd ~/kros_ws
catkin init
wstool init src
echo "source ~/kros_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

wstool init ~/kros_ws/src

rosinstall_generator --rosdistro melodic mavlink | tee /tmp/mavros.rosinstall

rosinstall_generator --upstream mavros | tee -a /tmp/mavros.rosinstall

wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4
rosdep install --from-paths src --ignore-src -y

./src/mavros/mavros/scripts/install_geographiclib_datasets.sh

source /opt/ros/melodic/setup.bash

catkin build
source ~/.bashrc
