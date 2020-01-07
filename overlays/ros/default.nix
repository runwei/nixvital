self: super:

{
  ros-base = self.callPackage ../../pkgs/ros/base/default.nix {};
  
  buildRosPackage = self.callPackage ../../pkgs/ros/build.nix {
    inherit (self.ros-base) ros-python catkin;
  };

  genmsg = self.callPackage ../../pkgs/ros/genmsg {};
  gencpp = self.callPackage ../../pkgs/ros/gencpp {};
  genpy = self.callPackage ../../pkgs/ros/genpy {};
  rosclean = self.callPackage ../../pkgs/ros/rosclean {};
  console_bridge = self.callPackage ../../pkgs/ros/console_bridge {};
  cpp_common = self.callPackage ../../pkgs/ros/cpp_common {};
  rostime = self.callPackage ../../pkgs/ros/rostime {};
  rosunit = self.callPackage ../../pkgs/ros/rosunit {};
  rosconsole = self.callPackage ../../pkgs/ros/rosconsole {};
  rosconsole_bridge = self.callPackage ../../pkgs/ros/rosconsole_bridge {};
  rosmsg = self.callPackage ../../pkgs/ros/rosmsg {};
  roscpp_core = self.callPackage ../../pkgs/ros/roscpp_core {};
  roscpp_traits = self.callPackage ../../pkgs/ros/roscpp_traits {};
  roscpp_serialization = self.callPackage ../../pkgs/ros/roscpp_serialization {};
  message_generation = self.callPackage ../../pkgs/ros/message_generation {};
  roscpp = self.callPackage ../../pkgs/ros/roscpp {}; # Not finished yet.
}
