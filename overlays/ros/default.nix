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
}