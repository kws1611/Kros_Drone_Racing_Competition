cd
git clone https://github.com/Microsoft/AirSim.git
cd AirSim

./setup.sh
./build.sh

sudo apt-get install gcc-8 g++-8
sudo apt-get install ros-melodic-tf2-sensor-msgs ros-melodic-tf2-geometry-msgs ros-melodic-mavros*

cd ros
source /opt/ros/melodic/setup.bash
catkin build -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8

echo "source ~/AirSim/ros/devel/setup.bash" >> ~/.bashrc
