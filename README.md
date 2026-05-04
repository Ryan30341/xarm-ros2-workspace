# xArm ROS 2 Workspace

ROS 2 Humble colcon workspace for the Hiwonder/LewanSoul xArm 1S robotic arm.

## Overview

This repo contains all ROS 2 packages needed to drive the xArm, process vision, and expose skills to the web interface. It runs on a Linux box (Ubuntu 22.04) with physical USB access to the arm and Intel RealSense D435i camera.

**This code does NOT run on Replit.** It targets a real Linux machine with ROS 2 Humble installed.

## Packages (planned)

| Package | Purpose |
|---------|---------|
| `xarm_hid_driver` | C++ node: HID USB interface to LX bus servos, publishes JointState, accepts trajectory goals |
| `xarm_description` | URDF/SRDF for the Hiwonder xArm 1S (6 revolute joints + gripper) |
| `xarm_moveit_config` | MoveIt 2 config: KDL kinematics, RRTConnect planner, joint limits |
| `xarm_bringup` | Launch files for real hardware and simulation (fake_components) |
| `xarm_vision` | RealSense D435i + OpenCV detection pipeline (AprilTag, vial/beaker detection) |
| `xarm_calibration` | Eye-to-hand camera calibration via AprilTag |
| `xarm_skills` | Action servers: stir, pick_and_place, dispense, glue, transfer, wait |
| `xarm_skills_msgs` | Custom .action/.msg definitions for skill interfaces |
| `xarm_bridge` | FastAPI REST gateway + rosbridge_server launch |

## Prerequisites

- Ubuntu 22.04
- ROS 2 Humble (desktop-full)
- MoveIt 2
- libhidapi-dev
- Intel RealSense SDK 2.0 + realsense2_camera ROS 2 package
- Python 3.10+

## Quick Start

```bash
# Clone the parent repo with all submodules
git clone --recursive https://github.com/Ryan30341/xarm-web-interface.git
cd xarm-web-interface/xarm_ros2

# Build
source /opt/ros/humble/setup.bash
colcon build --symlink-install

# Launch (real hardware)
source install/setup.bash
ros2 launch xarm_bringup bringup.launch.py

# Launch (simulation, no hardware needed)
ros2 launch xarm_bringup simulation.launch.py
```

## USB Setup

Add the udev rule for the Hiwonder xArm (VID 0x0483, PID 0x5750):

```bash
echo 'SUBSYSTEM=="hidraw", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5750", MODE="0666", GROUP="plugdev"' | sudo tee /etc/udev/rules.d/99-hiwonder-xarm.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
```

## Part of

[`xarm-web-interface`](https://github.com/Ryan30341/xarm-web-interface) — umbrella repo for the full system.
