FROM ros:humble-perception

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DOMAIN_ID=0
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

RUN apt-get update && apt-get install -y \
    libhidapi-dev \
    libhidapi-libusb0 \
    python3-pip \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-rosbridge-suite \
    ros-humble-moveit \
    ros-humble-moveit-setup-assistant \
    ros-humble-controller-manager \
    ros-humble-joint-state-broadcaster \
    ros-humble-joint-trajectory-controller \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    fastapi \
    uvicorn \
    roslibpy \
    aiortc \
    opencv-contrib-python-headless \
    pupil-apriltags

WORKDIR /ros2_ws
COPY src/ /ros2_ws/src/

RUN . /opt/ros/humble/setup.sh && \
    colcon build --symlink-install && \
    echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc && \
    echo "source /ros2_ws/install/setup.bash" >> /root/.bashrc

CMD ["bash"]
