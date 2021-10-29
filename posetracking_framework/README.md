In the Mediepipe folder, we can run this command to compile the iOS framework

```
bazel build --config=ios_arm64 mediapipe/examples/ios/posetracking_framework:PoseTrackingGpuApp
```

Then you will get the generated framework in this path.
```
bazel-bin/mediapipe/examples/ios/posetracking_framework
```

This is the framework package included the models.

```
bazel-bin/mediapipe/examples/ios/posetracking_framework/PoseTrackingGpuApp.zip
```
