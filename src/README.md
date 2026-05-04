# ROS 2 Packages

This `src/` directory contains the ROS 2 packages for the xArm project.

## Planned Packages

| Package | Status | Task |
|---------|--------|------|
| `xarm_hid_driver` | Planned | Task #3 |
| `xarm_description` | Planned | Task #3 |
| `xarm_moveit_config` | Planned | Task #3 |
| `xarm_bringup` | Planned | Task #3 |
| `xarm_vision` | Planned | Task #4 |
| `xarm_calibration` | Planned | Task #4 |
| `xarm_skills_msgs` | Planned | Task #5 |
| `xarm_skills` | Planned | Task #5 |
| `xarm_bridge` | Planned | Task #5 |

## Build

```bash
source /opt/ros/humble/setup.bash
cd /path/to/xarm-ros2-workspace
colcon build --symlink-install
source install/setup.bash
```
