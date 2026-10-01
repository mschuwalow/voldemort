{
  mkShell,
  jdk8,
  oldPkgs
}:

mkShell {
  packages = [ jdk8 oldPkgs.gradle ];
  env = {
    JAVA_HOME = jdk8.home;
  };
}
