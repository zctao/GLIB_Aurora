library ieee;
use ieee.std_logic_1164.all;
package system_version_package is
  constant sys_ver_major:integer range 0 to 15 :=3;
  constant sys_ver_minor:integer range 0 to 15 :=2;
  constant sys_ver_build:integer range 0 to 255:=0;
  constant sys_ver_year :integer range 0 to 99 :=13;
  constant sys_ver_month:integer range 0 to 12 :=04;
  constant sys_ver_day  :integer range 0 to 31 :=18;
end system_version_package;
package body system_version_package is
end system_version_package;