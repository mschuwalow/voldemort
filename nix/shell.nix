{
  mkShell,
  jdk8
}:

mkShell {
  packages = [ jdk8 ];
  env = {
    JAVA_HOME = jdk8.home;
  };
}
