FROM ros:kinetic

RUN apt-get update && apt-get install -y python3-pip python3-apt wget
RUN touch /etc/apt/sources.list.d/gazebo-stable.list
RUN chmod 666 /etc/apt/sources.list.d/gazebo-stable.list
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN apt-get update

RUN touch /etc/ros/rosdep/sources.list.d/00-gazebo9.list
RUN chmod 666 /etc/ros/rosdep/sources.list.d/00-gazebo9.list
RUN echo "yaml https://github.com/osrf/osrf-rosdep/raw/master/gazebo9/gazebo.yaml \
    yaml https://github.com/osrf/osrf-rosdep/raw/master/gazebo9/releases/indigo.yaml indigo \
    yaml https://github.com/osrf/osrf-rosdep/raw/master/gazebo9/releases/jade.yaml jade \
    yaml https://github.com/osrf/osrf-rosdep/raw/master/gazebo9/releases/kinetic.yaml kinetic \
    yaml https://github.com/osrf/osrf-rosdep/raw/master/gazebo9/releases/lunar.yaml lunar" >> /etc/ros/rosdep/sources.list.d/00-gazebo9.list
 
RUN pip3 install -U setuptools pip
RUN pip3 install colcon-ros-bundle